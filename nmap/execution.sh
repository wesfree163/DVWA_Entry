echo "init nmap scan"
echo "perhaps change system data to mask MAC or TrueIP"
nmap --privileged -p- -oN ___ demo.testfire.net #all port scan
nmap --privileged -p 80,443 --script=broadcast-dhcp-discover -oN ___ demo.testfire.net
nmap --privileged -p 80,443 --script=broadcast-igmp-discovery -oN ___ demo.testfire.net
nmap --privileged -p 80,443 --script=broadcast-listener -oN ___ demo.testfire.net
nmap --privileged -p 80,443 --script=broadcast-netbios-master-browser -oN ___ demo.testfire.net
nmap --privileged -p 80,443 --script=broadcast-upnp-info -oN ___ demo.testfire.net
nmap --privileged -p 80,443 --script=dns-blacklist -oN ___ demo.testfire.net
nmap --privileged -p 80,443 --script=dns-brute -oN ___ demo.testfire.net
nmap --privileged -p 80,443 --script=http-auth-finder -oN ___ demo.testfire.net
nmap --privileged -p 80 --script=http-form-brute -oN ___ " --script-args=userdb=users.txt,passdb=passwds.txt,brute.threads=2" demo.testfire.net
nmap --privileged -p 80,443 --script=http-security-headers,http-csrf -oN ___ demo.testfire.net
nmap --privileged -p 80 --script http-title,http-headers -oN ___ demo.testfire.net
nmap --privileged -p -O -sV -p 80,443 -oN ___ demo.testfire.net
nmap --privileged  -sV -p 80,443 --script=vulners -oN ___ demo.testfire.net
nmap --privileged -p 80,443 --script ssl-cert -oN ___ demo.testfire.net
nmap --privileged -p 80,443 --script ssl-enum-ciphers -oN ___ demo.testfire.net 
nmap --privileged -p 80,443 --script whois-ip -oN ___ demo.testfire.net
nmap --privileged -sV -sC -p 80,443 -T3 -oN ___ demo.testfire.net
