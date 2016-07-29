# .bashrc
export PS1="\u@\[\033[01;32m\]\h \[\033[00m\]\W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
alias gs='git status'
#localectl set-x11-keymap us pc105 "" ctrl:nocaps
if [ $HOSTNAME = envy ]
  then
    setxkbmap -model pc105 -layout us
    setxkbmap -option "ctrl:nocaps"
    syndaemon -i 1 -t -k -d
    synclient PalmDetect=1
    # The next line updates PATH for the Google Cloud SDK.
    source '/home/gary/google-cloud-sdk/path.bash.inc'
    # The next line enables shell command completion for gcloud.
    source '/home/gary/google-cloud-sdk/completion.bash.inc'
    alias gc='gcloud compute'
fi

mkdir -p ~/.vim/colors
mkdir -p ~/.i3
ln -sf ~/utils/i3config ~/.i3/config
ln -sf ~/utils/i3config.conf ~/.i3config.conf
ln -sf ~/utils/tomorrow-night.vim ~/.vim/colors/tomorrow-night.vim
ln -sf ~/utils/pythonrc ~/.pythonrc
ln -sf ~/utils/vimrc ~/.vimrc
ln -sf ~/utils/gitconfig ~/.gitconfig
alias ..="source ~/.bashrc"
alias t=tree
alias acs='apt-cache search'
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
alias gs='git diff --stat --cached origin/master'
alias c='2>/dev/null google-chrome-stable &'
#nohup /home/gary/pi/background_changer.py &
alias ..='source ~/.bashrc'
alias sagif='sudo apt-get -f install -y'
alias saguu='sudo apt-get update -y && sudo apt-get upgrade -y'
alias sagu='sudo apt-get update'
alias g='git status'

