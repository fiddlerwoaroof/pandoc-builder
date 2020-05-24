set -e
docker build --tag paper_builder:latest .
docker run --name paper_builder paper_builder:latest
docker cp paper_builder:/process/paper/proc/paper.tex .
docker cp paper_builder:/process/paper/paper.pdf .
docker rm paper_builder
tar zcf release.tgz paper.tex paper.pdf paper.md paper.bib preamble
