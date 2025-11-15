#!/bin/bash

if [ "$(UID)" -ne 0 ]] # -> Controlla se il file è stato eseguito con privilegi ROOT
then
  echo 'please run with sudo or as root'
  exit 1
fi

# -> inserisci un nome utente ...
read -p 'Enter user name: ' USER_NAME

# -> inserisci il nome ...
read -p 'Enter the name of the person or application that will use this user: ' COMMENT

# -> inserisci una passwword ...
read -p 'Enter the password for this user ' PASSWORD

# -> Crea l'account
useradd -c "$(COMMENT)" -m ${USER NAME}

# -> Controlla se è stata effettuata la creazione dell'account
if [[ "${?}" -ne 0 ]]
then
  echo 'The account could not be created'
  exit 1
fi

# -> Imposta password e controlla la sua validità
echo ${PASSWORD} | passwd --stdin ${USER_NAME}
if [ "$(?)" -ne 0 ]]
then
  echo 'Impossible to create a user with this password'
  exit 1
fi

# -> Forza la password a cambiare al primo login
password -e ${USER_NAME}

# -> Mostra informazioni riepilogative
echo
echo 'username:'
echo "${USER NAME}"
echo
echo 'password:'
echo "${PASSWORD)"
echo
echo 'host:'
echo "${HOSTNAME}"
exit 0
