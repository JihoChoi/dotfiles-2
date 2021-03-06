# Environment Variables and Shell Options for ZSH
# (overrides prezto's default settings or zshenv)


# fzf {{{
#https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings

# fzf-powered CTRL-R: launch fzf with sort enabled
# @see https://github.com/junegunn/fzf/issues/526
export FZF_CTRL_R_OPTS='--sort'

# Setting fd as the default source for Ctrl-T fzf
if (( $+commands[fd] )); then
    export FZF_CTRL_T_COMMAND='fd --type f'
fi

# ALT-C: FASD_CD with preview
export FZF_ALT_C_COMMAND='fasd_cd -d -l -R'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# }}}

# Save more history entries
# @see history/init.zsh
export HISTSIZE=10000000
export SAVEHIST=10000000

# Save timestamp and the duration as well into the history file.
setopt EXTENDED_HISTORY

# new history lines are added incrementally as soon as they are entered,
# rather than waiting until the shell exits
setopt INC_APPEND_HISTORY

# No, I don't wan't share command history.
unsetopt SHARE_HISTORY
setopt NO_SHARE_HISTORY

# See zsh-autoswitch-virtualenv #19
unsetopt AUTO_NAME_DIRS       # Do not auto add variable-stored paths


# dotfiles-populated bin.
if [ -d $HOME/.dotfiles/bin/ ]; then
  path=( $path $HOME/.dotfiles/bin )
fi

# Anaconda3 {{{
if [ -d $HOME/.anaconda3/bin/ ]; then
  path=( $path $HOME/.anaconda3/bin )
fi
# }}}

# GO {{{
export GOROOT=$HOME/.go
export GOPATH=$GOROOT/packages
path=( $path $GOROOT/bin $GOPATH/bin )
# }}}

# Bazel {{{
if [ -f $HOME/.bazel/bin/bazel ]; then
  export BAZEL_HOME="$HOME/.bazel"
  path=( $path $BAZEL_HOME/bin )
fi
# }}}
