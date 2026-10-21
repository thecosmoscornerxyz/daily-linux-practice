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
bash_dir = os.path.join(day_dir, "bash")
curl_dir = os.path.join(day_dir, "curl")
cut_dir = os.path.join(day_dir, "cut")
file_dir = os.path.join(day_dir, "file")
find_dir = os.path.join(day_dir, "find")
diff_dir = os.path.join(day_dir, "diff")
grep_dir = os.path.join(day_dir, "grep")
jq_dir = os.path.join(day_dir, "jq")
sed_dir = os.path.join(day_dir, "sed")
sort_dir = os.path.join(day_dir, "sort")
tr_dir = os.path.join(day_dir, "tr")
uniq_dir = os.path.join(day_dir, "uniq")
wc_dir = os.path.join(day_dir, "wc")
tar_dir = os.path.join(day_dir, "tar")
xargs_dir = os.path.join(day_dir, "xargs")
rsync_dir = os.path.join(day_dir, "rsync")
read_dir = os.path.join(day_dir, "read")
cron_dir = os.path.join(day_dir, "cron")
hash_dir = os.path.join(day_dir, "hash")
gpg_dir = os.path.join(day_dir, "gpg")
sqlite_dir = os.path.join(day_dir, "sqlite")

for path in [day_dir, system_dir, permissions_dir, usergroup_dir, systemd_dir, process_dir, network_dir, awk_dir, bash_dir, curl_dir, cut_dir, cron_dir, file_dir, find_dir, gpg_dir, diff_dir, grep_dir, jq_dir, hash_dir, sed_dir, sort_dir, sqlite_dir, tar_dir, tr_dir, uniq_dir, wc_dir, rsync_dir, read_dir, xargs_dir]:
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
    'system_info () {\n'
    '\techo "User: $(whoami)"\n'
    '\tline\n'
    '\techo "Uptime: $(uptime -p)"\n'
    '\tline\n'
    '\techo "Hostname: $(hostname)"\n'
    '\tline\n'
    '\techo "Today is: $(date)"\n'
    '}\n\n'
    'disk_usage () {\n'
    '\tdf -h /\n'
    '}\n\n'
    'ip_address () {\n'
    '\tip -brief addr\n'
    '}\n\n'
    'ssh_service () {\n'
    '\tsystemctl is-active ssh || systemctl status ssh | head -n 10\n'
    '}\n\n'
    'while true; do\n\n'
    '\tfiglet "System"\n'
    '\tline\n\n'
    '\tblue "Choose what you want to inspect:"\n'
    '\techo "1) System Info"\n'
    '\techo "2) Disk Usage"\n'
    '\techo "3) IP Address"\n'
    '\techo "4) SSH Service"\n'
    '\techo "5) Run Everything"\n'
    '\techo "q) Quit"\n\n'
    '\tread -rp "> "\n\n'
    '\tcase "$REPLY" in\n\n'
    '\t\t1)\n'
    '\t\t\tblue "Linux Warmup"\n'
    '\t\t\tsystem_info | bubble\n'
    '\t\t\t;;\n\n'
    '\t\t2)\n'
    '\t\t\tblue "Disk Usage"\n'
    '\t\t\tdisk_usage | bubble\n'
    '\t\t\t;;\n\n'
    '\t\t3)\n'
    '\t\t\tblue "IP Address"\n'
    '\t\t\tip_address | bubble\n'
    '\t\t\t;;\n\n'
    '\t\t4)\n'
    '\t\t\tblue "SSH Service"\n'
    '\t\t\tssh_service | bubble\n'
    '\t\t\t;;\n\n'
    '\t\t5)\n'
    '\t\t\tblue "Linux Warmup"\n'
    '\t\t\tsystem_info | bubble\n'
    '\t\t\tline\n\n'
    '\t\t\tblue "Disk Usage"\n'
    '\t\t\tdisk_usage | bubble\n'
    '\t\t\tline\n\n'
    '\t\t\tblue "IP Address"\n'
    '\t\t\tip_address | bubble\n'
    '\t\t\tline\n\n'
    '\t\t\tblue "SSH Service"\n'
    '\t\t\tssh_service | bubble\n'
    '\t\t\t;;\n\n'
    '\t\tq|Q)\n'
    '\t\t\techo "Later nerd 🤓"\n'
    '\t\t\tbreak\n'
    '\t\t\t;;\n\n'
    '\t\t*)\n'
    '\t\t\techo "Invalid option."\n'
    '\t\t\t;;\n\n'
    '\tesac\n\n'
    '\techo\n'
    '\tread -rp "Press Enter to continue..."\n\n'
    'done\n'
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
        
xargs_cheatpath = os.path.join(xargs_dir, "cheatsheet.md")
xargs_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    'echo "file1 file2 file3" | xargs touch\n'
)

if not os.path.exists(xargs_cheatpath):
    with open(xargs_cheatpath, "w") as f:
        f.write(xargs_cheatcontent)

rsync_cheatpath = os.path.join(rsync_dir, "cheatsheet.md")
rsync_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    '# Sync contents of dir1 into dir2\n'
    'rsync -av dir1/ dir2/\n'
)

rsync_dir1 = os.path.join(rsync_dir, "dir1")
rsync_dir2 = os.path.join(rsync_dir, "dir2")

os.makedirs(rsync_dir1, exist_ok=True)
os.makedirs(rsync_dir2, exist_ok=True)

rsync_testfile = os.path.join(rsync_dir1, "boogers.md")

if not os.path.exists(rsync_testfile):
    with open(rsync_testfile, "w") as f:
        f.write("boogers\n")

if not os.path.exists(rsync_cheatpath):
    with open(rsync_cheatpath, "w") as f:
        f.write(rsync_cheatcontent)

tar_cheatpath = os.path.join(tar_dir, "cheatsheet.md")
tar_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    '# Create archive\n'
    'tar -czf backup.tar.gz testdir/\n\n'
    '# Inspect archive without extracting\n'
    'tar -tzf backup.tar.gz\n\n'
    '# Extract archive\n'
    'tar -xzf backup.tar.gz\n'
)

if not os.path.exists(tar_cheatpath):
    with open(tar_cheatpath, "w") as f:
        f.write(tar_cheatcontent)
        
cron_cheatpath = os.path.join(cron_dir, "cheatsheet.md")
cron_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    '# View your cron jobs\n'
    'crontab -l\n\n'
    '# Edit your cron jobs\n'
    'crontab -e\n\n'
    '# Add boogers.sh to run every day at 3:30 AM\n'
    '30 3 * * * /home/cosmos/boogers.sh\n\n'
    '# Edit cron again and remove boogers.sh\n'
    'crontab -e\n'
)

if not os.path.exists(cron_cheatpath):
    with open(cron_cheatpath, "w") as f:
        f.write(cron_cheatcontent)

hash_cheatpath = os.path.join(hash_dir, "cheatsheet.md")
hash_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    '# Generate SHA-256 hash\n'
    'sha256sum boogers.md\n'
)

hash_boogers_path = os.path.join(hash_dir, "boogers.md")
hash_boogers_content = (
    'boogers\n'
)

if not os.path.exists(hash_cheatpath):
    with open(hash_cheatpath, "w") as f:
        f.write(hash_cheatcontent)

if not os.path.exists(hash_boogers_path):
    with open(hash_boogers_path, "w") as f:
        f.write(hash_boogers_content)        

diff_cheatpath = os.path.join(diff_dir, "cheatsheet.md")
diff_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    'diff -u file1.txt file2.txt\n'
)

diff_file1_path = os.path.join(diff_dir, "file1.txt")
diff_file1_content = (
    'hello\n'
)

diff_file2_path = os.path.join(diff_dir, "file2.txt")
diff_file2_content = (
    'hello world\n'
)

if not os.path.exists(diff_cheatpath):
    with open(diff_cheatpath, "w") as f:
        f.write(diff_cheatcontent)

if not os.path.exists(diff_file1_path):
    with open(diff_file1_path, "w") as f:
        f.write(diff_file1_content)

if not os.path.exists(diff_file2_path):
    with open(diff_file2_path, "w") as f:
        f.write(diff_file2_content)

read_cheatpath = os.path.join(read_dir, "cheatsheet.md")
read_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    'read -rp "What package do you want to install? " package\n\n'
    'echo "You chose: $package"\n'
)

if not os.path.exists(read_cheatpath):
    with open(read_cheatpath, "w") as f:
        f.write(read_cheatcontent)

gpg_cheatpath = os.path.join(gpg_dir, "cheatsheet.md")
gpg_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    '# Encrypt file\n'
    'gpg -c secret.txt\n\n'
    '# Decrypt file\n'
    'gpg -o decrypted.txt -d secret.txt.gpg\n'
)

gpg_secret_path = os.path.join(gpg_dir, "secret.txt")
gpg_secret_content = (
    'boogers are classified\n'
)

if not os.path.exists(gpg_cheatpath):
    with open(gpg_cheatpath, "w") as f:
        f.write(gpg_cheatcontent)

if not os.path.exists(gpg_secret_path):
    with open(gpg_secret_path, "w") as f:
        f.write(gpg_secret_content)

sqlite_cheatpath = os.path.join(sqlite_dir, "cheatsheet.md")
sqlite_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    '# Open/Create Database\n'
    'sqlite3 practice.db\n\n'
    '# Create Table\n'
    'CREATE TABLE notes (\n'
    '    id INTEGER PRIMARY KEY,\n'
    '    note TEXT\n'
    ');\n\n'
    '# Insert\n'
    'INSERT INTO notes (note)\n'
    'VALUES ("boogers");\n\n'
    '# Read\n'
    'SELECT * FROM notes;\n\n'
    '# Update\n'
    'UPDATE notes\n'
    'SET note = "classified boogers"\n'
    'WHERE id = 1;\n\n'
    '# Delete\n'
    'DELETE FROM notes\n'
    'WHERE id = 1;\n\n'
    '.quit\n'
)

if not os.path.exists(sqlite_cheatpath):
    with open(sqlite_cheatpath, "w") as f:
        f.write(sqlite_cheatcontent)
        
bash_cheatpath = os.path.join(
    bash_dir,
    "cheatsheet.md"
)

bash_cheatcontent = (
    '#!/usr/bin/env bash\n\n'

    '# For Loop\n'
    'for item in apple banana cherry; do\n'
    '    echo "$item"\n'
    'done\n\n'

    '# C-Style For Loop\n'
    'for ((i=1; i<=5; i++)); do\n'
    '    echo "$i"\n'
    'done\n\n'

    '# While Loop\n'
    'count=1\n'
    'while [[ $count -le 5 ]]; do\n'
    '    echo "$count"\n'
    '    ((count++))\n'
    'done\n\n'

    '# Until Loop\n'
    'count=1\n'
    'until [[ $count -gt 5 ]]; do\n'
    '    echo "$count"\n'
    '    ((count++))\n'
    'done\n'
)

bash_path = os.path.join(
    bash_dir,
    "names.txt"
)

bash_content = (
    'cosmos\n'
    'friday\n'
    'waffles\n'
)

if not os.path.exists(bash_cheatpath):
    with open(bash_cheatpath, "w") as f:
        f.write(bash_cheatcontent)

if not os.path.exists(bash_path):
    with open(bash_path, "w") as f:
        f.write(bash_content)

curl_cheatpath = os.path.join(curl_dir, "cheatsheet.md")

curl_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    '# Basic GET Request\n'
    'curl https://httpbin.org/get\n\n'
    '# Show Response Headers\n'
    'curl -I https://example.com\n\n'
    '# Follow Redirects\n'
    'curl -L https://example.com\n\n'
    '# Save Response to File\n'
    'curl -o response.json https://httpbin.org/get\n\n'
    '# Silent Request\n'
    'curl -s https://httpbin.org/get\n'
)

if not os.path.exists(curl_cheatpath):
    with open(curl_cheatpath, "w") as f:
        f.write(curl_cheatcontent)

jq_cheatpath = os.path.join(jq_dir, "cheatsheet.md")
jq_jsonpath = os.path.join(jq_dir, "servers.json")

jq_cheatcontent = (
    '#!/usr/bin/env bash\n\n'
    '# Pretty Print JSON\n'
    'jq "." servers.json\n\n'
    '# Read One Field\n'
    'jq ".hostname" servers.json\n\n'
    '# Read Nested Field\n'
    'jq ".system.os" servers.json\n\n'
    '# Read Array\n'
    'jq ".services[]" servers.json\n\n'
    '# Read Array Element\n'
    'jq ".services[0]" servers.json\n\n'
    '# Raw Output (Remove JSON Quotes)\n'
    'jq -r ".hostname" servers.json\n'
)

jq_jsoncontent = (
    '{\n'
    '  "hostname": "syrup",\n'
    '  "system": {\n'
    '    "os": "Debian",\n'
    '    "status": "online"\n'
    '  },\n'
    '  "services": [\n'
    '    "jellyfin",\n'
    '    "immich",\n'
    '    "traefik"\n'
    '  ]\n'
    '}\n'
)

if not os.path.exists(jq_cheatpath):
    with open(jq_cheatpath, "w") as f:
        f.write(jq_cheatcontent)

if not os.path.exists(jq_jsonpath):
    with open(jq_jsonpath, "w") as f:
        f.write(jq_jsoncontent)

print(f"Created daily folder structure for {today.strftime('%Y-%m%d')}")

signal_link("daily_linux.py", "dailybox-prod-LXC")
