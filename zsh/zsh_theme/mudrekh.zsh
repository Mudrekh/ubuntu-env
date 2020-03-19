qHOSTNAME=$HOST
ZSH_THEME="mudrekh"
export UPDATE_ZSH_DAYS=5
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

### export PATH="$HOME/bin:$HOME/bin/scripts:/snap/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH"
### export PATH="$HOME/.local/bin:$PATH"
### export GIT_MERGE_AUTOEDIT="no"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
  export LC_ALL=C
else
  export EDITOR='nano'
fi

# Aliases
alias whatismyip="dig +short myip.opendns.com @resolver1.opendns.com"
alias whatsmyip="dig +short myip.opendns.com @resolver1.opendns.com"

alias git_prune_local_dry="git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}'"
alias git_prune_local="git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d";

alias reloadzsh="source ~/.zshrc"

sedhosts() {
  sed -i $1d ~/.ssh/known_hosts
}

zstyle ':completion:*' use-cache yes

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
