# Arc MultiLingual Parsers

## Dependencies

This project has several dependencies. Here are instructions to install each one:

### Haskell platform

This installs the newest version of the haskell platform on the system.

```bash
# install ghc and cabal
curl -sSf https://get-ghcup.haskell.org | sh

# add ghc environmental settings on start of terminal session
cp ~/.bashrc ~/.bashrc.backup
echo ". $HOME/.ghcup/env" >> ~/.bashrc

# effectively reload bash (restarting terminal is also an option)
. ~/.bashrc

# update cabal
cabal new-install cabal-install

# install stack
curl -sSL https://get.haskellstack.org/ | sh
```

### Pandoc and extensions

We use cabal to install the newest version of pandoc and extensions.

```bash
cabal new-install pandoc pandoc-crossref pandoc-citeproc
```

### LaTeX dependencies

Ubuntu:

```bash
sudo apt install texlive-xelatex texlive-publishers texlive-science
```

### PP

PP is a preprocessor designed for use with pandoc. PP can be installed from source. Instructions: https://github.com/CDSoft/pp.

```bash
git clone git@github.com:CDSoft/pp.git
cd pp
make
make install
```

*Note: There is a healthy chance that you'll get errors regarding Rscript or other missing programs. These errors can be safely ignored. They are only used to build the README.md file of the pp project which is not needed to use the tool.*

### Fonts

This project uses the Futura LT BT font. To install, execute the following command:

```bash
mkdir -p ~/.fonts && curl https://www.cufonfonts.com/download/font/futura-lt-bt > /tmp/futura-lt-bt-fonts.zip && unzip /tmp/futura-lt-bt-fonts.zip -d ~/.fonts
```

## Building the documents

To build the report or the proposal, first switch to the `report` directory.

```bash
# Build report
./build.sh report

# Build proposal
./build.sh proposal

# Build report intermediary files
./build_latex.sh report

# Build proposal intermediary files
./build_latex.sh proposal
```

## Building the presentation

To build the presentation you will need the same dependencies as noted above

You can then build the presentation via the following command:

```bash
$ presentation/build.sh
```

## Cleanup generated files

The `clean.sh` script will cleanup files generated in any directory.

## Setting up Zettlr and Zotero workflow

Install Zotero: https://www.zotero.org/download/

Install Zettlr: https://www.zettlr.com

Follow instructions to integrate Zotero with Zettlr: https://docs.zettlr.com/academic/citations/.
Have the exported library overwrite `isu-ese.json`. In the preferences > export settings of Zettlr, use the `isu-ese.json` and `ieee.csl` files for CSL JSON Database and CSL-Style.

## Important changes from template

* Addition of `.gitignore` and `clean.sh` to create a cleaner repository.
* Addition of `ieee.csl` and `isu-ese.json` to shift citation handling from bibtex to pandoc.
* Bug fixes in `presentation/template.latex`, `templates/ieee.latex`, and `report/metadata.yml.mdpp`.
* Replacement of `markdown-pp` with `pp` because `pp` is better suited and supports indenting included code and includes many other useful features such as allowing graphviz files to be embedded.
* Refactor of build scripts to eliminate code duplication.
* Renamed directory aggregate files to `all.md`. This is to make it easier to tell which files are merely aggregating other files by convention.
* Converted all `mdpp` extensions to `md`. This is so that Zettlr will allow opening such files.
