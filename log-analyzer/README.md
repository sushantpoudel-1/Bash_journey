# Bash Log Analyzer

## Purpose
 this project is used to analyze the error and warnings  in the log file

## Features
it can analyze what are the error and  warnings in the log 
most common error and warnings in the log 
it contains timestamp to show when did the error or warning occured

## Requirements
you need a log file which is in the format of 


## How to Run
 by using bash log_analyzer.sh <logfile> 

## Commands Used
awk,grep,file exist or not (-z), is regurlar file(-f), command line arguments, sort, uniq

## Example Output
bash log_analyzer.sh serverlog
 the file exists
 total error in the logs:3
 the total warning in the log:2
 error  message in the  file is:
 2026-10-02 10:02:20 ERROR Database connection failed
2026-10-02 10:05:30 ERROR Database connection failed
2026-10-02 10:08:15 ERROR Server connection failed
 the warning in the log is
 2026-10-02 10:03:10 WARNING High memory usage
2026-10-02 10:07:50 WARNING Disk space is low

 the timestamps for  error is
 the timestamps is :
  2026-10-02 10:02:20
2026-10-02 10:05:30
2026-10-02 10:08:15

 the common error and warnings is :
      2 Database connection failed
      1 Server connection failed
