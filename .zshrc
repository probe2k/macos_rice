# Enable vcs_info for Git status
PROMPT='%n@%m %~ %# '

# Setup aliases
alias v='nvim'
alias t='tmux'

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
export PATH=$PATH:/Users/yash/Developer/flutter/bin
export GOPATH=$HOME/go

# Configure nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

source '/Users/yash/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh'
# source '/Users/yash/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'

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
