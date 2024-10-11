#!/bin/bash

add_group() {

	read -p "Enter group name"
	sudo groupadd "$groupname"
	echo "Group $groupname added."

}

del_group(){
	read -p "Enter group name: " groupname
	sudo groupdel "$groupname"
	echo "Group $groupname deleted"

}

list_grps(){
	cut -d: -f1 /etc/group

}

add_user() {
	read -p "Enter group name: " groupname
	read -p "Enter user name: " username
	sudo useradd -G "$groupname" "$username"
	echo "user $username added to $groupname" 
}

del_user() {
	read -p "Enter username: " username
        sudo userdel "$username"
	echo "User $username deleted"       
}

list_users() {
	cut -d: -f1 /etc/passwd
}

while true; do
	echo "Choose an option:"
	echo "1. Add Group"
	echo "2. Delete Group"
	echo "3. List Group"
	echo "4. Add User"
	echo "5. Delete User"
	echo "6. List User"
	echo "7. Exit"
	read -p "Enter choice [1-7]:" choice

	case $choice in
		1) add_group ;;
		2) del_group ;;
		3) list_grps ;;
		4) add_user ;;
		5) del_user ;;
		6) list_users ;;
		7) exit 0 ;;
		*) echo "Invalid option"
	esac
done
