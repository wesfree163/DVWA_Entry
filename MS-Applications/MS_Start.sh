# step 1
# Start/ensure PostgreSQL (Metasploit DB)
sudo systemctl start postgresql
# Initialize msfdb if not already done (one-time)
sudo msfdb init   # or: sudo msfdb reinit

# Update package list (optional)
sudo apt update && sudo apt install -y metasploit-framework nikto whatweb gobuster


# ----------------------------------------------------------------------------------------
# Step 3
# Simple run (non-interactive)
sudo msfconsole -q -r /root/scan_demo.rc

# If you need SSL/HTTPS globally:
sudo msfconsole -q -x "setg RPORT 443; setg SSL true; resource /root/scan_demo.rc"

# ----------------------------------------------------------------------------------------
# Step 4
# fast web technology fingerprint
whatweb -v demo.testfire.net | tee /root/demo_whatweb.txt

# nikto scan (non-invasive-ish; can be noisy) - use only if in-scope
nikto -h https://demo.testfire.net -output /root/demo_nikto.txt

# simple curl headers and save landing page (evidence)
curl -I https://demo.testfire.net -o /root/demo_headers.txt
curl -L https://demo.testfire.net -o /root/demo_homepage.html

# gobuster directory discovery (wordlist-based)
gobuster dir -u https://demo.testfire.net -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -o /root/demo_gobuster.txt -t 20
