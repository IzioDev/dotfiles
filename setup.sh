#!/bin/bash

echo "Need to elevate as sudo to install packages..."
sudo -v

echo "Installing packages..."
./packages/packages.sh
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
