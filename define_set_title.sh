
# The set_title functions set the title at the top of the window tab.
# This functions sets the title to: <user> <current directory> <optional $1>

# https://tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html
# The sequence \033]0; or \e]0; initiates the title setting, followed by your desired title,
# and terminated by \007 (the ASCII bell character) or \a

# Original default value:
# PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$''
 
function set_title () {
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
  PS1="\[\e]0;\u@\h: \w $1\a\]$PS1"
}
