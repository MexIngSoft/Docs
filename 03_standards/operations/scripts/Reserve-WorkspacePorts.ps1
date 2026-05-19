[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [switch]$KillConflicts,
    [switch]$IncludeDockerProcesses,
    [switch]$RegisterScheduledTask,
    [switch]$UnregisterScheduledTask,
    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

$taskName = "WorkspaceComercialReservePorts"
$scriptPath = $PSCommandPath

$portGroups = @(
    @{ Name = "Nginx"; Ports = @(80, 443) },
    @{ Name = "PostgreSQL"; Ports = @(5432) },
    @{ Name = "Web Next.js"; Ports = 3000..3050 },
    @{ Name = "Django APIs"; Ports = 8000..8050 }
)

$dockerProcessNames = @(
    "com.docker.backend",
    "com.docker.proxy",
    "docker",
    "docker-proxy",
    "wslrelay"
)

function Get-WorkspacePortList {
    $ports = New-Object System.Collections.Generic.List[int]
    foreach ($group in $portGroups) {
        foreach ($port in $group.Ports) {
            if (-not $ports.Contains([int]$port)) {
                $ports.Add([int]$port)
            }
        }
    }
    return $ports | Sort-Object
}

function Test-IsAdministrator {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal]::new($identity)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Get-PortOwner {
    param([int]$Port)

    $connections = Get-NetTCPConnection -LocalPort $Port -ErrorAction SilentlyContinue |
        Where-Object { $_.State -eq "Listen" }

    foreach ($connection in $connections) {
        $process = Get-Process -Id $connection.OwningProcess -ErrorAction SilentlyContinue
        if ($process) {
            [PSCustomObject]@{
                Port = $Port
                Address = $connection.LocalAddress
                ProcessId = $process.Id
                ProcessName = $process.ProcessName
                Path = $process.Path
            }
        }
    }
}

function Register-PortReservationTask {
    if (-not (Test-IsAdministrator)) {
        throw "Ejecuta PowerShell como Administrador para registrar la tarea programada."
    }

    $action = New-ScheduledTaskAction `
        -Execute "powershell.exe" `
        -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`" -KillConflicts"
    $trigger = New-ScheduledTaskTrigger -AtLogOn
    $principal = New-ScheduledTaskPrincipal `
        -UserId $env:USERNAME `
        -LogonType Interactive `
        -RunLevel Highest

    if ($PSCmdlet.ShouldProcess($taskName, "Register scheduled task")) {
        Register-ScheduledTask `
            -TaskName $taskName `
            -Action $action `
            -Trigger $trigger `
            -Principal $principal `
            -Description "Libera puertos locales reservados para Workspace.Comercial antes de levantar Docker." `
            -Force | Out-Null
    }
}

function Unregister-PortReservationTask {
    if (-not (Test-IsAdministrator)) {
        throw "Ejecuta PowerShell como Administrador para eliminar la tarea programada."
    }

    if ($PSCmdlet.ShouldProcess($taskName, "Unregister scheduled task")) {
        Unregister-ScheduledTask -TaskName $taskName -Confirm:$false -ErrorAction SilentlyContinue
    }
}

if ($RegisterScheduledTask -and $UnregisterScheduledTask) {
    throw "Usa solo -RegisterScheduledTask o -UnregisterScheduledTask, no ambos."
}

if ($RegisterScheduledTask) {
    Register-PortReservationTask
    Write-Host "Tarea programada registrada: $taskName"
    return
}

if ($UnregisterScheduledTask) {
    Unregister-PortReservationTask
    Write-Host "Tarea programada eliminada si existia: $taskName"
    return
}

$ports = Get-WorkspacePortList
$owners = foreach ($port in $ports) { Get-PortOwner -Port $port }

Write-Host "Puertos administrados:"
foreach ($group in $portGroups) {
    $sortedGroupPorts = @($group.Ports | Sort-Object)
    $isConsecutive = $true
    for ($i = 1; $i -lt $sortedGroupPorts.Count; $i++) {
        if ($sortedGroupPorts[$i] -ne ($sortedGroupPorts[$i - 1] + 1)) {
            $isConsecutive = $false
            break
        }
    }
    $rangeText = if ($sortedGroupPorts.Count -gt 1 -and $isConsecutive) {
        "$($sortedGroupPorts[0])-$($sortedGroupPorts[-1])"
    } elseif ($sortedGroupPorts.Count -gt 1) {
        $sortedGroupPorts -join ", "
    } else {
        "$($sortedGroupPorts[0])"
    }
    Write-Host "- $($group.Name): $rangeText"
}

if (-not $owners) {
    Write-Host "No hay procesos escuchando en los puertos reservados."
    return
}

Write-Host ""
Write-Host "Procesos detectados:"
$owners | Sort-Object Port, ProcessId | Format-Table Port, Address, ProcessId, ProcessName, Path -AutoSize

if (-not $KillConflicts -or $DryRun) {
    Write-Host ""
    Write-Host "Modo diagnostico: no se detuvo ningun proceso. Usa -KillConflicts para liberar puertos."
    return
}

$processesToStop = $owners |
    Where-Object {
        $IncludeDockerProcesses -or ($dockerProcessNames -notcontains $_.ProcessName)
    } |
    Sort-Object ProcessId -Unique

if (-not $processesToStop) {
    Write-Host "Solo se detectaron procesos Docker o no habia procesos detenibles."
    return
}

foreach ($owner in $processesToStop) {
    $target = "$($owner.ProcessName) [$($owner.ProcessId)] en puerto $($owner.Port)"
    if ($PSCmdlet.ShouldProcess($target, "Stop process")) {
        Stop-Process -Id $owner.ProcessId -Force
        Write-Host "Proceso detenido: $target"
    }
}

Write-Host "Puertos liberados. Levanta Docker en el orden documentado."
