#!/bin/bash
# MESOS

function contains() {
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}

function join_menu () { 
  FILES=$1
  RES=""
  for index in ${!$FILES[*]}
  do
    RES="$RES $RES ${FILES[$index]}"
  done
  return ${RES:1}
}

function cfg () {
  case $1 in
    "mesos" ) 
      FILES[0]="/etc/default/mesos" 
      FILES[1]="/etc/default/mesos-master"  
      FILES[2]="/etc/default/mesos-slave" 
      FILES[2]="/etc/mesos/zk"
      TXT="Edit mesos configuration"
  esac
  config $TXT, $FILES
}

function config () {
  TXT=$1
  FILES=$2
  OPTIONS=join $FILES
  whiptail --title "$1" --menu "Choose an option" 20 78 16 OPTIONS
  CHOICEs=$?
  containsElement "a string" "${array[@]}"
  mcedit $1
}



