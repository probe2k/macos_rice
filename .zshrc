# Enable vcs_info for Git status
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}%f'
zstyle ':vcs_info:*' stagedstr '%F{green}✚%f'
zstyle ':vcs_info:git:*' formats '%F{111}git:%F{198}(%b)%u%c%f '

precmd() { vcs_info }
setopt prompt_subst

PS1='%(?.%F{46}➜ .%F{red}➜ ) %F{81}%B%~%b %f${vcs_info_msg_0_}%f'

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
