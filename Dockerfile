from docker.pkg.github.com/fiddlerwoaroof/pandoc-builder/builder_base:latest

COPY paper.md paper.bib preamble /process/paper/
ENTRYPOINT ./process.sh make
