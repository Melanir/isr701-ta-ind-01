# TA-IND-01 — Informe Académico Individual

**Análisis crítico de sistemas distribuidos (Unidad 1)**
Melanie Michelle Muñoz Vera · Aplicaciones Distribuidas · UTEQ · Séptimo nivel, paralelo B

El informe compara Apache Cassandra con MongoDB. En la prueba con tres nodos de Cassandra en Docker, una lectura con `ONE` siguió disponible al detener dos nodos. La lectura con `QUORUM` volvió a funcionar cuando se recuperaron los nodos.

## Entrega

| Documento | Enlace |
| --- | --- |
| Informe final con anexos y declaración de IA | [Abrir PDF](docs/melanie-munoz/TA-IND-01-informe.pdf) |
| Carátula de una página | [Abrir carátula](docs/melanie-munoz/TA-IND-01-caratula-corregida.pdf) |
| Sustentación | [Ver video en YouTube](https://youtu.be/R3fPMrh5Cv8) |

## Archivos del proyecto

Todo el material está en [docs/melanie-munoz](docs/melanie-munoz/). Los PDF de entrega están junto a los archivos fuente. Las carpetas `anexos/`, `experimento/` y `borradores/` contienen la evidencia y los avances.

| Material | Enlace |
| --- | --- |
| Fuente LaTeX y bibliografía | [informe.tex](docs/melanie-munoz/informe.tex) · [referencias.bib](docs/melanie-munoz/referencias.bib) |
| Registro del trabajo | [Bitácora](docs/melanie-munoz/BITACORA.md) |
| Experimento con Cassandra | [Comandos](docs/melanie-munoz/experimento/COMANDOS.md) · [Resultados](docs/melanie-munoz/experimento/RESULTADOS.md) · [Capturas](docs/melanie-munoz/experimento/capturas/) |
| Anexos | [Bosquejo y diagrama](docs/melanie-munoz/anexos/) · [Capturas de lectura](docs/melanie-munoz/anexos/lectura/) |
| Avances del informe | [Borradores por sección](docs/melanie-munoz/borradores/) |

## Compilar el informe

El compilador es **pdfLaTeX** y el archivo principal es [informe.tex](docs/melanie-munoz/informe.tex). Biber procesa [referencias.bib](docs/melanie-munoz/referencias.bib) con el estilo IEEE.

**Dependencias.** Una distribución como TeX Live o MiKTeX con `pdflatex`, `biber`, `biblatex` y `biblatex-ieee`. El documento también usa `inputenc`, `fontenc`, `babel` con español, `geometry`, `graphicx`, `booktabs`, `csquotes`, `float`, `tabularx`, `xurl` y `hyperref`. Conserva las imágenes en `anexos/` y `experimento/capturas/`.

Desde la raíz del repositorio, ejecuta los comandos en este orden.

```sh
cd docs/melanie-munoz
pdflatex -halt-on-error -jobname=TA-IND-01-informe informe.tex
biber TA-IND-01-informe
pdflatex -halt-on-error -jobname=TA-IND-01-informe informe.tex
pdflatex -halt-on-error -jobname=TA-IND-01-informe informe.tex
```

El resultado es `docs/melanie-munoz/TA-IND-01-informe.pdf`.
