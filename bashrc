# .bashrc
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
alias gpo='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
alias vb='vim ~/.bashrc'
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
dk (){
  pid=`docker ps|tail -n 1|cut -d " " -f 1`
  docker kill $pid
}
de (){
  pid=`docker ps|tail -n 1|cut -d " " -f 1`
  docker exec -it $pid bash
}
mkdir -p ~/.vim/colors
#mkdir -p ~/.i3
#ln -sf ~/utils/i3config ~/.i3/config
ln -sf ~/utils/Tomorrow-Night.vim ~/.vim/colors/Tomorrow-Night.vim
ln -sf ~/utils/pythonrc ~/.pythonrc
alias reg='echo "ps aux | grep java|grep -oP \"wday\s+\K(\d+)(?=\s)\""'
alias d='sudo docker'
alias di='docker images'
alias dps='docker ps'
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
alias sagi='sudo apt-get install -y'
alias sag='sudo apt-get'
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="%F %T "
export EDITOR=/usr/local/bin/vim
shopt -s cmdhist
shopt -s histappend
export TERM=screen-256color
alias tm="export TERM=screen-256color;tmux -u new -s code \; split-window -h"
alias tt="tmux -u new -s code \; split-window -h"
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
export PS1="\[\033[00m\]\W\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
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
alias b=bpython
alias wp="cd ~/wip"

LS_COLORS=$LS_COLORS:'di=0;32:' ; export LS_COLORS
alias mydiff='git show HEAD^:/path/to/file | diff --side-by-side /path/to/file -'
# needs colordiff 
alias ed="vim diff <(git show ) "
alias dif="colordiff -W 200 --side-by-side --suppress-common-lines"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/gary/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/gary/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/gary/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/gary/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

