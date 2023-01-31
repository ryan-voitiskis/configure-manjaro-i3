# path to oh-my-zsh installation.
export ZSH=/home/vx/.oh-my-zsh

# zsh theme
ZSH_THEME="ys"

# display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# case-sensitive completion.
CASE_SENSITIVE="true"

# oh my zsh plugins
plugins=(
  git
)
source $ZSH/oh-my-zsh.sh

# aliases
alias vc='protonvpn-cli c --fastest'
alias vcs='protonvpn-cli c --sc'
alias vd='protonvpn-cli d'
alias vs='protonvpn-cli s'
alias cl='clear'
alias ..='cd ..'
alias ...='cd ../../'
alias myip='curl ifconfig.me'
alias nb='npm run build'
alias np='npm run preview'
alias nd='npm run dev'
alias nt='npm run test'
alias ntc='npm run testc'
alias nb='npm run build'
alias rr="ranger"
alias rs="redshift-gtk & disown"

function cs () {
  cd "$@" && ls
}

function csa () {
  cd "$@" && ls -la
}

# extract things
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1        ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1       ;;
      *.rar)       rar x $1     ;;
      *.gz)        gunzip $1     ;;
      *.tar)       tar xf $1        ;;
      *.tbz2)      tar xjf $1      ;;
      *.tgz)       tar xzf $1       ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1    ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
  	echo "'$1' is not a valid file"
  fi
}