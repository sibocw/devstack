# keybindings.zsh
# Key bindings for extended/modified keys (Home, End, Delete,
# Ctrl+arrows, etc.), resolved via terminfo where possible so
# they stay correct across different $TERM values / terminals.
#
# Required to make things like ctrl-left, ctrl-right, del work
# if using terminals like Ghostty on the ssh client side.
#
# PREREQUISITE
# On the client machine (running Ghostty) run
#   infocmp -x xterm-ghostty | ssh <username>@<hostname> -- tic -x -
# to copy host-specific terminfo to the remote machine under
# ~/.terminfo/.

zmodload zsh/terminfo

# Explicit keymap: emacs-style bindings. Comment out if you
# prefer vi bindings (bindkey -v) — the widgets below exist in
# both keymaps, but which one is "main" affects other defaults.
bindkey -e

# --- capname -> widget mapping -------------------------------
# See `infocmp -x $TERM` for what your terminal's terminfo entry
# actually defines. Naming convention:
#   (none)=plain  2=Shift  3=Alt  4=Alt+Shift  5=Ctrl  6=Ctrl+Shift  7=Ctrl+Alt
# Plain arrows use lowercase capnames (kcuu1 etc.); uppercase
# kUP/kLFT/etc. WITHOUT a digit means Shift, not plain.

typeset -A key_bindings=(
    # --- unmodified ---
    kdch1  delete-char                     # Delete
    kich1  overwrite-mode                  # Insert
    khome  beginning-of-line               # Home
    kend   end-of-line                     # End
    kpp    up-line-or-history              # Page Up
    knp    down-line-or-history            # Page Down

    # --- ctrl ---
    kLFT5  backward-word                   # Ctrl+Left
    kRIT5  forward-word                    # Ctrl+Right
    kDC5   kill-word                       # Ctrl+Delete
    kHOM5  beginning-of-line               # Ctrl+Home
    kEND5  end-of-line                     # Ctrl+End

    # --- shift ---
    kLFT   backward-word                   # Shift+Left
    kRIT   forward-word                    # Shift+Right
)

for cap widget in "${(@kv)key_bindings}"; do
    [[ -n ${terminfo[$cap]} ]] && bindkey "${terminfo[$cap]}" "$widget"
done

# --- things terminfo usually doesn't cover --------------------
# Ctrl+Backspace: rarely has a terminfo capname; terminals send
# a bare control char instead. Verify with `cat -v` and adjust
# if this doesn't match your terminal.
bindkey '^H' backward-kill-word

unset key_bindings
