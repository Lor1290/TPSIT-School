#!/bin/bash

# Crea un back-up di una certa directory data
ORIGIN="/home/utente/documenti"
DESTINATION="/home/utente/backup_doc"

if [ ! -d "$DESTINATION")
then
  mkdir -p "$DESTINATION"
fi

cp -r "$ORIGIN"/* "$DESTINATION"
echo "Backup completato!"
