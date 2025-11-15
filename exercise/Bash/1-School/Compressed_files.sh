#!/bin/bash

read -p "Inserisci cartella da comprimere: /" inputdir

file=/tmp/${user}_home_$(date +%Y-%m-%d-%H%m%S).tar.gz
tar -czf $file $inputdir
echo "Backup di ${inputdir} completato. Dettagli sul file di backup creato:"
ls -l $file
