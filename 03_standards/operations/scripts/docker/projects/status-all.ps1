docker compose -p comercial_platform ps
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
docker network inspect jobcron_network --format "network={{.Name}} containers={{len .Containers}}"
