#!/bin/bash

# call any named bash function under sudo with arbitrary arguments
run_escalated_function() {
  local function_name args_q
  function_name=$1; shift || return
  printf -v args_q '%q ' "$@"
  sudo bash -c "$(declare -f "$function_name"); $function_name $args_q"
}

# call any named bash function under sudo with arbitrary arguments
run_escalated_script(path) {
  sudo bash -c path
}

echo "Installing packages..."
run_escalated_script("./packages/packages.sh")
echo "Packages installed!"

echo "Installing devops tools..."
./devops/devops.sh
echo "devops tools installed!"

echo "Installing zsh..."
./zsh/zsh.sh
echo "zsh installed!"

echo "Installing editor..."
./editor/editor.sh
echo "Editor installed!"
