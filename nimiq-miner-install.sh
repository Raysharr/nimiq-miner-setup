#!/bin/bash
## Update and upgrade
sudo apt-get update
sudo apt-get -y upgrade

## Install dependencies
sudo apt-get install -y git build-essential nodejs
sudo apt-get install -y npm

## Get latest stable node version
sudo npm install -y n
cd ~/node_modules/n/bin
sudo ./n stable
cd ~


## Install yarn/gulp
sudo npm install -g yarn
sudo yarn global add gulp

## Clone nimiq core
sudo git clone https://github.com/nimiq-network/core

## Get Skypool
sudo wget https://github.com/skypool-org/skypool-nimiq-miner/releases/download/v1.2.0/skypool-nimiq-v1.2.0-linux-x64-broadwell.zip
sudo apt install unzip
unzip skypool-nimiq-v1.2.0-linux-x64-broadwell.zip

## Install Skypool
echo "/home/$USER/skypool-nimiq-v1.2.0-linux-x64-broadwell"
cd "/home/$USER/skypool-nimiq-v1.2.0-linux-x64-broadwell"

## Add your address to Skypool
sed -i "s/NQ48 8CKH BA24 2VR3 N249 N8MN J5XX 74DB 5XJ8/$1/g" config.txt

## Start mining
./skypool-node-client
