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
    'line () {\n'
    '\tprintf \'%*s\' 50 \'\' | tr \' \' \'-\'\n'
    '\techo\n'
    '}\n\n'
    'blue () {\n'
    '\tgum style --foreground 39 "$@"\n'
    '}\n\n'
    'bubble () {\n'
    '\tgum style --border rounded\n'
    '}\n\n'
    'figlet System\n'
    'line\n'
    '{\n'
    '\tblue "Linux Warmup" | bubble\n'
    '\tline\n'
    '\techo "User: $(whoami)"\n'
    '\techo "Hostname: $(hostname)"\n'
    '\techo "Uptime: $(uptime -p)"\n'
    '\techo "Today is: $(date)"\n'
    '\tline\n'
    '\tblue "Disk Usage:" | bubble\n'
    '\tdf -h /\n'
    '\tline\n'
    '\tblue "IP Address:" | bubble\n'
    '\tip -brief addr\n'
    '\tline\n'
    '\tblue "SSH Service:" | bubble\n'
    '\tsystemctl is-active ssh || sytemctl status ssh | head -n 10\n'
    '} | bubble\n'
)

if not os.path.exists(system_cheatpath):
    with open(system_cheatpath, "w") as f:
        f.write(system_cheatcontent)

permissions_cheatpath = os.path.join(permissions_dir, "cheatsheet.md")
permissions_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    'bubble() {\n'
    '    gum style --border rounded\n'
    '}\n\n'
    'blue() {\n'
    '    gum style --foreground 39 "$@"\n'
    '}\n\n'
    'line() {\n'
    '    printf \'%*s\' 50 \'\' | tr \' \' \'-\'\n'
    '    echo\n'
    '}\n\n'
    'sudo useradd -m tempuser01 2> /dev/null\n'
    'sudo groupadd -f tempgroup 2> /dev/null\n'
    'sudo usermod -aG tempgroup tempuser01 2> /dev/null\n\n'
    'figlet Permissions\n'
    'line\n\n'
    '{\n'
    '    blue "Create File1 File2"\n'
    '    line\n'
    '    rm -f file1 file2\n'
    '    touch file1 file2\n'
    '    echo\n'
    '    blue "before"\n'
    '    ls -l | bubble\n'
    '    line\n'
    '    chmod 600 file1\n'
    '    chmod 754 file2\n'
    '    sudo chown root:root file1\n'
    '    sudo chown "$USER":"$USER" file2\n'
    '    echo\n'
    '    blue "after"\n'
    '    ls -l | bubble\n'
    '    echo\n'
    '    blue "File Permissions"\n'
    '    echo "file1 should be rw-------" | bubble\n'
    '    echo "file2 should be rwxr-xr--" | bubble\n'
    '} | bubble\n'
)

if not os.path.exists(permissions_cheatpath):
    with open(permissions_cheatpath, "w") as f:
        f.write(permissions_cheatcontent)

usergroup_path = os.path.join(usergroup_dir, "cheatsheet.md")
usergroup_content = (
    '#!/usr/bin/env bash\n\n'
    'bubble() {\n'
    '    gum style --border rounded\n'
    '}\n\n'
    'blue() {\n'
    '\tgum style --foreground 39 "$@"\n'
    '}\n\n'
    'line() {\n'
    '\tprintf \'%*s\' 50 \'\' | tr \' \' \'-\'\n'
    '\techo\n'
    '}\n\n'
    'sudo useradd -m tempuser01 2> /dev/null\n'
    'sudo groupadd -f tempgroup 2> /dev/null\n'
    'sudo usermod -aG tempgroup tempuser01 2> /dev/null\n\n'
    'figlet Usergroup\n'
    'line\n'
    '{\n'
    '\tblue "tempuser01 created:"\n'
    '\tgrep tempuser01 /etc/passwd | bubble\n'
    '\tblue "groups"\n'
    '\tid tempuser01 | bubble\n'
    '\techo\n'
    '\tline\n'
    '\tblue  "passwd entry:"\n'
    '\tgrep tempuser01 /etc/passwd | bubble\n'
    '\tblue "shadow entry(hashed):"\n'
    '\tsudo grep tempuser01 /etc/shadow | bubble\n'
    '\techo\n'
    '\tline\n'
    '\tblue "removing tempuser01"\n'
    '\tsudo userdel -r tempuser01 2> /dev/null\n'
    '\tif grep tempuser01 /etc/passwd; then\n'
    '\t\techo "He\'s still here gang" | bubble\n'
    '\telse\n'
    '\t\techo "Tempuser01 Deleted" | bubble\n'
    '\tfi\n'
    '} | bubble\n'
)

if not os.path.exists(usergroup_path):
    with open(usergroup_path, "w") as f:
        f.write(usergroup_content)

systemd_cheatpath = os.path.join(systemd_dir, "cheatsheet.md")
systemd_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    'bubble() {\n'
    '\tgum style --border rounded\n'
    '}\n\n'
    'blue() {\n'
    '\tgum style --foreground 39 "$@"\n'
    '}\n\n'
    'line() {\n'
    '\tprintf \'%*s\' 50 \'\' | tr \' \' \'-\'\n'
    '\techo\n'
    '}\n\n'
    'figlet Systemd\n'
    'line\n\n'
    '{\n'
    '\tSERVICE=cups\n\n'
    '\tblue "$SERVICE Status"\n'
    '\tsystemctl status "$SERVICE" -n 10 --no-pager | bubble\n'
    '\tline\n'
    '\tblue "Restarting"\n'
    '\tsudo systemctl restart "$SERVICE" | bubble\n'
    '\tline\n'
    '\tblue "Enable at Boot" | bubble\n'
    '\tline\n'
    '\tblue "Last 10 Log Lines"\n'
    '\tsudo systemctl enable "$SERVICE" | bubble\n'
    '\tline\n'
    '\tblue "Disable"\n'
    '\tsudo systemctl disable "$SERVICE" | bubble\n'
    '\tline\n'
    '\tblue "Stop"\n'
    '\tsudo systemctl stop "$SERVICE" | bubble\n'
    '\tline\n'
    '\tblue "Final Status:"\n'
    '\tsystemctl status "$SERVICE" -n 10 --no-pager | bubble\n'
    '} | bubble\n'
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
    'figlet "awk practice"\n'
    'echo\n\n'
    '{\n'
    '  gum style --foreground 39 "Print 1st Feild"\n'
    "  awk '{print $1}' boogers.md\n"
    '  echo\n'
    '  gum style --foreground 39 "Match a Pattern"\n'
    "  awk '/no/' boogers.md\n"
    '  echo\n'
    '  gum style --foreground 39 "Print Line Numbers"\n'
    "  awk '{print NR, $0}' boogers.md\n"
    '  echo\n'
    '  gum style --foreground 39 "Print Specific Line"\n'
    "  awk 'NR == 2 {print $0}' boogers.md\n"
    '  echo\n'
    '  gum style --foreground 39 "Count Fields"\n'
    "  awk '{print NF}' boogers.md\n"
    '  echo\n'
    '  gum style --foreground 39 "Print Last Field"\n'
    "  awk '{print $NF}' boogers.md\n"
    '  echo\n'
    '  gum style --foreground 39 "Custom Field Separator"\n'
    "  awk -F: '{print $1, $3, $7}' /etc/passwd\n"
    '  echo\n'
    '  gum style --foreground 39 "Count Total Lines"\n'
    '  awk \'END {print "Total Lines:", NR}\' boogers.md\n'
    '} | gum style \\\n'
    '        --border rounded \\\n'
    '        --padding "1 2" \\\n'
    '        --margin "1"\n'
)

if not os.path.exists (awk_cheatpath):
	with open(awk_cheatpath, "w") as f:
		f.write(awk_cheatcontent)
		
cut_cheatpath = os.path.join(cut_dir, "cheatsheet.md")
cut_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    'line () {\n'
    '\tprintf \'%*s\' 50 \'\' | tee \' \' \'-\'\n'
    '\techo\n'
    '}\n\n'
    'bubble () {\n'
    '\tgum style --border rounded\n'
    '}\n\n'
    'blue () {\n'
    '\tgum style --foreground 39 "$@"\n'
    '}\n\n'
    'figlet Cut\n'
    'line\n'
    '{\n'
    '\tblue "print first field" | bubble\n'
    '\tcut -d" " -f1 boogers.md\n'
    '\tline\n'
    '\tblue "print multiple fields" | bubble\n'
    '\tcut -d" " -f1,3 boogers.md\n'
    '\tline\n'
    '\tblue "Print Character Range" | bubble\n'
    '\tcut -c1-5 boogers.md\n'
    '\tline\n'
    '\tblue "Extract Username and Shell" | bubble\n'
    '\tcut -d: -f1,7 /etc/passwd\n'
    '} | bubble\n'
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
    'line () {\n'
    '\tprintf \'%*s\' 50 \'\' | tr \' \' \'-\'\n'
    '\techo\n'
    '}\n\n'
    'bubble () {\n'
    '\tgum style --border rounded\n'
    '}\n\n'
    'blue () {\n'
    '\tgum style --foreground 39 "$@"\n'
    '}\n\n'
    'figlet File\n'
    'line\n'
    '{\n'
    '\techo "boogers" >> boogers.md\n'
    '\tblue "Identify File Type" | bubble\n'
    '\tfile boogers.md\n'
    '\tline\n'
    '\tblue "Inspect Executable Type" | bubble\n'
    '\tfile /bin/bash\n'
    '\tline\n'
    '\tblue "Inspect File Type" | bubble\n'
    '\tfile /etc/passwd\n'
    '} | bubble\n'
)

if not os.path.exists(file_cheatpath):
	with open(file_cheatpath, "w") as f:
		f.write(file_cheatcontent)
		
find_cheatpath = os.path.join(find_dir, "cheatsheet.md")
find_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    'blue () {\n'
    '\tgum style --foreground 39 "$@"\n'
    '}\n\n'
    'line () {\n'
    '\tprintf \'%*s\' 50 \'\' | tr \' \' \'-\'\n'
    '\techo\n'
    '}\n\n'
    'bubble () {\n'
    '\tgum style --border rounded\n'
    '}\n\n'
    'figlet Find\n'
    'line\n'
    '{\n'
    '\tblue "Find Markdown Files" | bubble\n'
    '\tfind . -name "*.md"\n'
    '\tline\n'
    '\tblue "Find All Files" | bubble\n'
    '\tfind . -type f\n'
    '\tline\n'
    '\tblue "Find All Directories" | bubble\n'
    '\tfind . -type d\n'
    '\tline\n'
    '\tblue "Find Files larger Than 1 MB" | bubble\n'
    '\tfind . -type f -size +1M\n'
    '\tline\n'
    '\tblue "Find Files Modified in the Last 7 Days" | bubble\n'
    '\tfind . -type f -mtime -7\n'
    '} | bubble\n'
)

if not os.path.exists(find_cheatpath):
	with open(find_cheatpath, "w") as f:
		f.write(find_cheatcontent)
		
grep_cheatpath = os.path.join(grep_dir, "cheatsheet.md")
grep_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    'line() {\n'
    '\tprintf \'%*s\' 50 \'\' | tr \' \' \'-\'\n'
    '\techo\n'
    '}\n\n'
    'bubble () {\n'
    '\tgum style --border rounded\n'
    '}\n\n'
    'blue () {\n'
    '\tgum style --foreground 39 "$@"\n'
    '}\n\n'
    'figlet Grep\n'
    'line\n'
    '{\n'
    '\tblue "Case-Insensitive Search" | bubble\n'
    '\tgrep -i "BOOGERS" boogers.md\n'
    '\tline\n'
    '\tblue "Exclude Matching Lines" | bubble\n'
    '\tgrep -v "boogers" boogers.md\n'
    '\tline\n'
    '\tblue "Show Matching Line Numbers" | bubble\n'
    '\tgrep -n "shit" boogers.md\n'
    '\tline\n'
    '\tblue "Count Matching Lines" | bubble\n'
    '\tgrep -c "boogers" boogers.md\n'
    '\tline\n'
    '\tblue "Search Multiple Patterns" | bubble\n'
    '\tgrep -E "boogers|sherlock" boogers.md\n'
    '} | bubble\n'
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
    'blue () {\n'
    '\tgum style --foreground 39 "$@"\n'
    '}\n\n'
    'line() {\n'
    '\tprintf \'%*s\' 50 \'\' | tr \' \' \'-\'\n'
    '\techo\n'
    '}\n\n'
    'bubble () {\n'
    '\tgum style --border rounded\n'
    '}\n\n'
    'figlet Sed\n'
    'line\n'
    '{\n'
    '\tblue "Print First Line" | bubble\n'
    '\tsed -n "1p" boogers.md\n'
    '\tline\n'
    '\tblue "Print First Two Lines" | bubble\n'
    '\tsed -n "1,2p" boogers.md\n'
    '\tline\n'
    '\tblue "Replace Text" | bubble\n'
    '\tsed "s/boogers/shit/" boogers.md\n'
    '\tline\n'
    '\tblue "Delete Matching Line" | bubble\n'
    '\tsed "/sherlock/d" boogers.md\n'
    '} | bubble\n'
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
    'line () {\n'
    '\tprintf \'%*s\' 50 \'\' | tr \' \' \'-\'\n'
    '\techo\n'
    '}\n\n'
    'blue () {\n'
    '\tgum style --foreground 39 "$@"\n'
    '}\n\n'
    'bubble () {\n'
    '\tgum style --border rounded\n'
    '}\n\n'
    'figlet Sort\n'
    'line\n'
    '{\n'
    '\tblue "Sort Alphabetically" | bubble\n'
    '\tsort boogers.md\n'
    '\tline\n'
    '\tblue "Sort in Reverse Order" | bubble\n'
    '\tsort -r boogers.md\n'
    '\tline\n'
    '\tblue "Sort Numerically by Second Field" | bubble\n'
    '\tsort -k2 -n boogers.md\n'
    '\tline\n'
    '\tblue "Sort Numerically by Second Field (Descending)" | bubble\n'
    '\tsort -k2 -nr boogers.md\n'
    '} | bubble\n'
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
    'line () {\n'
    '\tprintf \'%*s\' 50 \'\' | tr \' \' \'-d\'\n'
    '\techo\n'
    '}\n\n'
    'blue () {\n'
    '\tgum style --foreground 39 "$@"\n'
    '}\n\n'
    'bubble () {\n'
    '\tgum style --border rounded\n'
    '}\n\n'
    'figlet TR\n'
    'line\n'
    '{\n'
    '\tblue "Convert Lowercase to Uppercase" | bubble\n'
    '\techo "boogers are cool" | tr "a-z" "A-Z"\n'
    '\tline\n'
    '\tblue "Delete Numbers" | bubble\n'
    '\techo "boogers123" | tr -d "0-9"\n'
    '} | bubble\n'
)

if not os.path.exists(tr_cheatpath):
		with open(tr_cheatpath, "w") as f:
			f.write(tr_cheatcontent)
			
uniq_cheatpath = os.path.join(uniq_dir, "cheatsheet.md")
uniq_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    'line () {\n'
    '\tprintf \'%*s\' 50 \'\' | tr \' \' \'-\'\n'
    '\techo\n'
    '}\n\n'
    'blue () {\n'
    '\tgum style --foreground 39 "$@"\n'
    '}\n\n'
    'bubble () {\n'
    '\tgum style --border rounded\n'
    '}\n\n'
    'figlet Uniq\n'
    'line\n'
    '{\n'
    '\tblue "Boogers.md" | bubble\n'
    '\tcat boogers.md\n'
    '\tline\n'
    '\tblue "Remove Adjacent Duplicate Lines" | bubble\n'
    '\tuniq boogers.md\n'
    '\tline\n'
    '\tblue "Count Duplicate Occurences" | bubble\n'
    '\tuniq -c boogers.md\n'
    '\tline\n'
    '\tblue "Show Only Duplicate Lines" | bubble\n'
    '\tuniq -d boogers.md\n'
    '\tline\n'
    '\tblue "Show Only Unique Lines" | bubble\n'
    '\tuniq -u boogers.md\n'
    '} | bubble\n'
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
    'line () {\n'
    '\tprintf \'%*s\' 50 \'\' | tr \' \' \'-\'\n'
    '\techo\n'
    '}\n\n'
    'blue () {\n'
    '\tgum style --foreground 39 "$@"\n'
    '}\n\n'
    'bubble () {\n'
    '\tgum style --border rounded\n'
    '}\n\n'
    'figlet WC\n'
    'line\n'
    '{\n'
    '\tblue "boogers.md" | bubble\n'
    '\tcat boogers.md\n'
    '\tline\n'
    '\tblue "Show Line, Word, and Byte Counts" | bubble\n'
    '\twc boogers.md\n'
    '\tline\n'
    '\tblue "Count Lines" | bubble\n'
    '\twc -l boogers.md\n'
    '\tline\n'
    '\tblue "Count Words" | bubble\n'
    '\twc -w boogers.md\n'
    '\tline\n'
    '\tblue "Count Bytes" | bubble\n'
    '\twc -c boogers.md\n'
    '} | bubble\n'
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
