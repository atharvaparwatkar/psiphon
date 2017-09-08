#!bin/bash
echo 'Installing Dependencies'
sudo apt-get install python-pip
sudo apt-get install libz-dev
sudo pip install wget
sudo pip install pexpect
wget https://www.openssl.org/source/openssl-1.0.2l.tar.gz
tar -xvzf openssl-1.0.2l.tar.gz
cd openssl-1.0.2l/
./configure
make
make test
make install
sudo apt-get install libssl-dev
cd
git clone https://github.com/thispc/psiphon.git
cd psiphon
cd openssh-5.9p1
./configure
make
cd ..
rm ssh
cp openssh-5.9p1/ssh .
python psi_client.py -u
echo 'alias psiphon="cd ~/psiphon && python psi_client.py"' >> ~/.bashrc
echo 'Psiphon Installation is Successfully Completed'
