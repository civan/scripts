set -ex
#!/usr/bin/env/ sh

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
    mkdir $GROW_VERSIONS_DIR
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

  #adds the alias to the shell
  echo "alias grow@$VERSION=$DIRECTORY/grow" >> $SHELL_FILE

else
  echo "Grow $VERSION is already installed! run grow@$VERSION --version"
fi
