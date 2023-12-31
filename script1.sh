#!/bin/bash

# nazwa oraz sciezka
DB_NAME="exampledb"
BACKUP_DIR="/home/przemyslawk/backup/"

# utworzenie kopii 
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/$DB_NAME_$DATE.sql"

mysqldump $DB_NAME > $BACKUP_FILE

if [ $? -eq 0 ]; then
	echo "Backup od $DB_NAME completed successfully"
else
	echo "Error in creating Backup od $DB_NAME"
fi
