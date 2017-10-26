set -e
#!/usr/bin/env/ sh

if [ -z "$1" ]; then
  echo "usage: $0 <version>"
  exit 1
fi

VERSION="${1}"
GROW_VERSIONS_DIR="$HOME/bin/grow-versions"
DIRECTORY="$GROW_VERSIONS_DIR/$VERSION";

# checks if  the version is NOT installed
if [ ! -f "$DIRECTORY/grow" ]; then
 sh $HOME/scripts/grow-install.sh $VERSION
fi

# removes the actual grow
if [ -f $HOME/bin/grow ]; then
    rm $HOME/bin/grow
fi

# creates a sym link to the grow version
ln -s $DIRECTORY/grow $HOME/bin/grow
echo "Updated $HOME/bin/grow to $VERSION"
