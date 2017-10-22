# scripts
Bash ustilities.

## PATH
make sure you have the ~/scripts folder in your $PATH.
If not add this in your profile file:
```
 export PATH=$PATH:$HOME/scripts
```

## Permisions
Give the rigth permision to the scripts:

```
chmod +x 744 ~/scripts/*
```

## Current scripts:
### grow-version.sh
To install multiple versions of [grow](https://github.com/grow/grow/releases/).

Installing 0.2.0 version:
```
grow-version.sh 0.2.0
```

Then refresh your shell.

Usage:
```
grow@0.2.0 --version
```
