#!/bin/bash

while true
do
echo Menu gestion des utilisateurs
echo "1- Créer un utilisateur"
echo "2- Supprimer un utilisateur"
echo "3- Quitter"
echo "----------------------------"
echo "Choisissez une option :"
read rep
if [ "$rep" == "1" ]
then
    read -p "Entrez votre nom d'utilisateur : " username
    if id "$username" &>/dev/null; then
        echo "Cette utilisateur : '$username' exite déjà veuillez en choisir un autre"
        echo " "
    else
        sudo useradd "$username"
        echo "Entrez votre mot de passe:"
        sudo passwd "$username"
        echo " "
    fi
elif [ "$rep" == "2" ]
then
    read -p "Entrez l'utilisateur a supprimer: " username
    sudo userdel -r "$username"
    echo "User $username a été supprimé."
    echo " "
elif [ "$rep" == "3" ] 
then
    echo Ciao !
    exit
else
    echo "Vous ne pouvez taper que 1, 2 ou 3 Veuillez saisir à nouveau"
    echo " "
fi
done

