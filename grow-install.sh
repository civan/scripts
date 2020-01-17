set -e
#!/usr/bin/env/ sh

if [ -z "$1" ]; then
  echo "usage: $0 <version>"
  exit 1
fi

TEMPDIR="/tmp"
TEMP_ZIP="$TEMPDIR/temp_grow.zip"
VERSION="${1}"
GROW_VERSIONS_DIR="$HOME/bin/grow-versions"
DIRECTORY="$GROW_VERSIONS_DIR/$VERSION";

# checks the system
SYSTEM="Grow-SDK-Mac";
if [ "$(uname)" == "Linux" ]; then
  SYSTEM="Grow-SDK-Linux";
fi

GROW_RELEASES="https://github.com/grow/grow/releases/download";
BINARY_URL="$GROW_RELEASES/$VERSION/$SYSTEM-$VERSION.zip";
SHELL_FILE="$HOME/.zshrc";

if [ ! -d "$DIRECTORY" ]; then
  # creates the version folder
  if [ ! -d "$GROW_VERSIONS_DIR" ]; then
    mkdir -p $GROW_VERSIONS_DIR
  fi

  # gets the file version
  curl -Lk $BINARY_URL -o $TEMP_ZIP;

  # unzips the temp file
  unzip $TEMP_ZIP -d $DIRECTORY;

  #removes the temp file
  rm $TEMP_ZIP;

  # checks corect shell file
  if [ -n "$ZSH" ]; then
    echo 'using zsh';
    SHELL_FILE="$HOME/.zshrc";
  elif [ -n "$BASH_VERSION" ]; then
    echo 'using bash';
    SHELL_FILE="$HOME/.bash_profile";
  else
    echo 'using other';
    SHELL_FILE="$HOME/.zshrc";
  fi

  #creates a symbolic link to ~/bin/
  ln -s $DIRECTORY/grow $HOME/bin/grow@$VERSION

  echo "Installed new version: $VERSION."

else
  echo "Grow $VERSION is already installed! run grow@$VERSION --version"
fi
