eval "$(rbenv init -)"

# ===================================================================
# Aliases
# ===================================================================
alias ls="ls -G"
alias r32="RAILS_32=true bundle exec"

# ===================================================================
# Colors
# ===================================================================
BLACK='\[\033[0;30m\]'
BLACK_BOLD='\[\033[1;30m\]'

RED='\[\033[0;31m\]'
RED_BOLD='\[\033[1;31m\]'

GREEN='\[\033[0;32m\]'
GREEN_BOLD='\[\033[1;32m\]'

YELLOW='\[\033[0;33m\]'
YELLOW_BOLD='\[\033[1;33m\]'

BLUE='\[\033[0;34m\]'
BLUE_BOLD='\[\033[1;34m\]'

PURPLE='\[\033[0;35m\]'
PURPLE_BOLD='\[\033[1;35m\]'

CYAN='\[\033[0;36m\]'
CYAN_BOLD='\[\033[1;36m\]'

WHITE='\[\033[0;37m\]'
WHITE_BOLD='\[\033[1;37m\]'

RESET='\[\033[0m\]'

# ===================================================================
# ls Color Scheme
# ===================================================================
#
# Note that the following are standard ANSI colors.
# The actual display may differ depending on the color
# apabilities of the terminal in use.
# 
# a     black
# b     red
# c     green
# d     brown
# e     blue
# f     magenta
# g     cyan
# h     light grey
# A     bold black, usually shows up as dark grey
# B     bold red
# C     bold green
# D     bold brown, usually shows up as yellow
# E     bold blue
# F     bold magenta
# G     bold cyan
# H     bold light grey; looks like bright white
# x     default foreground or background
# 
# The order of the attributes are as follows:
# 
# 1.   directory
# 2.   symbolic link
# 3.   socket
# 4.   pipe
# 5.   executable
# 6.   block special
# 7.   character special
# 8.   executable with setuid bit set
# 9.   executable with setgid bit set
# 10.  directory writable to others, with sticky bit
# 11.  directory writable to others, without sticky bit
#
# The default is "exfxcxdxbxegedabagacad",
# i.e. blue foreground and default
export CLICOLOR=1
export LSCOLORS=xxFxCxDxCxegedabagaced

export EDITOR=vim
export RAILS_LOG_LEVEL=debug

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

# ===================================================================
# Prompts
# ===================================================================
function parse_git_status {
  [ -n "$(git status -z 2>/dev/null)" ] || return
  echo "*"
}

function parse_git_branch {
  [ -n "$(git branch 2>/dev/null)" ] || return
  echo "$(git branch | grep '*' | sed s/^\*\ // | sed s/[\(\)]//g)"
}

function git_prompt {
  local BRANCH="$(parse_git_branch)"
  local STATUS="$(parse_git_status)"

  [ -n "${BRANCH}" ] || return

  echo "(${BRANCH}${STATUS})"
}

export PS1="${CYAN}\W${BLACK_BOLD}\$(git_prompt)${CYAN}$ ${RESET}"
export PS2="${WHITE_BOLD}> ${RESET}"


# ===================================================================
# Aliases
# ===================================================================
gum() {
  local BRANCH="$(parse_git_branch)"

  if [ "${BRANCH}" == 'master' ]
  then
    git fetch upstream
    git reset --hard upstream/master
  else
    echo "You must be on master"
  fi
}

export NVM_DIR="/Users/jkarayusuf/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
