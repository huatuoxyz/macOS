# macOS

### Install Homebrew

```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Edit install.yml

```
cmd: brew install
  - go
  - rust

cmd: brew cask install
  - alfred
  - flux

cmd: apm install
  - file-icons
  - go-plus

cmd: gem install
  - tmuxinator
  - cocoapods
```

### Install Softwares

```
$ ./install.sh

$ ./install.sh brew

$ ./install.sh gem
```
