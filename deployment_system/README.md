Project Overview: What does the deployment script automate?
It creates a timestamped backup of the existing application before deployment, copies the new application files
 verifies that the expected application file exists after deployment
If deployment verification fails, the script attempts to restore the previous version from the backup
 It also records deployment results in a log file and removes older backups to keep only the five newest archives




Features: Backup, deployment, verification, rollback, logging, and backup retention.



How to Run: bash deploy.sh app_source  live_app



What I Learned:


Limitations: What still needs improvement before using it on a real server.
Improve rollback so it handles copy failures as well as verification failures.

Verify backup integrity before restoring it.

Handle hidden files and partially deployed files safely.

Improve error handling for failed backup, copy, and restore operations.

Validate that backup retention selects only the intended archive files.

Add safer deployment techniques, such as deploying to a separate directory before switching versions.

Add automated application health checks.
