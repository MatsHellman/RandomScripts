#!/bin/bash
# 
# Script: FantsyGroundsUnity_backup.sh
#
# Comment: Used to backup my Fantasy Grounds Unity
# to my OneDrive folder on my Linux machine.
#

# Source and destination folders
FGU_FOLDER=~/.smiteworks
BACKUP_DEST=~/OneDrive/backup/FantasyGrounds/

# Color settings
RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'

echo -e "${GREEN}"
echo "========================================="
echo "========= Starting FGU backup ==========="
echo "========================================="
echo -e "${NC}"

# Check if destination exists
if [ ! -d "${BACKUP_DEST}" ]
then
  echo -e "${RED}"
  echo "Backup destination did not exist."
  echo "Creating destination"
  echo -e "${NC}"
  mkdir -p "${BACKUP_DEST}"
fi

# Running backup
# Before running backup verify the destination exists, else stop
#
if [ -d "${BACKUP_DEST}" ]
then
  echo -e "${GREEN}"
  echo "============================================="
  echo "==== Destination exists; starting backup ===="
  echo "============================================="
  tar -jcpf ${BACKUP_DEST}fgu_backup.tar.bz2 ${FGU_FOLDER}
else
  echo -e "${RED}"
  echo "======== Destination does not exist ========"
  echo "======== and the script was unable  ========"
  echo "======== to create it. Exiting!!!   ========"
  echo -e "${NC}"
fi
