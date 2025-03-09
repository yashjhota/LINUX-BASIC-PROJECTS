#!/bin/bash

# Function to add a user
add_user() {
    read -p "Enter Username: " username
    read -s -p "Enter password: " password
    echo
    read -s -p "Confirm password: " password_confirm
    echo

    if [[ "$password" != "$password_confirm" ]]; then
        echo "Passwords do not match. User not added."
        return 1
    fi

    # Check if user already exists
    if id "$username" &>/dev/null; then
        echo "User $username already exists."
        return 1
    fi

    # Create the user
    sudo useradd -m "$username" &>/dev/null
    if [[ $? -ne 0 ]]; then
        echo "Failed to add user $username."
        return 1
    fi

    # Set the password
    echo "$username:$password" | sudo chpasswd
    if [[ $? -ne 0 ]]; then
        echo "Failed to set password for user $username."
        sudo userdel -r "$username" &>/dev/null
        return 1
    fi

    echo "User $username added successfully."
}

# Function to delete user
delete_user() {
    read -p "Enter username: " username

    # Check if user exists
    if ! id "$username" &>/dev/null; then
        echo "User $username does not exist."
        return 1
    fi

    sudo userdel -r "$username" &>/dev/null
    if [[ $? -ne 0 ]]; then
        echo "Failed to delete user $username."
        return 1
    fi

    echo "User $username deleted successfully."
}

# Function to list users
list_users() {
    echo "List of users:"
    # cut -d: -f1 /etc/passwd
    awk -F: '{print $1}' /etc/passwd
}

# Main menu
echo "User Management Script"
echo "1. Add User"
echo "2. Delete User"
echo "3. List Users"
read -p "Choose an option: " choice

case $choice in
    1) add_user ;;
    2) delete_user ;;
    3) list_users ;;
    *) echo "Invalid option" ;;
esac