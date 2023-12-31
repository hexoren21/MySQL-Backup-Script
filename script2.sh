#!/bin/bash

# name and path
DB_NAME="exampledb"
BACKUP_DIR="/home/przemyslawk/backup/"

# create backup 
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/$DB_NAME_$DATE.sql"

# SSH logging
SSH_USER="devops"
SSH_HOST="10.97.190.5"

# Address e-mail
EMAIL="kapel21@o2.pl"

ssh $SSH_USER@$SSH_HOST "mysqldump $DB_NAME" > $BACKUP_FILE

if [ $? -eq 0 ]; then
	echo "Backup from $DB_NAME completed successfully in $SSH_HOST"
else
	# sending e-mail 
	SUBJECT="Alert: problem with backup"
	MESSAGE="Error in creating Backup from $DB_NAME on machine $SSH_HOST"

	echo -e "Subject: $SUBJECT\n\n$MESSAGE" | msmtp $EMAIL
	echo "wyslano maila"
fi
