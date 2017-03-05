function git_prompt_info() {
   ref=$(git symbolic-ref HEAD 2> /dev/null) || return
   echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX$(git_prompt_status)"
}

function get_pwd() {
   print -D $PWD
}

function get_env() {
   if [ ${#VIRTUAL_ENV} != 0 ]; then
       echo ${#VIRTUAL_ENV} + 29
   else
       echo ${#VIRTUAL_ENV}
   fi
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function precmd() {
  print -rP '%{$fg_bold[cyan]%}%m: %{$reset_color%}$fg[yellow]$(get_pwd)'
}

PROMPT='%F{white}$(virtualenv_info)%{$fg_bold[red]%}%n→   %{$reset_color%}'
RPROMPT='$(git_prompt_info)%{$reset_color%}'

VIRTUAL_ENV_DISABLE_PROMPT=True

ZSH_THEME_GIT_PROMPT_PREFIX="【GIT:"
ZSH_THEME_GIT_PROMPT_SUFFIX=" 】"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}✗ "
ZSH_THEME_GIT_PROMPT_CLEAN="%F{green}✓ "

## git status
ZSH_THEME_GIT_PROMPT_ADDED="%F{green} ✚ ADDED"
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{blue} ✎ MODIFIED"
ZSH_THEME_GIT_PROMPT_DELETED="%F{red} ✖ DELETED"
ZSH_THEME_GIT_PROMPT_RENAMED="%F{magenta} ↩ RENAMED"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{yellow} ⌥ UNMERGED"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{cyan} ⚡ UNTRACKED"
