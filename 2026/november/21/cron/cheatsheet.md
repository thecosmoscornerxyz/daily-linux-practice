#!/usr/bin/env bash

# View your cron jobs
crontab -l

# Edit your cron jobs
crontab -e

# Add boogers.sh to run every day at 3:30 AM
30 3 * * * /home/cosmos/boogers.sh

# Edit cron again and remove boogers.sh
crontab -e
