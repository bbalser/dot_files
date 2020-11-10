source ~/antigen.zsh
antigen use oh-my-zsh

antigen bundle asdf
antigen bundle git
antigen bundle docker
antigen bundle gusaiani/elixir-oh-my-zsh
antigen bundle softmoth/zsh-vim-mode
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
#antigen bundle zsh-users/zsh-autosuggestions

antigen theme agnoster

antigen apply

eval "$(direnv hook zsh)"

path+=('/home/bbalser/bin')
export PATH

export ERL_AFLAGS="-kernel shell_history enabled"

alias ls='ls -aFG'

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte-2.91.sh
fi
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/bbalser/.asdf/installs/python/anaconda3-2020.02/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/bbalser/.asdf/installs/python/anaconda3-2020.02/etc/profile.d/conda.sh" ]; then
        . "/home/bbalser/.asdf/installs/python/anaconda3-2020.02/etc/profile.d/conda.sh"
    else
        export PATH="/home/bbalser/.asdf/installs/python/anaconda3-2020.02/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

