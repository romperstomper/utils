# .bashrc
<<<<<<< Updated upstream
alias gpo='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
alias vb='vim ~/.bashrc'
=======
>>>>>>> Stashed changes
alias l='ls -1'
if [ ! -f ~/.bash/git-aware-prompt/prompt.sh ]
then
  mkdir ~/.bash
  cd ~/.bash
  git clone git://github.com/jimeh/git-aware-prompt.git
fi
if [ ! -d ~/.vim/bundle/Vundle.vim ]
  then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
    vim +PluginInstall +qall
fi
if [ $HOSTNAME = localhost ] 
then
  if ! [ -z ${DISPLAY} ]
  then
    cp ~/utils/xmodmap_chromebook ~/.Xmodmap
    xmodmap ~/.Xmodmap
  fi
fi
if [ $HOSTNAME = envy ]
  then
    #localectl set-X11-keymap us pc105 "" ctrl:nocaps
    #setxkbmap -model pc105 -layout us
    setxkbmap -option "ctrl:nocaps"
    ## The next line updates PATH for the Google Cloud SDK.
    #source '/home/gary/google-cloud-sdk/path.bash.inc'
    ## The next line enables shell command completion for gcloud.
    #source '/home/gary/google-cloud-sdk/completion.bash.inc'
    #alias gc='gcloud compute'
fi
alias vb='v ~/.bashrc'
alias vv='v ~/.vimrc'
alias vt='v ~/.tmux.conf'

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

mkdir -p ~/.vim/colors
#mkdir -p ~/.i3
#ln -sf ~/utils/i3config ~/.i3/config
ln -sf ~/utils/Tomorrow-Night.vim ~/.vim/colors/Tomorrow-Night.vim
ln -sf ~/utils/pythonrc ~/.pythonrc
ln -sf ~/utils/vimrc ~/.vimrc
ln -sf ~/utils/gemrc ~/.gemrc
ln -sf ~/utils/gitconfig ~/.gitconfig
alias reg='echo "ps aux | grep java|grep -oP \"wday\s+\K(\d+)(?=\s)\""'
alias d='sudo docker'
alias h='history'
alias cdd='cd ~/Downloads'
alias sr='cd ~/src'
alias ej='udisksctl unmount -b /dev/sdb1;udisksctl power-off -b /dev/sdb'
alias gln='git log --name-only'
alias grl="git reflog"
alias gap="git add -p"
alias gls='git log --stat'
alias 'gpr'='git pull --rebase'
alias 'gf'='git clean -f'
alias tr=tree
alias irbb='irb --simple-prompt'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias p=python3
alias v='/usr/bin/vim'
alias o='ssh osmc@192.168.1.148'
alias e='~/eclipse/eclipse'
alias edit='vim'
export EDITOR=vim
alias ll='ls -la'
alias lt='ls -t'
alias tt='ls -lrt'
alias sagi='sudo apt-get install -y'
alias sag='sudo apt-get'
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="%F %T "
export EDITOR=/usr/local/bin/vim
shopt -s cmdhist
shopt -s histappend
export TERM=screen-256color
alias tm="export TERM=screen-256color && tmux"
export PYTHONSTARTUP=~/.pythonrc
alias gs='git diff --stat --cached origin/master'
alias c='2>/dev/null google-chrome-stable &'
alias ..='source ~/.bashrc'
alias sagif='sudo apt-get -f install -y'
alias saguu='sudo apt-get update -y && sudo apt-get upgrade -y'
alias sagu='sudo apt-get update'
alias saga='sudo apt-get autoremove'
alias g='git status'
alias gp='git pull'
alias gdd='git diff HEAD~1'
alias gd='git diff'
alias ga='git add'
alias gaa='git add .'
alias gbr='git branch $@;git checkout $@;touch .gitignore;git add .gitignore;git commit -m .gitignore'
function myfunc {
  find ./ -name $1 -print
}
alias f='myfunc'
function testfifo {
    if [ ! -p testfifo ]; then
        mkfifo testfifo
    fi
    while true; do
        sh -c "$(cat testfifo)"
    done
}
alias testfifo='testfifo'

# history
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# git aware prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
export PS1="\[\033[00m\]\W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
#export PS1="\u@\[\033[01;32m\]\h \[\033[00m\]\W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
source "${GITAWAREPROMPT}/main.sh"

alias xxx="gnome-session-quit --no-prompt || xfce4-session-logout"
alias xx="gnome-session-quit --no-prompt"
alias ut="cd ~/utils"
alias ll="ls -l"
alias lt="ls -l"
alias cc="cd -"
alias ca="/usr/bin/calibre"
alias nn="nc -vz"
alias s="ssh"
alias la="ssh 104.199.45.88 -l gary"
alias s='ssh "-o StrictHostKeyChecking no"'
alias gu='git commit -m "update"; git push'
alias kp="~/utils/keypush.sh"
alias md="diff --side-by-side --suppress-common-lines"
alias rvmg='rvm gemset list'
alias rvml='rvm list'
alias lg='gem list'
alias sg='less +G'
alias vb='v ~/.bashrc'
alias vv='v ~/.vimrc'
alias b=bpython
alias wp="cd ~/wip"

LS_COLORS=$LS_COLORS:'di=0;32:' ; export LS_COLORS
alias mydiff='git show HEAD^:/path/to/file | diff --side-by-side /path/to/file -'
# needs colordiff 
alias ed="vim diff <(git show ) "
alias dif="colordiff -W 200 --side-by-side --suppress-common-lines"

alias p34=/opt/python/python3.4.9/bin/python3
PATH=/opt/python/python3.4.9/bin/python3:$PATH

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon
#gsettings set org.gnome.desktop.wm.preferences audible-bell false
