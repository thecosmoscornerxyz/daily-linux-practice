import os
from datetime import datetime

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

for path in [day_dir, system_dir, permissions_dir, usergroup_dir, systemd_dir, process_dir, network_dir, awk_dir]:
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
	'awk "{print$1}" boogers.md\n'
	'awk "/no" boogers.md'
)

if not os.path.exists (awk_cheatpath):
	with open(awk_cheatpath, "w") as f:
		f.write(awk_cheatcontent)

print(f"Created daily folder structure for {today.strftime('%Y-%m%d')}")

# Don't Forget to chmod +x the ./system<number> script!
