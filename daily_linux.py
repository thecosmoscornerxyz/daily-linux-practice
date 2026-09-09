#!/usr/bin/env python3

import os
import sys
from datetime import datetime

# Add Signal_Link.py Path to File
sys.path.append("/opt/signal_link")

from signal_link import signal_link

base_dir = "/home/cosmos/Linux"

today = datetime.now()
year = today.strftime("%Y")
month = today.strftime("%B").lower()
day = today.strftime("%d").lstrip("0")


day_dir = os.path.join(base_dir, year, month, day)
system_dir = os.path.join(day_dir, "system")
permissions_dir = os.path.join(day_dir, "permissions")
usergroup_dir = os.path.join(day_dir, "usergroup")
systemd_dir = os.path.join(day_dir, "systemd")
process_dir = os.path.join(day_dir, "process")
network_dir = os.path.join(day_dir, "networking")
awk_dir = os.path.join(day_dir, "awk")
cut_dir = os.path.join(day_dir, "cut")
file_dir = os.path.join(day_dir, "file")
find_dir = os.path.join(day_dir, "find")
grep_dir = os.path.join(day_dir, "grep")
sed_dir = os.path.join(day_dir, "sed")
sort_dir = os.path.join(day_dir, "sort")
tr_dir = os.path.join(day_dir, "tr")
uniq_dir = os.path.join(day_dir, "uniq")
wc_dir = os.path.join(day_dir, "wc")

for path in [day_dir, system_dir, permissions_dir, usergroup_dir, systemd_dir, process_dir, network_dir, awk_dir, cut_dir, file_dir, find_dir, grep_dir, sed_dir, sort_dir, tr_dir, uniq_dir, wc_dir]:
    os.makedirs(path, exist_ok=True)

# ==== Cheat Sheets ==== #
system_cheatpath = os.path.join(system_dir, "cheatsheet.md")
system_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    'echo "=== Linux Warmup ==="\n'
    'echo "User: $(whoami)\n"'
    'echo "Hostname: $(hostname)"\n'
    'echo "Today is: $(date)"\n'
    'echo "Uptime: $(uptime -p)"\n'
    'echo "Current Directory: $(pwd)"\n'
    'echo\n'
    'echo "Disk Usage:"\n'
    'df -h / \n'
    'echo\n'
    'echo "IP Addresses"\n'
    'ip -brief addr\n'
    'echo\n'
    'echo "SSH Service:"\n'
    'systemctl is-active ssh || systemctl status ssh --no-pagher | head -n 5'
)

if not os.path.exists(system_cheatpath):
    with open(system_cheatpath, "w") as f:
        f.write(system_cheatcontent)

permissions_cheatpath = os.path.join(permissions_dir, "cheatsheet.md")
permissions_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    'rm -f file1 file2\n\n'
    'touch file1 file2\n\n'
    'echo "== Before =="\n'
    'ls -l\n\n'
    'chmod 600 file1\n'
    'chmod 754 file2\n\n'
    'sudo chown root:root file1\n'
    'sudo chown "$USER":"$USER" file2\n\n'
    'echo "== After =="\n'
    'ls -l\n\n'
    'echo "file 1 should be rw-------"\n'
    'echo "file2 should be rwxr-xr--"'
)

if not os.path.exists(permissions_cheatpath):
    with open(permissions_cheatpath, "w") as f:
        f.write(permissions_cheatcontent)

usergroup_path = os.path.join(usergroup_dir, "cheatsheet.md")
usergroup_content = (
    '#!/usr/bin/env bash\n\n'
    '# Create a Temp User\n'
    'sudo useradd -m tempuser01\n'
    'echo "Temp user created:"\n'
    'grep tempuser01 /etc/passwd\n\n'
    '# Add to a group (Create One if Needed)\n'
    'sudo groupadd -f tempgroup\n'
    'sudo usermod -aG tempgroup tempuser01\n\n'
    'echo "Groups for tempuser01:"\n'
    'id tempuser01\n\n'
    '# Check /etc/passwd & /etc/shadow entries\n'
    'echo "passwd entry:"\n'
    'grep tempuser01 /etc/passwd\n'
    'echo "shadow entry (hashed passwd only):"\n'
    'sudo grep tempuser01 /etc/shadow\n\n'
    '# Cleanup\n'
    'sudo userdel -r tempuser01\n'
    'echo "User Deleted"'
)

if not os.path.exists(usergroup_path):
    with open(usergroup_path, "w") as f:
        f.write(usergroup_content)

systemd_cheatpath = os.path.join(systemd_dir, "cheatsheet.md")
systemd_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    'SERVICE=cron # or cups, ssh, etc\n\n'
    'echo "== $SERVICE status =="\n'
    'systemctl status "$SERVICE" --no-pager | head -n 10\n\n'
    'echo "== Restarting =="\n'
    'sudo systemctl restart "$SERVICE"\n\n'
    'echo "== Enabling at Boot"\n'
    'sudo systemctl enable "$SERVICE"\n\n'
    'echo "== Last 10 Log Lines =="\n'
    'journalctl -u "$SERVICE" -n 10 --no-pager\n\n'
    'echo "== Disabling Service =="\n'
    'sudo systemctl disable "$SERVICE"\n\n'
    'echo "== Stopping Service =="\n'
    'sudo systemctl stop "$SERVICE"\n\n'
    'echo "== Final Status =="\n'
    'systemctl status "$SERVICE" --no-pager | head -n 10'
)

if not os.path.exists(systemd_cheatpath):
    with open(systemd_cheatpath, "w") as f:
        f.write(systemd_cheatcontent)

process_cheatpath = os.path.join(process_dir, "cheatsheet.md")
process_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    'sleep 600 &\n'
    'echo $!\n'
    'ps aux | grep sleep\n'
    'kill $!\n'
)

if not os.path.exists(process_cheatpath):
    with open(process_cheatpath, "w") as f:
        f.write(process_cheatcontent)

network_cheatpath = os.path.join(network_dir, "cheatsheet.md")
network_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    'echo "IP Info"\n'
    'ip -brief addr\n\n'
    'echo "Routes"\n'
    'ip route\n\n'
    'echo "DNS Test"\n'
    'dig + short google.com || nslookup google.com \n\n'
    'echo "Open Listening Ports"\n'
    'ss -tulnp | head -n 10\n\n'
    'echo “tcpdump anyport”\n'
    'sudo timeout 10 tcpdump -n -i any | head -n 30\n\n'
    'echo “nmap loopback address”\n'
    'nmap -Pn 127.0.0.1\n\n'
    'echo “arp table”\n'
    'ip neigh'
)

if not os.path.exists (network_cheatpath):
    with open (network_cheatpath, "w") as f:
        f.write(network_cheatcontent)

awk_cheatpath = os.path.join(awk_dir, "cheatsheet.md")
awk_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    'echo "boogers boogers2 boogers3" | tee boogers.md\n'
    'echo "no shit sherlock" >> boogers.md\n\n'
    "awk '{print $1}' boogers.md\n"
    "awk '/no/' boogers.md\n"
    "awk '{print NR, $0}' boogers.md\n"
    "awk 'NR == 2 {print $0}' boogers.md\n"
    "awk '{print NF}' boogers.md\n"
    "awk '{print $NF}' boogers.md\n"
    "awk -F: '{print $1, $3, $7}' /etc/passwd\n"
    "awk 'END {print \"Total Lines:\", NR}' boogers.md\n"
)

if not os.path.exists (awk_cheatpath):
	with open(awk_cheatpath, "w") as f:
		f.write(awk_cheatcontent)
		
cut_cheatpath = os.path.join(cut_dir, "cheatsheet.md")
cut_cheatcontent = (
	'#!/usr/bin/env bash\n\n'
	'cut -d" " -f1 boogers.md\n'
	'cut -d" " -f1,3 boogers.md\n'
	'cut -c1-5 boogers.md\n'
	'cut -d: -f1,7 /etc/passwd'
)

cut_boogers_path = os.path.join(cut_dir, "boogers.md")
cut_boogers_content = (
	'boogers boogers2 boogers3\n'
	'no shit sherlock'
)

if not os.path.exists(cut_cheatpath):
	with open(cut_cheatpath, "w") as f:
		f.write(cut_cheatcontent)
		
if not os.path.exists(cut_boogers_path):
	with open(cut_boogers_path, "w") as f:
		f.write(cut_boogers_content)
		
file_cheatpath = os.path.join(file_dir, "cheatsheet.md")
file_cheatcontent = (
	'#!/usr/bin/env bash\n\n'
	'echo "boogers" | tee boogers.md\n\n'
	'file boogers.md\n'
	'file /bin/bash\n'
	'file /etc/passwd\n'
)

if not os.path.exists(file_cheatpath):
	with open(file_cheatpath, "w") as f:
		f.write(file_cheatcontent)
		
find_cheatpath = os.path.join(find_dir, "cheatsheet.md")
find_cheatcontent = (
	'#!/usr/bin/env bash\n\n'
	'find . -name "*.md"\n'
	'find . -type f\n'
	'find . -type d\n'
	'find . -type f -size +1M\n'
	'find . -type f -mtime -7'
)

if not os.path.exists(find_cheatpath):
	with open(find_cheatpath, "w") as f:
		f.write(find_cheatcontent)
		
grep_cheatpath = os.path.join(grep_dir, "cheatsheet.md")
grep_cheatcontent = (
	'#!/usr/bin/env bash\n\n'
	'grep -i "BOOGERS" boogers.md\n'
	'grep -v "boogers" boogers.md\n'
	'grep -n "shit" boogers.md\n'
	'grep -c "boogers" boogers.md\n'
	'grep -E "boogers|sherlock" boogers.md'
)

grep_booger_path = os.path.join(grep_dir, "boogers.md")
grep_booger_content = (
	'BOOGERS boogers boogers2\n'
	'no shit sherlock'
)

if not os.path.exists(grep_cheatpath):
	with open(grep_cheatpath, "w") as f:
		f.write(grep_cheatcontent)
		
if not os.path.exists(grep_booger_path):
	with open(grep_booger_path, "w") as f:
		f.write(grep_booger_content)
		
sed_cheatpath = os.path.join(sed_dir, "cheatsheet.md")
sed_cheatcontent = (
	'#!/usr/bin/env bash\n\n'
	'sed -n "1p" boogers.md\n'
	'sed -n "1,2p" boogers.md\n'
	'sed "s/boogers/shit/" boogers.md\n'
	'sed "/sherlock/d" boogers.md'
)

sed_boogers_path = os.path.join(sed_dir, "boogers.md")
sed_boogers_content = (
    'BOOGERS boogers boogers2\n'
    'no shit sherlock\n'
)

if not os.path.exists(sed_boogers_path):
    with open(sed_boogers_path, "w") as f:
        f.write(sed_boogers_content)

if not os.path.exists(sed_cheatpath):
	with open(sed_cheatpath, "w") as f:
		f.write(sed_cheatcontent)
		
sort_cheatpath = os.path.join(sort_dir, "cheatsheet.md")
sort_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    'sort boogers.md\n'
    'sort -r boogers.md\n'
    'sort -k2 -n boogers.md\n'
    'sort -k2 -nr boogers.md\n'
)

sort_boogers_path = os.path.join(sort_dir, "boogers.md")
sort_boogers_content = (
    'banana 20\n'
    'apple 100\n'
    'cherry 5\n'
)

if not os.path.exists(sort_cheatpath):
	with open(sort_cheatpath, "w") as f:
		f.write(sort_cheatcontent)
		
if not os.path.exists(sort_boogers_path):
	with open(sort_boogers_path, "w") as f:
		f.write(sort_boogers_content)
		
tr_cheatpath = os.path.join(tr_dir, "cheatsheet.md")
tr_cheatcontent = (
	'#!/usr/bin/env bash\n\n'
	'echo "boogers are cool" | tr "a-z" "A-Z"\n'
	'echo "boogers123" | tr -d "0-9"'
)

if not os.path.exists(tr_cheatpath):
		with open(tr_cheatpath, "w") as f:
			f.write(tr_cheatcontent)
			
uniq_cheatpath = os.path.join(uniq_dir, "cheatsheet.md")
uniq_cheatcontent = (
	'#!/usr/bin/env bash\n\n'
	'uniq boogers.md\n'
	'uniq -c boogers.md\n'
	'uniq -d boogers.md\n'
	'uniq -u boogers.md'
)

uniq_boogers_path = os.path.join(uniq_dir, "boogers.md")
uniq_boogers_content = (
    'apple\n'
    'apple\n'
    'apple\n'
    'banana\n'
    'banana\n'
    'cherry\n'
)

if not os.path.exists(uniq_cheatpath):
	with open(uniq_cheatpath, "w") as f:
		f.write(uniq_cheatcontent)
		
if not os.path.exists(uniq_boogers_path):
	with open(uniq_boogers_path, "w") as f:
		f.write(uniq_boogers_content)
		
wc_cheatpath = os.path.join(wc_dir, "cheatsheet.md")
wc_cheatcontent = (
	'#!/usr/bin/env bash\n\n'
	'wc boogers.md\n'
	'wc -l boogers.md\n'
	'wc -w boogers.md\n'
	'wc -c boogers.md'
)

wc_boogers_path = os.path.join(wc_dir, "boogers.md")
wc_boogers_content = (
    'boogers boogers2 boogers3\n'
    'no shit sherlock\n'
)

if not os.path.exists(wc_cheatpath):
    with open(wc_cheatpath, "w") as f:
        f.write(wc_cheatcontent)

if not os.path.exists(wc_boogers_path):
    with open(wc_boogers_path, "w") as f:
        f.write(wc_boogers_content)

print(f"Created daily folder structure for {today.strftime('%Y-%m%d')}")

# Don't Forget to chmod +x the ./system<number> script!

signal_link("daily_linux.py", "dailybox-prod-LXC")
