#!/bin/sh

export LC_ALL=en_US.UTF-8

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
fi

_exists() {
  cmd="$1"
  if [ -z "$cmd" ] ; then
    echo "Usage: _exists cmd"
    return 1
  fi
  if type command >/dev/null 2>&1 ; then
    command -v $cmd >/dev/null 2>&1
  else
    type $cmd >/dev/null 2>&1
  fi
  ret="$?"
  return $ret
}

SCRIPT_URL="https://raw.githubusercontent.com/iKoolCore/PVE_Status_Tools/main/PVE_Status_Tools.sh"

if _exists curl ; then
  curl $INSTALL_URL | bash
elif _exists wget ; then
  wget -O - $INSTALL_URL | bash
else
  echo "Sorry, you must have curl or wget installed first."
  echo "Please install either of them and try again."
fi
