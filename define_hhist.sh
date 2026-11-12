
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
      if [[ -n "$2" ]]; then
        histfile=${2}
        set_title "histfile: $histfile"
        HISTFILE=${HIST_DIR}/${histfile}
        echo "set HISTFILE=$HISTFILE"
      else
        echo "give a histfile"
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
      wc ${HISTFILE}
      ls -l ${HISTFILE}
      ;;
    ls)
      echo "..available histories:"
      ls ${HIST_DIR}
      ;;
    ll)
      echo "..available histories:"
      ls -l ${HIST_DIR}
      ;;
    cat)
      cat ${HISTFILE}
      ;;
    tail)
      tail -n ${HISTFILE}
      ;;
    *)
      echo "usage: hhist set|get|a|r|l|ls|ll|cat|tail"
      return
    esac
}
