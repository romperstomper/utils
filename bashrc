# .bashrc
alias p='cd ~/pi'
alias k='cd ~/krc'
alias o='ssh osmc@192.168.1.148'
alias e='~/eclipse/eclipse'
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
export PYTHONSTARTUP=~/.pythonrc
setxkbmap -option ctrl:nocaps
syndaemon -i 1 -t -k -d
#synclient PalmDetect=1
alias gs='git diff --stat --cached origin/master'
