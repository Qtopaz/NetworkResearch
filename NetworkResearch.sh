#!/bin/bash

# Author: Topaz Daniel
# Project: Anonymous Scanner
# Description: Anonymous SSH scanner and remote access tool using Tor, Nipe, Nmap, and SSH automation over target networks.

# 1. Install relevant applications on the local computer. 

function INSTL()
{
	sudo apt-get update 1>/dev/null 
	
	git clone https://github.com/htrgouvea/nipe && cd nipe 1>/dev/null 
	
	sudo cpan install Try::Tiny Config::Simple JSON 1>/dev/null 
	
	perl nipe.pl install 1>/dev/null 
	
	cd ~/nipe
}

	if [ ! -d ~/nipe ] 

then
    echo "installing nipe tool.." 
	INSTL

else
     cd ~/nipe
     
fi     	

# 2. Check if the connection is anonymous

sudo apt-get install geoip-bin 1>/dev/null 


function ANON ()
{
IP=$(curl -s ifconfig.me)
CHK=$(geoiplookup $IP | awk '{print $4}' | awk -F ',' '{print $1}')

if [ -z $(echo $CHK | grep -i IL) ] 
then
    
    sudo perl nipe.pl start 1>/dev/null                                    
    sudo perl nipe.pl restart 1>/dev/null 
    
ADD=$(curl -s ifconfig.me)

echo "You are anonymous - $ADD"
echo "Your IP address now , is from:" 
geoiplookup $ADD

else 
    echo "You are anonymous"

fi 
}

ANON

sudo apt-get install nmap 1>/dev/null 
sudo apt-get install sshpass 1>/dev/null 
sudo service ssh start 1>/dev/null 

# Open port 22 
function VPS ()
{
	
read -p "Please enter the anon network address: " NET
read -p "Please enter your username: " USER 
read -p "Please enter password: " PASS

## scan the network of the user 
sshpass -p "$PASS" ssh -o StrictHostKeyChecking=no $USER@$NET "nmap -n $NET/24 -p 22 --open | grep report | awk '{print $5}'"

}

VPS