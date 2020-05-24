from debian:sid

run apt update -y
run apt full-upgrade -y
run apt install -y biber fonts-alegreya-sans fonts-cardo fonts-lato latexmk pandoc texlive-bibtex-extra texlive-humanities texlive-latex-extra texlive-science texlive-xetex xz-utils zsh
run adduser --system latex

run mkdir -p /process && chown -R latex: /process
add https://raw.githubusercontent.com/fiddlerwoaroof/dotfiles/master/scripts/start_paper /process/start_paper
run chmod +rx /process/start_paper

user latex
run cd /process/ && /process/start_paper /process/paper

workdir /process/paper

COPY paper.md paper.bib preamble /process/paper/

ENTRYPOINT ./process.sh make
