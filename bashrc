# .bashrc
#localectl set-x11-keymap us pc105 "" ctrl:nocaps
setxkbmap -model pc105 -layout us

mkdir -p ~/.vim/colors
ln -sf ~/utils/tomorrow-night.vim ~/.vim/colors/tomorrow-night.vim
ln -sf ~/utils/pythonrc ~/.pythonrc
ln -sf ~/utils/vimrc ~/.vimrc
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
setxkbmap -option "ctrl:nocaps"
syndaemon -i 1 -t -k -d
synclient PalmDetect=1
alias gs='git diff --stat --cached origin/master'
alias c='2>/dev/null google-chrome-stable &'
#nohup /home/gary/pi/background_changer.py &
alias ..='source ~/.bashrc'
alias sagif='sudo apt-get -f install'
alias saguu='sudo apt-get update -y && sudo apt-get upgrade -y'
alias sagu='sudo apt-get update'
