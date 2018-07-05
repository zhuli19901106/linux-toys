# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
source /usr/share/bash-completion/completions/docker
source /etc/bash_completion.d/git
source <(kubectl completion bash)

source ~/.shellrc

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1='\[\033[38;5;87m\]\u\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;119m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] [\[$(tput sgr0)\]\[\033[38;5;198m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\]] {\[$(tput sgr0)\]\[\033[38;5;81m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]}$(parse_git_branch)\n\[$(tput sgr0)\]\[\033[38;5;2m\]--\[$(tput sgr0)\]\[\033[38;5;118m\]>\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]'
