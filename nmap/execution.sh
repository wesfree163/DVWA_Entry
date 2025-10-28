echo "init nmap scan | @ appox: "
echo "perhaps change system data to mask MAC or TrueIP"
mkdir nmap_scan
nmap --privileged -p- -oN nmap_scan/all_port_scan_ts $@ #all port scan
nmap --privileged -p 80,443 --script=broadcast-dhcp-discover -oN nmap_scan/dhcp $@
nmap --privileged -p 80,443 --script=broadcast-igmp-discovery -oN nmap_scan/igmp $@
nmap --privileged -p 80,443 --script=broadcast-listener -oN nmap_scan/listener $@
nmap --privileged -p 80,443 --script=broadcast-netbios-master-browser -oN nmap_scan/netbios $@
nmap --privileged -p 80,443 --script=broadcast-upnp-info -oN nmap_scan/upnp $@
nmap --privileged -p 80,443 --script=dns-blacklist -oN nmap_scan/dns_blacklist $@
nmap --privileged -p 80,443 --script=dns-brute -oN nmap_scan/dnsbrute $@
nmap --privileged -p 80,443 --script=http-auth-finder -oN nmap_scan/httpauth $@
nmap --privileged -p 80 --script=http-form-brute -oN nmap_scan/httpform " --script-args=userdb=users.txt,passdb=passwds.txt,brute.threads=2" $@
nmap --privileged -p 80,443 --script=http-security-headers,http-csrf -oN nmap_scan/http_one $@
nmap --privileged -p 80 --script http-title,http-headers -oN nmap_scan/http_two $@
nmap --privileged -p -O -sV -p 80,443 -oN nmap_scan/operating_system $@
nmap --privileged  -sV -p 80,443 --script=vulners -oN nmap_scan/vscript $@
nmap --privileged -p 80,443 --script ssl-cert -oN nmap_scan/certification $@
nmap --privileged -p 80,443 --script ssl-enum-ciphers -oN nmap_scan/enumeration $@ 
nmap --privileged -p 80,443 --script=targets-ipv6-multicast-echo,targets-ipv6-multicast-invalid-dst,targets-ipv6-multicast-slaac,targets-ipv6-multicast-mid -oN nmap_scan/acquisition $@
nmap --privileged -p 80,443 --script whois-ip -oN nmap_scan/whois $@
nmap --privileged -sV -sC -p 80,443 -T3 -oN nmap_scan/nmap $@
