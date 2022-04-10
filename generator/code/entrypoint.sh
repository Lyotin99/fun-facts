#!/bin/bash

touch /tmp/generator.log

# Start the run once job.
echo "Docker container has been started"

# Setup a cron schedule
echo "SHELL=/bin/bash
* * * * * /app/random-fun-fact.sh &>> /tmp/generator.log
# This extra line makes it a valid cron" > scheduler.txt

tail -f /tmp/generator.log &

crontab scheduler.txt
cron -f
