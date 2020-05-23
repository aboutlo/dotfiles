# oh-my-zsh Theme
# Default robbyrussell theme with robbyrussell.zsh-theme version info.
# Installation: place this file in .oh-my-zsh/custom/themes/robbyrussell.zsh_theme

function node_prompt_version {
    if which node &> /dev/null; then
        echo "$(node -v)"
    fi
}

PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
PROMPT+='%{$fg_bold[green]%}⬢ $(node_prompt_version)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%} %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"
