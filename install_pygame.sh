#!/bin/bash

function ProgressBar {
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

    printf "\rProgress : [${_fill// /\#}${_empty// /-}] ${_progress}%%"
}


cmds=(
      'sudo apt update'
      'sudo apt install python3-pip -y'
      'sudo pip3 install pygame'
     )


length=${#cmds[@]}

ProgressBar 0 ${length}

for number in $(seq 0 ${length})
do
    ${cmds[${number}]} &>/dev/null
    ProgressBar ${number} ${length}
done
printf '\nFinished!\n'
