#!/bin/bash


# - REALIZZARE UNO SCRIPT CHE AGGIUNGE UN UTENTE AL SISTEMA


if [ (id -i) -eq 0 ] ; then                        # -> Controlliamo se il codice sta venendo eseguito con SUDO
    read -p “Inserisci username: “ username        # -> leggiamo il nome utente
    read -s -p “Inserisci password: “ password     # -> leggiamo la password ( "-s" permete di "nascondere" i caratteri digitati)
    grep -q $username /etc/passwd                  # -> controlliamo se il l'utente esiste o meno

    if [ $? -eq 1 ]; then                                                # -> se l'utente non esiste, aggiungerlo
        useradd -m “$username” -p “$password”
        [ $? -eq 0 ] && echo -e “\nutente aggiunto” || echo -e “n\No”
    else
        echo -e “\nUsername $username già presente!”
        exit 1
    fi
else
    echo “Attenzione! Solo root può aggiungere un utente al sistema”
    exit 2
fi
