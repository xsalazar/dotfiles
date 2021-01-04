#!/bin/bash

install_core () {
  echo "Installing core tools..."
  apt-get install vim
  apt-get install curl
  apt-get install wget
  apt-get install unzip
}

install_git () {
  echo "Installing Git..."
  apt-get install git
}

install_chrome () {
  echo "Installing Chrome..."
  wget -P /tmp https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  dpkg -i /tmp/google-chrome-stable_current_amd64.deb

  rm /tmp/google-chrome*
}

install_python () {
  echo "Installing Python..."
  apt-get install python3
}

install_sublime () {
  echo "Installing Sublime tools..."
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  apt-get install apt-transport-https
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  apt-get update
  apt-get install sublime-text
  apt-get install sublime-merge
}

install_jetbrains () {
  echo "Installing Jetbrains Toolbox..."
  JETBRAINS_INSTALL_PATH="/tmp/jetbrains-toolbox-install"
  wget -P /tmp https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.19.7784.tar.gz # Cannot currently find a way to dynamically get the latest version
  mkdir $JETBRAINS_INSTALL_PATH
  tar xvzf /tmp/jetbrains-toolbox*.tar.gz -C $JETBRAINS_INSTALL_PATH
  cd $JETBRAINS_INSTALL_PATH && ./jetbrains-toolbox*/jetbrains-toolbox

  rm -r /tmp/jetbrains*
}

install_awscli () {
  echo "Installing AWS CLI..."
  snap install aws-cli --classic
}

install_vscode () {
  echo "Installing VSCode..."
  snap install code --classic
}

install_terraform () {
  echo "Installing Terraform..."
  curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
  sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
  sudo apt-get update && sudo apt-get install terraform
}

install_slack () {
  echo "Installing Slack..."
  snap install slack --classic
}

apt-get update
apt-get upgrade -y

install_core
install_git
install_chrome
install_python
install_sublime
install_jetbrains
install_awscli
install_vscode
install_terraform
install_slack

../.././init.sh
read -p "Press enter to continue..."
