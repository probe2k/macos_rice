# Make sure to disable conda config with
# conda config --set changeps1 false

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}󱈸%f'
zstyle ':vcs_info:*' stagedstr '%F{green}✚%f'
zstyle ':vcs_info:git:*' formats ' %F{green}git:%F{198}(%b)%u%c%f'
precmd_conda_info() {
	if [[ -n $CONDA_DEFAULT_ENV ]]; then
		CONDA_ENV=" %F{blue}conda:%F{96}($CONDA_DEFAULT_ENV)%f"
	else
		CONDA_ENV=""
			fi
}

precmd() { vcs_info }
precmd_functions+=( precmd_conda_info )
setopt prompt_subst

PROMPT='%F{208}%~%f${vcs_info_msg_0_}%f${CONDA_ENV}%f
%F{cyan}❯%f '

# Setup aliases
alias v='nvim'
alias t='tmux'
alias ls='ls --color=auto'
alias ll='ls -a --color=auto'
alias c='bat'
alias grep='grep --color=auto'

# Add conda initialization
alias ci='eval "$(/Users/yash/Developer/miniconda/bin/conda shell.zsh hook)"'

function cx() {
  conda deactivate 2>/dev/null
  unset CONDA_SHLVL CONDA_PROMPT_MODIFIER CONDA_DEFAULT_ENV CONDA_PREFIX
  export PATH=$(echo "$PATH" | tr ":" "\n" | grep -v "/Users/yash/Developer/miniconda" | paste -sd ":" -)
  unfunction conda 2>/dev/null
  hash -r
}

export PATH=$PATH:/opt/homebrew/bin
export GOPATH=$HOME/go

# Configure nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

source '/Users/yash/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh'
source '/Users/yash/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'

# Basic zsh hist configurations
HISTSIZE=100000
HISTFILESIZE=2000000
HISTFILE=~/.config/zsh/zsh_history
SAVEHIST=100000

# Setup tmux to auto-load
if [ -z "$TMUX" ]
then
	tmux attach -t TMUX || tmux new -s TMUX
fi
