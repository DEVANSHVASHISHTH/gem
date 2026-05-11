#!/bin/bash
# User and Group Management Script
# Note: Requires root privileges

function show_help {
    echo "Usage: $0 [OPTION] [ARGUMENTS]"
    echo "  -u, --add-user [USERNAME]          Add a new user"
    echo "  -ru, --remove-user [USERNAME]      Remove a user"
    echo "  -g, --add-group [GROUPNAME]        Add a new group"
    echo "  -ag, --add-to-group [USER] [GROUP] Add a user to a group"
    echo "  -h, --help                         Show this help"
}

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root to perform user/group management."
    exit 1
fi

if [[ $# -eq 0 ]]; then
    show_help
    exit 1
fi

case "$1" in
    -u|--add-user)
        useradd -m "$2"
        echo "User '$2' added."
        ;;
    -ru|--remove-user)
        userdel -r "$2"
        echo "User '$2' removed."
        ;;
    -g|--add-group)
        groupadd "$2"
        echo "Group '$2' created."
        ;;
    -ag|--add-to-group)
        usermod -aG "$3" "$2"
        echo "User '$2' added to group '$3'."
        ;;
    -h|--help)
        show_help
        ;;
    *)
        echo "Invalid option."
        show_help
        exit 1
        ;;
esac
