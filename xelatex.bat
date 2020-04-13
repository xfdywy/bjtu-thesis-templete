docker run -i --rm -w /data -v "%cd%:/data" tianon/latex xelatex  -synctex=1 -interaction=nonstopmode  %*


 