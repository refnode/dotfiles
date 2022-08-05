# refnode's dotfiles

refnode's dotfiles, tools, configs and more

```shell
# clone the repo including submodules
git clone --recursive https://github.com/refnode/dotfiles.git $HOME/.dotfiles

# bootstrap the configurations
$HOME/.dotfiles/bin/bootstrap.sh
```

## Configurations

The repo tries to follow the principle to avoid spamming the home
directory with many dotfiles.

### Zsh

The Zsh reads .zshenv in the users home directory when present.
If the variable `ZDOTDIR` is set, Zsh uses that directory as base
for Zsh configuration files.

`ZDOTDIR` is set to `$HOME/.dotfiles/zsh`

## Resources

* [The Z Shell Manual](https://zsh.sourceforge.io/Doc/Release/zsh_toc.html)
* [Prezto — Instantly Awesome Zsh](https://github.com/sorin-ionescu/prezto)
* [Powerlevel10k theme for Zsh](https://github.com/romkatv/powerlevel10k)
