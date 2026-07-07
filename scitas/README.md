## Utill scripts

`bin/` contains helper shell scripts specifically for SCITAS


## Using Ghostty on SSH client side

To use Ghostty on the ssh client side, and make things like ctrl-left work,
keybindings must be setmanually. To do this, first follow the PREREQUISITE
in `keybindings.zsh`. Then, rename `keybindings.zsh` to
`$HOME/.zsh/keybindings.zsh`. To make execution faster, compile it by
running `zcompile $HOME/.zsh/keybindings.zsh`. Then source it from `.zshrc`
(already in the script provided below).

## `zshrc` profile

`zshrc` is a `~/.zshrc` file specifically tuned for SCITAS (uses compiled
zsh plugins without ohmyzsh to reduce overhead; prompt color codes SCITAS
login vs compute nodes). To install plugins:
    mkdir -p ~/.zsh
    curl -o ~/.zsh/zsh-autosuggestions.zsh \
        https://raw.githubusercontent.com/zsh-users/zsh-autosuggestions/master/zsh-autosuggestions.zsh
    curl -o ~/.zsh/zsh-syntax-highlighting.zsh \
        https://raw.githubusercontent.com/zsh-users/zsh-syntax-highlighting/master/zsh-syntax-highlighting.zsh

