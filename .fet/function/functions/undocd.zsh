#!/bin/zsh
local prev_dirs_num="${#_fet_path_previous_dirs[@]}"
if [ $prev_dirs_num -gt 0 ]; then
  _fet_path_selected_path=${_fet_path_previous_dirs[$prev_dirs_num]}
  _fet_path_previous_dirs=(${_fet_path_previous_dirs[1,-2]})
  if [ -n "$_fet_path_selected_path" ]; then
    _fet_path_following_dirs+=($PWD)
    function chpwd() {}
    cd $_fet_path_selected_path
    function chpwd() {lsi ././}
  fi
fi
