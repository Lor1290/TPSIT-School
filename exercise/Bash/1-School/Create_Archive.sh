#!/bin/bash

'
Realizzare uno script di shell per effettuare il backup della directory home di
un utente creando un archivio compresso con tutte le directory e i file. Il file
ottenuto dovrà essere memorizzato nella directory /tmp.
'

user=$(whoami)                                                # -> Rendi l'esecuzione del comando generica (la "home" sarà determinata dall'user corrente)
inputdir=/home/$user                                          # -> "Ricava" la directory home
file=/tmp/${user}_home_$(date +%Y-%m-%d-%H%m%S).tar.gz        # -> "Salva" il nome del file compresso

tar -czf $file $inputdir                                      # -> Comprimi il file

echo “Backup of ${inputdir} completed”
echo "Log File:"
ls -l $file
