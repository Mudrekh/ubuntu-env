# oh-my-zsh Lobo Theme, based on Bureau and Amuse Theme

# NPM info
npm_prompt_info() {
  NPM_LOCATION=$(readlink -f `which npm`)
  if [[ -z "$OLD_NPM_LOCATION" ]] || [[ $NPM_LOCATION != $OLD_NPM_LOCATION ]] && [[ -f "./package.json" ]] ; then
    NPM_VERSION=`dirname $NPM_LOCATION | awk '{print $1"/../package.json"}' | xargs grep '"version"' | awk  -F'"' '{print $4}'`
    ZSH_THEME_NPM_PROMPT_PREFIX="%{$fg[green]%}◇%{$reset_color%} "
    ZSH_THEME_NPM_PROMPT_SUFFIX=" $NPM_CHANGED"
    echo "$ZSH_THEME_NPM_PROMPT_PREFIX$NPM_VERSION$ZSH_THEME_NPM_PROMPT_SUFFIX"
    export OLD_NPM_LOCATION=$NPM_LOCATION
  fi
}

local npm_info='$(npm_prompt_info)'

### Mericural
ZSH_THEME_HG_PROMPT_PREFIX="%{$fg_bold[magenta]%}hg:(%{$fg[red]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_HG_PROMPT_DIRTY="%{$fg[magenta]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_HG_PROMPT_CLEAN="%{$fg[magenta]%})"

### NVM

ZSH_THEME_NVM_PROMPT_PREFIX="%{$fg_bold[green]%}%B⬡%b%{$reset_color%} "
ZSH_THEME_NVM_PROMPT_SUFFIX=""

### Git [±master ▾●]

ZSH_THEME_GIT_PROMPT_PREFIX="[%{$fg_bold[green]%}±%{$reset_color%}%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"

bureau_git_branch () {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}


bureau_git_branch () {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

bureau_git_status() {
  _STATUS=""

  # check status of files
  _INDEX=$(command git status --porcelain 2> /dev/null)
  if [[ -n "$_INDEX" ]]; then
    if $(echo "$_INDEX" | command grep -q '^[AMRD]. '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
    fi
    if $(echo "$_INDEX" | command grep -q '^.[MTD] '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
    fi
    if $(echo "$_INDEX" | command grep -q -E '^\?\? '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
    fi
    if $(echo "$_INDEX" | command grep -q '^UU '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
    fi
  else
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi

  # check status of local repository
  _INDEX=$(command git status --porcelain -b 2> /dev/null)
  if $(echo "$_INDEX" | command grep -q '^## .*ahead'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
  if $(echo "$_INDEX" | command grep -q '^## .*behind'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi
  if $(echo "$_INDEX" | command grep -q '^## .*diverged'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_DIVERGED"
  fi

  if $(command git rev-parse --verify refs/stash &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STASHED"
  fi

  echo $_STATUS
}

lobo_git_message_hash() {
  NAME_HASH=$(command git log -1 --oneline HEAD 2> /dev/null | cut -c1-30) && echo "$ZSH_THEME_GIT_PROMPT_NAME_HASH_BEFORE$NAME_HASH$ZSH_THEME_GIT_PROMPT_NAME_HASH_AFTER"
}

bureau_git_prompt () {
  local _branch=$(bureau_git_branch)
  local _status=$(bureau_git_status)
  local _result=""
  if [[ "${_branch}x" != "x" ]]; then
    _result="$ZSH_THEME_GIT_PROMPT_PREFIX$_branch"
    if [[ "${_status}x" != "x" ]]; then
      _result="$_result $_status"
    fi
    _result="$_result $(lobo_git_message_hash)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
  echo $_result
}


_PATH="%{$fg_bold[green]%}%~%{$reset_color%}"

if [[ $EUID -eq 0 ]]; then
  _USERNAME="%{$fg_bold[red]%}%n"
  _LIBERTY="%{$fg[red]%}#"
else
  _USERNAME="%{$fg_bold[yellow]%}%n"
  _LIBERTY="%{$fg[green]%}$"
fi
_USERNAME="$_USERNAME%{$reset_color%}@%{$fg_bold[magenta]%}%m%{$reset_color%}"
_LIBERTY="$_LIBERTY%{$reset_color%}"


get_space () {
  local STR=$1$2
  local zero='%([BSUbfksu]|([FK]|){*})'
  local LENGTH=${#${(S%%)STR//$~zero/}}
  local SPACES=""
  (( LENGTH = ${COLUMNS} - $LENGTH - 2))

  for i in {0..$LENGTH}
    do
      SPACES="$SPACES "
    done

  echo $SPACES
}

_1LEFT="$_USERNAME $_PATH"
#_1RIGHT=" ⌚ %{$fg_bold[red]%}[%*] %{$reset_color%}"
#_1RIGHT="[%*] "
#_1RIGHT=" %1{⌚%G%} %{$fg_bold[red]%}[%*] "

bureau_precmd () {
  _1RIGHT="$(nvm_prompt_info) $(npm_prompt_info) ⌚ %{$fg_bold[red]%}%*"
  
  _1SPACES=`get_space $_1LEFT $_1RIGHT`
  print
  print -rP "$_1LEFT$_1SPACES$_1RIGHT"
}

setopt prompt_subst
PROMPT='$_LIBERTY '
RPROMPT='$(hg_prompt_info)$(bureau_git_prompt)'

autoload -U add-zsh-hook
add-zsh-hook precmd bureau_precmd
