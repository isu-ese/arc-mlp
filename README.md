# Arc MultiLingual Parsers

## Dependencies

This project has several dependencies. Here are instructions to install each one:

### Haskell platform

This installs the newest version of the haskell platform on the system.

```bash
# install ghc and cabal
curl -sSf https://get-ghcup.haskell.org | sh

# add ghc environmental settings on start of terminal session
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

*Note: There is a healthy chance that you'll get errors regarding Rscript or other missing programs. These errors can be safely ignored. They are only used to build the README.md file which is not needed to use the tool.*

### Fonts

This project uses the Futura LT BT font. To install, execute the following command:

```bash
mkdir -p ~/.fonts && curl https://www.cufonfonts.com/download/font/futura-lt-bt > /tmp/futura-lt-bt-fonts.zip && unzip /tmp/futura-lt-bt-fonts.zip -d ~/.fonts
```

## Building the documents

To build the report or the proposal, first switch to the `report` directory.

```bash
# Build report
./build report

# Build proposal
./build proposal

# Build report intermediary files
./build_latex report

# Build proposal intermediary files
./build_latex proposal
```

## Building the presentation

To build the presentation you will need the same dependencies as noted above

You can then build the presentation via the following command:

```
$ presentation/build.sh
```
