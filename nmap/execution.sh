echo "init nmap scan | @ appox: "
echo "perhaps change system data to mask MAC or TrueIP"
nmap --privileged -p- -oN all_port_scan_ts $@ #all port scan
nmap --privileged -p 80,443 --script=broadcast-dhcp-discover -oN dhcp $@
nmap --privileged -p 80,443 --script=broadcast-igmp-discovery -oN igmp $@
nmap --privileged -p 80,443 --script=broadcast-listener -oN listener $@
nmap --privileged -p 80,443 --script=broadcast-netbios-master-browser -oN netbios $@
nmap --privileged -p 80,443 --script=broadcast-upnp-info -oN upnp $@
nmap --privileged -p 80,443 --script=dns-blacklist -oN dns_blacklist $@
nmap --privileged -p 80,443 --script=dns-brute -oN dnsbrute $@
nmap --privileged -p 80,443 --script=http-auth-finder -oN httpauth $@
nmap --privileged -p 80 --script=http-form-brute -oN httpform " --script-args=userdb=users.txt,passdb=passwds.txt,brute.threads=2" $@
nmap --privileged -p 80,443 --script=http-security-headers,http-csrf -oN http_one $@
nmap --privileged -p 80 --script http-title,http-headers -oN http_two $@
nmap --privileged -p -O -sV -p 80,443 -oN operating_system $@
nmap --privileged  -sV -p 80,443 --script=vulners -oN vscript $@
nmap --privileged -p 80,443 --script ssl-cert -oN certification $@
nmap --privileged -p 80,443 --script ssl-enum-ciphers -oN enumeration $@ 
nmap --privileged -p 80,443 --script whois-ip -oN whois $@
nmap --privileged -sV -sC -p 80,443 -T3 -oN nmap $@
