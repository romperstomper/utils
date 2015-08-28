# .bashrc
PROMPT_COMMAND="history -a; history -n"
alias test='echo /google/data/ro/projects/production/test_borgmon_in_prod \
  --service=hydra-prod --zone=wj --config_file=production/monitoring/hydra-prod/cfg/hydras.cfg \
  --additional_borgmon_args=--variables=borg_cell=wj:DC=wj:test_borgmon_user=:test_borgmon_instance= --start'
alias sd='/google/data/ro/teams/sync_dir/sync_dir'
alias g4m='g4 lint && g4 mail'
alias edit='vim'
alias ll='ls -l'
alias tt='ls -lrt'
alias depot='cd //google/src/head/depot'
alias sagi='sudo apt-get install '
export CDPATH=.:/google/src/cloud/gboland/nemora/google3/blaze-bin/ops/hardware/hydra/v2/system/bin
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="%F %T "
shopt -s cmdhist
shopt -s histappend
export TERM=screen-256color
alias tmux="export TERM=screen-256color && tmux"
alias a='cd /google/src/cloud/gboland/admin/google3'
alias d='cd /google/src/cloud/gboland/drain_bastion/google3'
alias b='cd /google/src/cloud/gboland/b1/google3'
alias i='/google/data/ro/projects/installer/portable/create_portable_installer.sar gboland@172.28.8.229'
alias o='ssh root@oob-bastion.dub'
alias h='cd /google/src/cloud/gboland/hamd/google3'
alias hydratar='cd /google/src/cloud/gboland/hydratar/google3'
alias g='g4 p'
alias nemora='echo stubby call /bns/vc/borg/vc/bns/hydra-borg/nemora_powercycler.np/0 NemoraPowercycler.Powercycle qhostname: Qcaq31Q' 
alias nemorapi='echo stubby call stubby call /bns/oregon/borg/oregon/bns/platforms-nemora-powercycle-client/nemora_powercycler/0 NemoraPowercycler.Powercycle qhostname: Qcaq10Q'
export IRCSERVER=irc.corp.google.com
PYTHONPATH="/home/build/nonconf:/home/build/google/setup:/usr/local/buildtools/current/sitecustomize"
PATH=${PATH}:/usr/pubsw/bin:/home/p4/bin
export P4CONFIG=.p4config
export P4DIFF='/google/src/files/head/depot/google3/devtools/scripts/p4diff -w'
export P4MERGE=/home/build/public/eng/perforce/mergep4.tcl
export P4EDITOR=$EDITOR
export EDITOR='vim'
alias listhydras='cd /home/build/ops/network/netscreen/cluster-nat/ && (grep MIP * | cut -c 1-2 | sort | uniq | while read line; do echo "${line}hydra"; done;) | xargs'
alias powerimport=/home/build/static/projects/hw-systems/import_power_data
alias gc='/google/data/ro/projects/cloud/cluster/gcutil'
alias n='cd /google/src/cloud/gboland/nemora/google3'
alias p='cd $PWD'
alias lock='lockserv ls /ls/global/ops/hydra/hydra-bastions/'
alias removepower='/home/build/static/projects/hw-systems/remove_power_data.par'
alias lockoob='lockserv ls /ls/global/ops/hydra/oob/'
alias pcs="prodcertstatus"
alias borgquota=/home/build/static/projects/borg-sre/contracts/borgquota.par
alias importps="/auto/buildstatic/projects/hydra/import_config.par"
alias pa="prodaccess -s -g -k && cd $PWD"
alias irc="irssi -c irc.corp.google.com"
alias pr="mycode/prod.py"
alias gpython="/home/build/google3/experimental/users/pts/gpython/gpython -i"
alias g3p=/google/data/ro/projects/g3python/g3python
alias gcompute=/home/build/static/projects/cloud/cluster/gcompute
alias sub="/usr/local/google/storage/Sublime\ Text\ 2/sublime_text"
alias hydraro="cd /auto/buildstatic/projects/hydra/"
alias hydrarw="cd /google/data/rw/projects/hydra"
alias watch="watch lockserv ls -l /ls/global/ops/hydra/oob"
alias ha="/google/data/ro/projects/hydra/hydra_admin.par"
export PATH=$PATH:~/commands
# Add a directory to PYTHONPATH
export PYTHONPATH=/home/gboland/src/djexample/google3/experimental/users/gboland/mysite:$PYTHONPATH
export PYTHONSTARTUP=/usr/local/google/home/gboland/.pythonrc
alias faker='ssh -i ~/.ssh/compute gboland@173.255.112.126'
alias share='cd /auto/buildstatic/projects/hydra'
alias hy='cd /home/gboland/src/hydra/google3'
alias cns='echo /cns/wj-d/ and /cns/yb-d/'
alias hy='cd /home/gboland/src/hydra/google3'
alias s='cd /google/src/cloud/gboland/sisyphus/google3'
alias c='cd /google/src/cloud/gboland'
alias chrome='/opt/google/chrome/google-chrome --enable-plugins'
alias cns='echo /cns/wj-d/ and /cns/yb-d/'
alias upgrade_fw='/auto/buildstatic/projects/hydra/hydra_firmware_upgrade.par -f -v'
alias images='cd /google/data/rw/teams/hydra/images'
alias fit='sudo /usr/local/google/home/gboland/bb/libfitbit/python/fitbit_client.py'
alias u='ssh romper.i'
alias py='/usr/bin/python'
alias k='cd /usr/local/google/home/gboland/projects/krc'
alias pr='cd /usr/local/google/home/gboland/projects'
alias pushmaster='lockserv resolve /ls/global/ns/ops/hydra/hydrapushmaster'
# enable programmable completion features
# enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
      . /etc/bash_completion
fi
alias key='prodaccess -s --nossh_on_security_key'

# The next line updates PATH for the Google Cloud SDK.
source '/usr/local/google/home/gboland/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/usr/local/google/home/gboland/google-cloud-sdk/completion.bash.inc'
alias r='gcloud compute --project "regal-welder-87917" ssh --zone "europe-west1-b" "romper"'
