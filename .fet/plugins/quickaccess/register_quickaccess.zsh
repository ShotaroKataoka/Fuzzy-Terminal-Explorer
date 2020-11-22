#!/bin/zsh
echo '0' >| ~/.fet/.status/.register_quickaccess.status
echo 'Please write name of this quickaccess.'
local input_qaname=$_fet_path_selected_path
trap 'return' SIGINT
vared input_qaname
input_qaname=$(echo $input_qaname | sed 's/,/_/' | sed 's/\t/ /')
local -A pathes=()
IFS=$'\n'
for _dict in `cat ~/.fet/quickaccess.setting`
do
  local _key=$(echo $_dict | awk -F", *" '{print $1}' )
  local _value=$(echo $_dict | awk -F", *" '{print $2}' )
  pathes[$_key]=$_value
done
pathes[$input_qaname]=$PWD/$_fet_path_selected_path
echo >| ~/.fet/quickaccess.setting
for key in ${(k)pathes}; do
  echo "$key, ${pathes[$key]}" >> ~/.fet/quickaccess.setting
done