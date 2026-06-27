$projects = @("jobcron", "tecnotelec", "lexnova", "docucore", "fiscora", "imagrafity", "refapart", "mexingsof")
foreach ($project in $projects) {
    & "$PSScriptRoot\Invoke-WorkspaceProjectDocker.ps1" -Project $project -Action health
}
