#!/bin/bash
if [ `id -u` != "0" ]; then
 echo "[!] Needs root to run" 
 exit
fi

P_TOOLS='/opt/pentest_tools'
# Creating the directory
echo "[-] Creating directories" 
mkdir -p $P_TOOLS/linux/privesc
mkdir -p $P_TOOLS/windows/privesc
mkdir -p $P_TOOLS/windows/exploits
mkdir $P_TOOLS/web

# Stuff to Install
echo "[-] Installing stuff" 
#
#
apt install xclip -y 
apt install libssl-dev -y 
# Download SecList to /usr/share/wordlists
#
#
# Install GoBuster
apt install gobuster -y 


# Cross Compile Tools and Libs
#

# Database client 
apt install dbeaver -y 

## Other tools
WORKDIR='/opt'
cd $WORKDIR
git clone https://github.com/EnableSecurity/sipvicious && cd sipvicious/ && python3 setup.py install
git clone https://github.com/bonsaiviking/NfSpy.git


## Linux Stuff
WORKDIR=$P_TOOLS/linux/privesc
cd $WORKDIR
echo "[-] Downloading Linux Privesc utils"
echo "[-] Downloading LinEnum.sh"
wget -q "https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh"

echo "[-] Downloading linpeas.sh"
wget -q "https://raw.githubusercontent.com/carlospolop/privilege-escalation-awesome-scripts-suite/master/linPEAS/linpeas.sh"

echo "[-] Downloading Linux-exploit-suggester-2.pl"
wget -q "https://raw.githubusercontent.com/jondonas/linux-exploit-suggester-2/master/linux-exploit-suggester-2.pl" 

echo "[-] Downloading Linux-exploit-suggester.sh"
wget -q 'https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh' 

echo "[-] Downloading linuxprivchecker.py"
wget -q 'https://raw.githubusercontent.com/sleventyeleven/linuxprivchecker/master/linuxprivchecker.py' 

## Windows Stuff
### General
WORKDIR=$_TOOLS/windows/
cd $WORKDIR
echo "[-] Downloading kali-windows-binaries"
git clone https://github.com/interference-security/kali-windows-binaries.git 

###  Windows Exploits
WORKDIR=$_TOOLS/windows/exploits
cd $WORKDIR
echo "[-] Downloading WindowsExploits from abatchy17"
git clone https://github.com/abatchy17/WindowsExploits.git

echo "[-] Downloading windows-kernel-exploits from SecWiki"
git clone https://github.com/SecWiki/windows-kernel-exploits.git

### Windows PrivEsc 
WORKDIR=$_TOOLS/windows/privesc
cd $WORKDIR

echo "[-] Downloading windows-privesc-check2.exe from PentestMonkey"
wget -q "https://github.com/pentestmonkey/windows-privesc-check/raw/master/windows-privesc-check2.exe"


echo "[-] Downloading WinPEAS Bat version"
wget -q "https://raw.githubusercontent.com/carlospolop/privilege-escalation-awesome-scripts-suite/master/winPEAS/winPEASbat/winPEAS.bat"

echo "[-] Downloading WinPEAS.exe x64 version"
wget -q "https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/winPEAS/winPEASexe/winPEAS/bin/x64/Release/winPEAS.exe" -O winPEAS_x64.exe

echo "[-] Downloading WinPEAS.exe x86 version"
wget -q "https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/winPEAS/winPEASexe/winPEAS/bin/x86/Release/winPEAS.exe" -O winPEAS_x86.exe


#git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git

#wget https://raw.githubusercontent.com/carlospolop/privilege-escalation-awesome-scripts-suite/master/winPEAS/winPEASbat/winPEAS.bat 

echo "[-] Updating bashrc" 
cat faster >> ~/.bashrc
