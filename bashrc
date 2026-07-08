# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=


#============================================================================#
#                         Stuff added by Sibo below                          #
#============================================================================#


# ===== Package management ===================================================
# ----- Conda ----------------------------------
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sibwang/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sibwang/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sibwang/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sibwang/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# ----- Spack ----------------------------------
. ~/spack/share/spack/setup-env.sh


# ===== Mounting =============================================================
UPRAMDYA_DATA="smb://intranet;sibwang@sv-nas1.rcp.epfl.ch/upramdya/data"


# ===== User-specific configs ================================================
# ----- Locally installed Software --------------
export PATH="$HOME/.local/bin:$PATH"

# ----- Env vars --------------------------------
export IS_CLUSTER=1

# ----- MuJoCo headless rendering ---------------
export MUJOCO_GL="egl"
export PYOPENGL_PLATFORM="egl"


# ===== Replace the current bash session with ZSH ============================
# `-t 1` checks if current shell is in a tty session (if not, e.g. in Slurm
# jobs, keep using bash)
if [ -t 1 ] && [ -z "$ZSH_VERSION" ]; then
    # exec replaces this process in place, so SHLVL (shell level) won't be
    # auto-incremented. This makes /etc/profile.d/motd.sh think we're freshly
    # starting a new session, and prints the welcome message a second time.
    export SHLVL=$((SHLVL + 1))
    # Replace the current shell with zsh
    exec /usr/bin/zsh -l
fi
