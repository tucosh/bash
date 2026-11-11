# https://tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html
# https://www.baeldung.com/linux/current-tab-title

# \u represents the username of the current user, which we follow with a literal @ for visual separation
# \h represents the hostname or the machine name of the system
# \w represents the current working directory
# \$ refers to the prompt symbol for the regular user, which we follow with a space for visual separation

# The sequence \033]0; or \e]0; initiates the title setting, followed by your desired title,
# and terminated by \007 (the ASCII bell character) or \a

function set_title () {
  # Original default value:
  # PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$''
  # This defines the command line prompt: (<user>@<host>:<cwd>$)
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
  # Prepend the tab title enclosed by escape sequences.
  # The escaped titling string is itself enclosed by non-print chars \[ .. \]
  # These are used by Bash to calculate the prompt’s visible width correctly.
  # The tab title will be: <user>@<host>:<cwd> $1
  PS1="\[\e]0;\u@\h: \w $1\a\]$PS1"
}
