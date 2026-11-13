# Comandos del experimento de Cassandra

Ejecuta los bloques en PowerShell desde esta carpeta. La prueba usa Cassandra 5.0.9, tres contenedores y factor de replicación 3 en `datacenter1`.

## Preparación

```powershell
$docker = "$env:LOCALAPPDATA\Programs\DockerDesktop\resources\bin\docker.exe"
$env:Path = "$(Split-Path -Parent $docker);$env:Path"
& $docker pull cassandra:5.0.9
& $docker compose -f compose.yaml up -d --wait --wait-timeout 420
& $docker exec ta-ind-cassandra-nodo1-1 nodetool status
Get-Content -Raw preparar.cql | & $docker exec -i ta-ind-cassandra-nodo1-1 cqlsh
& $docker exec ta-ind-cassandra-nodo1-1 cqlsh -e "SELECT replication FROM system_schema.keyspaces WHERE keyspace_name = 'ta_ind_01';"
```

## Antes de detener los nodos

```powershell
Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
@'
CONSISTENCY ALL;
INSERT INTO ta_ind_01.prueba (id, mensaje) VALUES (1, 'Prueba de Melanie');
CONSISTENCY ONE;
SELECT * FROM ta_ind_01.prueba WHERE id = 1;
CONSISTENCY QUORUM;
SELECT * FROM ta_ind_01.prueba WHERE id = 1;
'@ | & $docker exec -i ta-ind-cassandra-nodo1-1 cqlsh
```

## Con dos nodos detenidos

```powershell
& $docker compose -f compose.yaml stop nodo2 nodo3
Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
& $docker exec ta-ind-cassandra-nodo1-1 nodetool status
```

Repite `nodetool status` hasta ver una fila `UN` y dos `DN`. Luego ejecuta las dos consultas.

```powershell
@'
CONSISTENCY ONE;
SELECT * FROM ta_ind_01.prueba WHERE id = 1;
CONSISTENCY QUORUM;
SELECT * FROM ta_ind_01.prueba WHERE id = 1;
'@ | & $docker exec -i ta-ind-cassandra-nodo1-1 cqlsh
```

## Después de recuperar los nodos

```powershell
& $docker compose -f compose.yaml up -d --wait --wait-timeout 360
Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
& $docker exec ta-ind-cassandra-nodo1-1 nodetool status
& $docker exec ta-ind-cassandra-nodo1-1 cqlsh -e 'CONSISTENCY QUORUM; SELECT * FROM ta_ind_01.prueba WHERE id = 1;'
```

Consulta las [salidas observadas y las capturas](RESULTADOS.md).
