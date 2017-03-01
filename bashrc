# ~/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# PS1 icons
PROMPT_SYMBOL="❯"
DIRTY_SYMBOL="☂"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT="%F %T "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#bash-git-prompt script
GIT_PROMPT_SHOW_UNTRACKED_FILES=no
GIT_PROMPT_THEME=Custom
GIT_PROMPT_FILE=~/.git_prompt-colors.sh
if [ -f $HOME/dotified/scripts/bash-git-prompt/gitprompt.sh ]; then source $HOME/dotified/scripts/bash-git-prompt/gitprompt.sh;
if [ "$color_prompt" = yes ]; then
        export PS1='\[\e[38;5:014m\]┌╼[\[\e[0;003m\]\w\[\e[38;5;014m\]]\n└╼  \[\e[0;32m\]'
    else
        export PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    fi
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
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -d ~/.bash_aliases.d ]; then
    for ba in $(ls -1 ~/.bash_aliases.d); do
        . ~/.bash_aliases.d/$ba
    done
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# show screenfetch
if [ -f $HOME/bin/screenfetch ]; then $HOME/bin/screenfetch; fi


PATH=$PATH:$HOME/bin:$HOME/bin/packer 
if [ -d $HOME/.config/composer ]; then
	PATH=$PATH:$HOME/.config/composer/vendor/bin;
fi

PATH=$PATH:/opt/google/chrome

# Console color support
function colorgrid( ) {
    iter=16
        while [ $iter -lt 52 ];  do
    second=$[$iter+36]
    third=$[$second+36]
    four=$[$third+36]
    five=$[$four+36]
    six=$[$five+36]
    seven=$[$six+36]
    if [ $seven -gt 250 ];then seven=$[$seven-251]; fi
    echo -en "\033[38;5;$(echo $iter)m█ "
    printf "%03d" $iter
    echo -en "   \033[38;5;$(echo $second)m█ "
    printf "%03d" $second
    echo -en "   \033[38;5;$(echo $third)m█ "
    printf "%03d" $third
    echo -en "   \033[38;5;$(echo $four)m█ "
    printf "%03d" $four
    echo -en "   \033[38;5;$(echo $five)m█ "
    printf "%03d" $five
    echo -en "   \033[38;5;$(echo $six)m█ "
    printf "%03d" $six
    echo -en "   \033[38;5;$(echo $seven)m█ "
    printf "%03d" $seven
    
    iter=$[$iter+1]
        printf '\r\n'
        done
}

#------------------------------------------////
# Colors:
#------------------------------------------////
#black='\e[0;30m'
#blue='\e[0;34m'
#green='\e[0;32m'
#cyan='\e[0;36m'
#red='\e[0;31m'
#purple='\e[0;35m'
#brown='\e[0;33m'
#lightgray='\e[0;37m'
#darkgray='\e[1;30m'
#lightblue='\e[1;34m'
#lightgreen='\e[1;32m'
#lightcyan='\e[1;36m'
#lightred='\e[1;31m'
#lightpurple='\e[1;35m'
#yellow='\e[1;33m'
#white='\e[1;37m'
#nc='\e[0m'
