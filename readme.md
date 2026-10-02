# Bash automated backup system

A simple bash automation project that automatically creates compressed backups of a folder using the $ tar command.

It is my first ever Bash automation project in my learning path of Linux and bash 
#What is this project about
It Takes a folder as a command-line argument
Makes sure that the folder exists
Creates a backups directory automatically
Creates .tar.gz compressed backups
Appends a timestamp to each backup
Makes sure if the backup was successful or not
Records it in backup.log
Only stores the last 5 backups
Deletes the old backups automatically
#Project structure
The project structure looks like this:
Bash_journey/
├── backup.sh
├── README.md
├── backup.log
├── first_project/
│  ├── file1.txt
│  ├── file2.txt
│  └── file3.txt
└── backups/
# commands used
Bash
Linux
tar
date
mkdir
ls
tail
xargs
rm
command-line arguments
conditional statements
exit status
file logging
#How to use
Clone the repo:
git clone https://github.com/sushantpoudel-1/Bash_journey.git
Go into the project directory:
cd Bash_journey
Make the file executable:
chmod +x backup.sh
Run the file:
./backup.sh first_project
or
bash backup.sh first_project
# Example backup
A backup would be look like this in the backups directory:
backups/project_backup_2026-10-02_23-30-15.tar.gz
Since it has a timestamp appended to it, all the backups are unique.
#Logs
The script logs all successful and unsuccessful backup attempts into the backup.log file.
An example log would be:
2026-10-02 23:30:15 - Backup of first_project completed successfully
#Removing old backups
Only the last 5 backups are kept in the backups directory, and the older ones are automatically deleted.
This way, the backups directory doesn't fill up with old backups.
#Concepts learned
I learned a lot of concepts while making this project such as:
Variables
command-line arguments
if conditions
directory checking
string checking
exit status
file redirection
logging
tar archives
compression
pipelines
ls
tail
xargs
rm

#mistakes :
## 🐜 Issues & Mistakes I Faced

### 1. Incorrect `tar` command

My attempt:

```bash

tar -xzvf docs.tar.gz -c backup_test

```

It caused an error due to combination of options `-x` and `-c`

What I have learned:

Option `-c` is used for creation, `-x` for extraction

---

### 2. Problem with `xargs` command in backup

At first, I faced some problems with configuring my `xargs` command due to path issues.

Later, I managed to simplify my command in the following way:

```bash

ls -t backups/.tar.gz | tail -n +6 | xargs rm

```

What I have learned:

Depending on how we pass the data to `xargs` our file paths will be interpreted

---

### 3. `tail -n +6` command misunderstanding

At first, I didn't know what `+6` was about.

However, then I found out that using:

```bash

tail -n +6

```

I'm telling the script to start deleting from the 6th backup

---

### 4. `backup.log` command misunderstanding

At first, I thought that I need to create `backup.log` myself

However, using the command:


echo "message" >> backup.log

I will create the file automatically if it doesn't exist in the system
