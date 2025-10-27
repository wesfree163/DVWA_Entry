$ now = `date`
echo "init nmap scan | @ appox: $now"
echo "perhaps change system data to mask MAC or TrueIP"
nmap --privileged -p- -oN all_port_scan_ts$now demo.testfire.net #all port scan
nmap --privileged -p 80,443 --script=broadcast-dhcp-discover -oN dhcp$now demo.testfire.net
nmap --privileged -p 80,443 --script=broadcast-igmp-discovery -oN igmp$now demo.testfire.net
nmap --privileged -p 80,443 --script=broadcast-listener -oN listener$now demo.testfire.net
nmap --privileged -p 80,443 --script=broadcast-netbios-master-browser -oN netbios$now demo.testfire.net
nmap --privileged -p 80,443 --script=broadcast-upnp-info -oN upnp$now demo.testfire.net
nmap --privileged -p 80,443 --script=dns-blacklist -oN dns_blacklist$now demo.testfire.net
nmap --privileged -p 80,443 --script=dns-brute -oN dnsbrute$now demo.testfire.net
nmap --privileged -p 80,443 --script=http-auth-finder -oN httpauth$now demo.testfire.net
nmap --privileged -p 80 --script=http-form-brute -oN httpform$now " --script-args=userdb=users.txt,passdb=passwds.txt,brute.threads=2" demo.testfire.net
nmap --privileged -p 80,443 --script=http-security-headers,http-csrf -oN http_one$now demo.testfire.net
nmap --privileged -p 80 --script http-title,http-headers -oN http_two$now demo.testfire.net
nmap --privileged -p -O -sV -p 80,443 -oN operating_system$now demo.testfire.net
nmap --privileged  -sV -p 80,443 --script=vulners -oN vscript$now demo.testfire.net
nmap --privileged -p 80,443 --script ssl-cert -oN certification$now demo.testfire.net
nmap --privileged -p 80,443 --script ssl-enum-ciphers -oN enumeration$now demo.testfire.net 
nmap --privileged -p 80,443 --script whois-ip -oN whois$now demo.testfire.net
nmap --privileged -sV -sC -p 80,443 -T3 -oN nmap$now demo.testfire.net
