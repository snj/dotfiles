# history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# prompt
function precmd_vcs() {
    vcs_info
    RPROMPT=$'%{\e[32m%}%~'${vcs_info_msg_0_}$'%{\e[m%}'
}
PROMPT=$'%{\e[31m%}%n@%M %{\e[33m%}%* %# %{\e[m%}'

# special functions
precmd_functions=(precmd_vcs)

function redrev() {
    perl -pe 's/^/\e[41m/ && s/$/\e[m/';
}


##################################################
# aliases

alias sl=ls
alias ls="LSCOLORS=gxfxxxxxcxxxxxxxxxxxxx ls -G"
alias ll="ls -l"
alias la="ll -a"
alias a="aquamacs"
alias oppai="git"
alias pa="ps aux"
alias pag="pa|grep $1"


##################################################
# functions

function goog()
{
  q=`echo "$@" | sed  -e "s/ /+/g"`
  w3m "google.co.jp/search?ie=UTF-8\&q=$q" 
 }

##################################################
# virtualenv

if test -d $HOME/.virtualenvs;then
export WORKON_HOME=$HOME/.virtualenvs
source `which virtualenvwrapper.sh`
fi

##################################################
# others

# key binds
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

# options
setopt autocd
setopt autopushd
setopt pushdignoredups

# completion
autoload -Uz compinit
compinit

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B--- %d ---%b'

zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ln=35 di=36

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*:kill:*:processes' command 'ps x'
zstyle ':completion:*:-command-:*' \
    fake-parameters CATALYST_DEBUG DBIC_TRACE PERL5LIB MICRO_TEMPLATE_DEBUG # for perl debug


# vcs
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats $'%{\e[35m%} [%s %r %b]%{\e[m%}'

# PATH
export PATH=~/android-sdk-macosx/platform-tools:$PATH

# PYTHON
export PYTHONSTARTUP=~/.pythonstartup

