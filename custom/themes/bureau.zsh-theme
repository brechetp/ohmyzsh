# oh-my-zsh Bureau Theme

### NVM


### Git [±master ▾●]



_PATH="%{$fg[yellow]%}%~%{$reset_color%}"

if [[ $EUID -eq 0 ]]; then
  _USERNAME="%{$fg_bold[red]%}%n"
  _LIBERTY="%{$fg[red]%}#"
else
  _USERNAME="%{$fg_bold[white]%}%n"
  _LIBERTY="%{$fg[green]%}$"
fi
_USERNAME="$_USERNAME%{$reset_color%}@%m"
_LIBERTY="$_LIBERTY%{$reset_color%}"


get_space () {
  local STR=$1$2
  local zero='%([BSUbfksu]|([FB]|){*})'
  local LENGTH=${#${(S%%)STR//$~zero/}}
  local SPACES=""
  (( LENGTH = ${COLUMNS} - $LENGTH - 1))

  for i in {0..$LENGTH}
    do
      SPACES="$SPACES "
    done

  echo $SPACES
}

_1LEFT="$_USERNAME $_PATH"
#_1RIGHT="[%*] "

bureau_precmd () {
  _1SPACES=`get_space $_1LEFT`
  print
  print -rP "$_1LEFT$_1SPACES"
}

setopt prompt_subst
#PROMPT='> [%*] $(bureau_git_prompt) $_LIBERTY '
PROMPT='> [%*] $(git_super_status) $_LIBERTY '

#RPROMPT='$(nvm_prompt_info) $(bureau_git_prompt)'
RPROMPT=''




autoload -U add-zsh-hook
add-zsh-hook precmd bureau_precmd
