
#!/bin/bash

# define_hhist.sh creates the hhist function to manage bash history.
# www.gnu.org/software/bash/manual/html_node/Bash-History-Builtins.html

# Add this line to .bash_aliases:
# source ~/define_hhist.sh

HIST_DIR=~/history
HISTFILE=${HIST_DIR}/default

function hhist() {
  #
  echo "in hhist"
  case "$1" in
    set)
      if ! [ -z "$2" ]; then
        file=$2
        HISTFILE=${HIST_DIR}/"$2"
        set_title [venv:\ $2]
        echo "set HISTFILE=$HISTFILE"
      else
        echo "give a subdir"
      fi
      return
      ;;
    get)
      echo "HISTFILE=$HISTFILE"
      ;;
    a)
      echo "..appending history to ${HISTFILE}"
      history -a
      ;;
    r)
      echo "..restoring history from ${HISTFILE}"
      history -r
      ;;
    l)
      echo "..available histories:"
      ll ${HIST_DIR}
      ;;
    cat)
      cat ${HISTFILE}
      ;;
    tail)
      tail -n 20 ${HISTFILE}
      ;;
    *)
      echo "usage: hhist set|get|a|r|l|cat|tail"
      return
  esac  
}
