PROMPT='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '

alias ls='ls --color=auto'
alias ll='ls -a --color=auto'
alias v='nvim'
alias t='tmux'
alias c='bat'
alias grep='grep --color=auto'

export CLICOLOR=1
export PATH=$PATH:/opt/homebrew/bin

source '/Users/yash/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh'
source '/Users/yash/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'

HISTSIZE=100000
HISTFILESIZE=2000000
HISTFILE=~/.config/zsh/zsh_history
SAVEHIST=100000

if [ -z "$TMUX" ]
then
	tmux attach -t TMUX || tmux new -s TMUX
fi
