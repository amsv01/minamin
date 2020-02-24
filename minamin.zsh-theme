# [[ -f package.json || -d node_modules || -n *.js(#qN^/) ]] || return
node_version=$(node -v 2>/dev/null)

PROMPT="%{$fg_bold[green]%} ⬢ $node_version %{$reset_color%}%(?:%{$fg_bold[green]%}- %{$fg_bold[red]%}"
PROMPT+='%{$fg[cyan]%}%c%{$reset_color%}'
GIT_PROMPT='$(git_prompt_info)'

if [[ -z "${GIT_PROMPT}" ]] ; then
    PROMPT+="$GIT_PROMPT"
else
    PROMPT+='%{$fg[blue]%} ➔%{$reset_color%} '
fi

ZSH_THEME_GIT_PROMPT_PREFIX="
%{$fg_bold[red]%}(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="
%{$fg[yellow]%}*%{$fg[blue]%}%{$fg[red]%})%{$fg[blue]%} ➔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[red]%})%{$fg[blue]%} ➔%{$reset_color%}"
