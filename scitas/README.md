## Utill scripts
`bin/` contains helper shell scripts specifically for SCITAS


## Using Ghostty on SSH client side
To use Ghostty on the ssh client side, and make things like ctrl-left work, keybindings must be setmanually. To do this, first follow the PREREQUISITE in `keybindings.zsh` docs. Then, copy or symlink `keybindings.zsh` to `$HOME/.zsh/keybindings.zsh`. To make execution faster, compile it by running `zcompile $HOME/.zsh/keybindings.zsh`. Then source it from `.zshrc` (already in the script provided below).

## `bashrc` and `zshrc` profiles
First, diff `bashrc` with the system-provided `$HOME/.bashrc` to see if there has been any addition by system admins since this `bashrc` is written. Then, rename `bashrc` here to `$HOME/.bashrc`. All user customization should go into `.bashrc` except ZSH-specific ones.

The `zshrc` provided here is specifically tuned for SCITAS: it uses compiled zsh plugins without oh-my-zsh to reduce overhead, and color-codes the prompt to highlight the node name if you're on a compute node. ZSH sessions are started by `.bashrc` through an `exec` command at the end, so all shell-agnostic user customization should go in `.bashrc`; `.zshrc` is only for ZSH-specific stuff.

To install ZSH plugins:
```sh
mkdir -p ~/.zsh
curl -o ~/.zsh/zsh-autosuggestions.zsh \
    https://raw.githubusercontent.com/zsh-users/zsh-autosuggestions/master/zsh-autosuggestions.zsh
curl -o ~/.zsh/zsh-syntax-highlighting.zsh \
    https://raw.githubusercontent.com/zsh-users/zsh-syntax-highlighting/master/zsh-syntax-highlighting.zsh
zcompile zsh-autosuggestions.zsh
zcompile zsh-syntax-highlighting.zsh
```
