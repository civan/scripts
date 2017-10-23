# scripts
Bash ustilities.

## Installation

git clone https://github.com/civan/scripts.git ~/scripts

## PATH
make sure you have the ~/scripts folder in your $PATH.
If not, add this in your profile file:
```
 export PATH=$PATH:$HOME/bin:$HOME/scripts
```

## Permisions
Grant the execute permision to the scripts folder:

```
chmod +x ~/scripts/*
```


## Script List:
### grow-use.sh
Lets you to change the current version of [grow](https://github.com/grow/grow/releases/).

Usage:
```
grow-use.sh 0.2.1
```

now you can use 0.2.1 as your main version:
```
grow --version
```

### grow-version.sh
Installs multiple versions of [grow](https://github.com/grow/grow/releases/).

Installing 0.2.0 version:
```
grow-version.sh 0.2.0
```

Then refresh your shell.

Usage:
```
grow@0.2.0 --version
```



## symlinks (optional)
You can create symlinks for every scripts you want to use:
```
ln -s ~/scripts/grow-use.sh ~/bin/grow-use
```

then you can use:
```
grow-use 0.2.0
```
