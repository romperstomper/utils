# .bashrc

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

if [ $HOSTNAME = envy ]
  then
    #localectl set-x11-keymap us pc105 "" ctrl:nocaps
    setxkbmap -model pc105 -layout us
    setxkbmap -option "ctrl:nocaps"
    # The next line updates PATH for the Google Cloud SDK.
    source '/home/gary/google-cloud-sdk/path.bash.inc'
    # The next line enables shell command completion for gcloud.
    source '/home/gary/google-cloud-sdk/completion.bash.inc'
    alias gc='gcloud compute'
    alias tor='cd ~/tor-browser_en-US;./start-tor-browser.desktop'
fi

mkdir -p ~/.vim/colors
mkdir -p ~/.i3
ln -sf ~/utils/i3config ~/.i3/config
ln -sf ~/utils/Tomorrow-Night.vim ~/.vim/colors/Tomorrow-Night.vim
ln -sf ~/utils/pythonrc ~/.pythonrc
ln -sf ~/utils/vimrc ~/.vimrc
ln -sf ~/utils/gemrc ~/.gemrc
ln -sf ~/utils/gitconfig ~/.gitconfig
alias ej='udisksctl unmount -b /dev/sdb1;udisksctl power-off -b /dev/sdb'
alias ..="source ~/.bashrc"
alias 'gpr'='git pull --rebase'
alias tr=tree
alias irb='irb --simple-prompt'
alias acs='apt-cache search'
alias p='cd ~/pi'
alias v='/usr/bin/vim'
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
alias t="export TERM=screen-256color && tmux"
export PYTHONSTARTUP=~/.pythonrc
alias gs='git diff --stat --cached origin/master'
alias c='2>/dev/null google-chrome-stable &'
alias ..='source ~/.bashrc'
alias sagif='sudo apt-get -f install -y'
alias saguu='sudo apt-get update -y && sudo apt-get upgrade -y'
alias sagu='sudo apt-get update'
alias g='git status'
alias gp='git pull'
alias gdd='git diff HEAD~1'
alias ga='git add'
alias gaa='git add .'
alias gbr='git branch $@;git checkout $@;touch .gitignore;git add .gitignore;git commit -m .gitignore'

# history
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# git aware prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
export PS1="\u@\[\033[01;32m\]\h \[\033[00m\]\W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
source "${GITAWAREPROMPT}/main.sh"

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
alias gu='git commit -m "utils"; git push'
alias kp="~/utils/keypush.sh"
alias md="diff --side-by-side --suppress-common-lines"
alias mydiff='git show HEAD^:/path/to/file | diff --side-by-side /path/to/file -'
# needs cdiff 
alias ed="vim diff <(git show ) "
alias d="diff --side-by-side --suppress-common-lines"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
PATH=/home/gary/.rvm/gems/ruby-2.3.3/bin:$PATH

