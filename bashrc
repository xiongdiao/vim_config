# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
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
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# Alias definitions.  # You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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

# This configures the environment variables for a create based turtlebot
# running the Turtlebot 2.0 software. This is necessary to run after
# setup.bash to ensure the create drivers and nodes are all correctly launched.
#
# You may wish to set the 3d sensor to asus_xtion_pro if you do not have a kinect
# though. While the kinect settings work for the asus in terms of 3d sensing (openni
# handles the abstraction) the asus settiing makes sure the mesh shown in rviz/gazebo 
# is the asus.

#export TURTLEBOT_BASE=create
#export TURTLEBOT_STACKS=circles
#export TURTLEBOT_3D_SENSOR=kinect
#export TURTLEBOT_SIMULATION=false

# This configures the environment variables for a kobuki based turtlebot.
# Currently this script isn't actually needed as the values below are 
# defaults.
#
# You may wish to set the 3d sensor to asus_xtion_pro if you do not have a kinect
# though. While the kinect settings work for the asus in terms of 3d sensing (openni
# handles the abstraction) the asus settiing makes sure the mesh shown in rviz/gazebo 
# is the asus.

#export TURTLEBOT_BASE=kobuki
#export TURTLEBOT_STACKS=hexagons
#export TURTLEBOT_3D_SENSOR=kinect
#export TURTLEBOT_SIMULATION=false


#alias mkcscopefile='find `pwd` -name "*.[ch]" -o -name "*.cc" -o -name "*.cpp" -o -name "*.py" > cscope.files'
#alias mktag='ctags -R;cscope -Rbq -i cscope.files;rm cscope*'
alias mktags='mkdir .tag; find `pwd` -name "*.[ch]" -o -name "*.cc" -o -name "*.cpp" -o -name "*.py" > .tag/cscope.files; cd .tag; ctags -R; cscope -Rbq -i cscope.files; cd ..'
alias mkgitkeep='echo "# Ignore everything in this directory" > .gitkeep'
alias robot='ssh -l wwj 192.168.10.50'
alias set_deeplearning_env='conda activate deeplearning'
alias out_deeplearning_env='conda deactivate'

source /opt/ros/kinetic/setup.bash
#source /home/xd/project/catkin_ws/devel/setup.bash
source /home/xd/project/git_ws/hik_robot_project/service_robot/ros_project/devel/setup.bash
source /home/xd/project/xd_robot/xd_robot_test/devel/setup.bash

#编译工作空间时不生成java包
export ROS_LANG_DISABLE=genjava

#配置其它master主机的ip地址
#export ROS_MASTER_URI='http://192.168.43.56:11311'
#export ROS_MASTER_URI='http://192.168.10.50:11311'
#export ROS_MASTER_URI='http://192.168.10.100:11311'
#export ROS_MASTER_URI='http://192.168.1.100:11311'
export ROS_IP=$(ifconfig|grep "inet addr:"|grep -v "127.0.0.1"|cut -d: -f2|awk '{print $1}')
#export ROS_IP=192.168.10.185


export SVGA_VGPU10=0
export CSCOPE_EDITOR=vim

#lcm setting
export LCM_DEFAULT_URL="udpm://239.255.76.67:7667?ttl=1"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/xd/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/xd/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/xd/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/xd/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<
