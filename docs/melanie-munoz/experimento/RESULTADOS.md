# Resultados observados en Cassandra

Prueba del 12 de noviembre de 2026, hora de Ecuador continental (UTC−05:00). Los bloques son transcripciones parciales de las capturas originales. Se omitieron columnas y líneas de terminal para facilitar la lectura.

| Etapa | Hora mostrada | Nodos activos | ONE | QUORUM |
|---|---|---:|---|---|
| Antes de detener los nodos | 19:19:31 | 3 | Devuelve la fila 1 | Devuelve la fila 1 |
| Con dos nodos detenidos | 19:21:23 | 1 | Devuelve la fila 1 | Error `Unavailable` |
| Después de recuperar los nodos | 19:24:31 | 3 | — | Devuelve la fila 1 |

## Antes de detener los nodos

`nodetool status` muestra tres filas `UN` a las 19:15:23. [Captura 1](capturas/01-tres-nodos-activos.png)

```text
UN  172.18.0.3
UN  172.18.0.4
UN  172.18.0.2
```

Tras insertar la fila con `ALL`, ambas lecturas devuelven el mismo dato. [Captura 2](capturas/02-lecturas-con-tres-nodos.png)

```text
Consistency level set to ALL.
Consistency level set to ONE.
  1 | Prueba de Melanie
(1 rows)
Consistency level set to QUORUM.
  1 | Prueba de Melanie
(1 rows)
```

## Con dos nodos detenidos

El nodo 1 sigue activo. El cliente muestra `NoHostAvailable` con una excepción `Unavailable` del servidor para la consulta con `QUORUM`. [Captura 3](capturas/03-lecturas-con-un-nodo.png)

```text
DN  172.18.0.3
DN  172.18.0.4
UN  172.18.0.2
Consistency level set to ONE.
  1 | Prueba de Melanie
(1 rows)
Cannot achieve consistency level QUORUM
```

El detalle del error indica dos réplicas requeridas (`required_replicas`) y una activa (`alive_replicas`).

## Después de recuperar los nodos

Los tres nodos vuelven a `UN` y la lectura con `QUORUM` devuelve la fila. [Captura 4](capturas/04-lectura-quorum-recuperada.png)

```text
UN  172.18.0.3
UN  172.18.0.4
UN  172.18.0.2
Consistency level set to QUORUM.
  1 | Prueba de Melanie
(1 rows)
```

## Alcance de la prueba

Con factor de replicación 3, `ONE` pudo leer con la única réplica activa y `QUORUM` exigió dos. El experimento observa la disponibilidad de lectura de una fila escrita antes de detener los nodos. La intervención fue una parada controlada de contenedores. Quedan fuera del alcance la latencia, las escrituras concurrentes y el comportamiento durante una partición de red.
