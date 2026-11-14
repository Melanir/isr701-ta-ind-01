# Bitácora de trabajo — TA-IND-01

Melanie Michelle Muñoz Vera

## 12 de noviembre de 2026

Anuncié en WhatsApp que analizaría Apache Cassandra y lo compararía con MongoDB. Leí y marqué fragmentos de tres artículos para el Anexo B. Al intentar abrir el artículo de IEEE encontré un bloqueo de acceso. Con ayuda de Codex localicé la copia publicada en el repositorio de Tilburg University y pude tomar mi propia captura de la página 63432.

Instalé Docker Desktop. Codex preparó la configuración, levantó los tres nodos de Cassandra, creó la tabla de prueba con factor de replicación 3 y se encargó de detener y volver a iniciar dos nodos. Yo ejecuté las consultas en PowerShell y tomé las cuatro capturas. Con los tres nodos activos, `ONE` y `QUORUM` devolvieron el mismo dato. Con un solo nodo activo, `ONE` siguió respondiendo y `QUORUM` mostró que requería dos réplicas. Después de recuperar los nodos, la lectura con `QUORUM` volvió a funcionar.

Usé IA como apoyo para traducir fragmentos en inglés, localizar fuentes verificables, contrastar sus datos bibliográficos con los DOI y seguir los pasos de la prueba. Codex de OpenAI también redactó esta entrada con base en lo que hicimos y organizó los comandos y los resultados a partir de mis capturas originales.

**Tiempo dedicado:** aproximadamente 5 horas.

**Registro en GitHub.** [Fuentes](https://github.com/Melanir/isr701-ta-ind-01/commit/b0bad13) · [Capturas de lectura](anexos/lectura/) · [Prueba de Cassandra](https://github.com/Melanir/isr701-ta-ind-01/commit/4502591).

**Próximo paso.** Hacer el bosquejo de la arquitectura a mano, con mi nombre y la fecha, y usarlo como base para el diagrama digital.

## 13 de noviembre de 2026

Hice el bosquejo a mano y revisé el diagrama digital para que mostrara PowerShell, cqlsh y el nodo coordinador. Revisé los borradores de la introducción, el análisis de la Unidad 1, la práctica y los ejemplos. Corregí el ejemplo de la elección del tema porque el anuncio se hizo en WhatsApp. La comparación técnica quedó para la siguiente sesión.

**Tiempo dedicado:** más de 6 horas.

## 14 de noviembre de 2026

Revisé la comparación entre Cassandra y MongoDB. La prueba había medido la disponibilidad de una lectura en Cassandra, así que la comparación con MongoDB se apoyó en su documentación. Con apoyo de Codex se integraron las secciones finales, las capturas de los anexos y la declaración de uso de IA. Se compiló el informe con pdfLaTeX y Biber.

**Tiempo dedicado:** 3 horas.
