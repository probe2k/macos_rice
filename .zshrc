# Enable vcs_info for Git status
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'  # Unstaged changes
zstyle ':vcs_info:*' stagedstr '+'    # Staged changes
zstyle ':vcs_info:git:*' formats ' %F{blue} %b%u%c%f'  # Branch + indicators
zstyle ':vcs_info:git:*' actionformats ' %F{blue} %b|%a%u%c%f'  # During rebase/merge

# Update vcs_info before each prompt
precmd() { vcs_info }
setopt prompt_subst  # Allow dynamic prompt expansion
# setopt autocd  # Allow changing directory without using cd command

# Custom Starship-like prompt
#PS1='%F{208}%B%~%b%f${vcs_info_msg_0_}
#%(?.%F{green}%B.%F{red}%B)❯%b%f '

# PS1='%(?.%F{green}%B.%F{red}%B)%b%f %F{159}%B%~%b%f${vcs_info_msg_0_} '
PS1='%F{159}%B%~%b%f${vcs_info_msg_0_} '

# PROMPT='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '
# PROMPT='%(?.%F{green}.%F{red}) %(!.%F{red}%n.%F{117}%n)%f %F{214}%~%f '

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
