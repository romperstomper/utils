# .bashrc
alias g4m='g4 lint && g4 mail'
alias edit='vim'
alias ll='ls -la'
alias tt='ls -lrt'
alias sagi='sudo apt-get install -y'
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="%F %T "
shopt -s cmdhist
shopt -s histappend
export TERM=screen-256color
alias tmux="export TERM=screen-256color && tmux"
