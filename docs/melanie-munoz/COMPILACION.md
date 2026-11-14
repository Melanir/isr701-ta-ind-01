# Compilación del informe

Informe académico individual sobre Apache Cassandra y MongoDB.

- [Informe en PDF](TA-IND-01-informe.pdf)
- [Bitácora de trabajo](BITACORA.md)
- [Comandos](experimento/COMANDOS.md) y [resultados de la prueba](experimento/RESULTADOS.md)

Para compilar el informe, instala LaTeX con Biber y el estilo bibliográfico IEEE. Desde la carpeta del repositorio, ejecuta lo siguiente.

    cd docs/melanie-munoz
    pdflatex -halt-on-error -jobname=TA-IND-01-informe informe.tex
    biber TA-IND-01-informe
    pdflatex -halt-on-error -jobname=TA-IND-01-informe informe.tex
    pdflatex -halt-on-error -jobname=TA-IND-01-informe informe.tex
