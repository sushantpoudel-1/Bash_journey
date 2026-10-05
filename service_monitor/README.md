# Service Monitor

A Bash script that checks a Linux service and restarts it if the service is not running.

## Features

* Check if service exists
* Check service status
* Restart service if it is down
* Save activity in a log file
* Add date and time to logs

## How to Run

bash
bash service_monitor.sh cron


or

bash service_monitor.sh nginx


## Log File

The script creates:

service_monitor.log

To view the log:

cat service_monito/r.log


## Commands Used

 systemctl
 grep
 date
if
 $?
 exit
 >>

## What I Learned
0
  to check Linux services
i learned different commands

## Project Structure


service_monitor/
├── service_monitor.sh
├── service_monitor.log
└── README.md

