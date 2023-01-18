# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

set editing-mode vi
set -o vi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
   if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
      color_prompt=yes
   else
      color_prompt=
   fi
fi

if [ "$color_prompt" = yes ]; then

   COLOR_GREEN="\033[01;32m"
   COLOR_ORANGE="\033[01;36m"
   COLOR_RED="\033[01;31m"
   COLOR_YELLOW="\033[01;33m"
   COLOR_YELLOWA="\033[00;93m"
   COLOR_OCHRE="\033[38;5;95m"
   COLOR_BLUE="\033[1;34m"
   COLOR_WHITE="\033[0;37m"
   COLOR_WHITEA="\033[00m"
   COLOR_WHITEB="\033[00;97m"
   COLOR_RESET="\033[0m"

   function git_ident {
      local git_status="$(git status 2>&1 )" # 2> /dev/null)"
      if [[ $git_status =~ "Your branch is up to date with" ]]; then
         echo -e '=)'
      elif [[ $git_status =~ "Your branch is ahead of" ]]; then
         echo -e '+)'
      elif [[ $git_status =~ "Your branch is behind " ]]; then
         echo -e '-)'
      elif [[ $git_status =~ "not a git repository" ]]; then
         echo -e ''
      else
         echo -e '?)'
      fi
   }
   function git_color {
      local git_status="$(git status 2> /dev/null)"
      if [[ $git_status =~ "nothing to commit" ]]; then
        echo -e $COLOR_GREEN
      elif [[ $git_status =~ "Changes not staged for commit" ]]; then
        echo -e $COLOR_RED
      elif [[ $git_status =~ "Changes to be committed" ]]; then
        echo -e $COLOR_YELLOW
      else
        echo -e $COLOR_YELLOW
      fi
   }
   function git_branch {
      local git_status="$(git status 2> /dev/null)"
      local on_branch="On branch ([^${IFS}]*)"
      local on_commit="HEAD detached at ([^${IFS}]*)"

      if [[ $git_status =~ $on_branch ]]; then
        local branch=${BASH_REMATCH[1]}
        echo "($branch"
      elif [[ $git_status =~ $on_commit ]]; then
        local commit=${BASH_REMATCH[1]}
        echo "($commit"
      fi
   }
   parse_git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1/'
   }
#    PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[1;31m\]\w\[\033[0;93m\]\$(parse_git_branch)\[\033[0;97m\]\$ "
    PS1="\[$COLOR_BLUE\]\u@\h"
    PS1+="\[$COLOR_WHITEA\]:"
    PS1+="\[$COLOR_ORANGE\]\w"
    PS1+="\[\$(git_color)\]"        # colors git status
#    PS1+="\$(parse_git_branch)"
    PS1+="\$(git_branch)"
    PS1+="\$(git_ident)"
    PS1+="\[$COLOR_WHITEB\]\$\[$COLOR_RESET\] "   # '#' for root, else '$'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'

    alias grep='grep -n --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias gitlog='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias ll='ls -alF'
alias lsa='ls -A'
alias ltt='ls -lt *.tex'
alias l='ls -CF'
alias c='clear'
alias d='$HOME/.dropbox-dist/dropboxd & '
alias g='gnuplot'
alias x='chmod +x'
alias m='more'
alias r='fc -s'
alias h='history'
alias ee='kill -9 $(ps | grep python | cut -f2 -d: | cut -f1 -d"p")'
alias jup1='ssh -X jupiter1 -l geev'
alias jup2='ssh -X jupiter2 -l geev'
alias lp1='lpr -o sides=two-sided-long-edge -o media="a4" -o fit-to-page'
alias mtm='~/Dropbox/MT_Software_Suite_linux-x64_2019.1.1/mtmanager/linux-x64/bin/mtmanager'
alias lock='gnome-screensaver-command -l'
alias logout='gnome-session-quit'


function evince {
   rm -r  ~/.config/ibus
   /usr/bin/evince $1
}

function dworkl {
   xrandr --output DP-1-0 --mode 2560x1440
   xrandr --output DP-1-1 --mode 2560x1440
}

function dwork {
   xrandr --output DP-2 --mode 2560x1440
   xrandr --output DP-3 --mode 2560x1440
}

#alias venv='. ~/ERT/venv/bin/activate'
function venv {
   sed -i 's/PS1="(venv) /PS1="$COLOR_YELLOW(venv) $COLOR_RESET/'  ~/ERT/venv/bin/activate
   . ~/ERT/venv/bin/activate
}

function gg {
   grep -ir "$1" *   | sed -e "/Binary file/d" -e "/html/d"
}

function ff {
   find . -name "$1" -print
}

function cmd {
   if [ -f $HOME/bin/$1 ]
   then
      vi $HOME/bin/$1
   else
      echo "cannot find file $1"
   fi
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


PATH="$PATH:/usr/local/bin"
PATH="$PATH:/ecl/macros"
PATH="$PATH:$HOME/.tecplot/360ex_2022r2/bin"
PATH="$PATH:$HOME/.tecplot/chorus_2022r2/bin"
PATH="$PATH:$HOME/.tecplot/tecplotrs2021r2/bin"
PATH="$PATH:$HOME/bin"
PATH="$PATH:$HOME/.local/bin"
#PATH="$HOME/.gnuplot/bin:$PATH"
#export GNUPLOT_DRIVER_DIR=/home/AD.NORCERESEARCH.NO/geev/.gnuplot/libexec/gnuplot/5.4
PATH="$PATH:."

export FCEDIT=vi
export EDITOR=vi
export GIT_EDITOR=vim


export ERT_SHOW_BACKTRACE=1

export TEXINPUTS=.:$HOME/texmf/:$HOME/texinputs/:$TEXINPUTS
export BIBINPUTS=.:$HOME/Dropbox/Bibs
export BSTINPUTS=.:$HOME/texinputs/:$BSTINPUTS

export LM_LICENSE_FILE=/ecl/macros/license.lic

export LC_NUMERIC="en_US.UTF-8"

export GREP_COLORS='ms=01;31:mc=01;31:sl=:cx=31:fn=33:ln=32:bn=32:se=36'
export CDPATH=".:../:$HOME:$HOME/Dropbox/:$HOME/Dropbox/Programs:$HOME/Dropbox/Projects:$HOME/Dropbox/Papers:$HOME/Dropbox/Apps/Overleaf/:$HOME/Dropbox/Statoil/:$HOME/ERT"

