#!/bin/bash
#secure-ssh.sh
#author neloyy
#creates a new ssh user using $1 parameter
#adds a  public key from the local repo or curled from the remote repo 
#removes room ability to ssh in

sudo useradd -m -d /home/$1 -s /bin/bash $1

sudo mkdir /home/$1/.ssh
sudo chmod 700 /home/$1/.ssh

sudo cp /home/jake/Tech-Journal/SYS265/linux/public-keys/id_rsa.pub /home/$1/.ssh/authorized_keys
sudo chmod 600 /home/$1/.ssh/authorized_keys
sudo chown -R $1:$1 /home/$1/.ssh
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart sshd
 
