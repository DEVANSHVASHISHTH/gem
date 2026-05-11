#!/bin/bash
# Permission Management Script

function show_help {
    echo "Usage: $0 [OPTION] [ARGUMENTS]"
    echo "  -o, --owner [USER]:[GROUP] [FILE] Change owner and group of a file"
    echo "  -p, --perm [PERMISSIONS] [FILE]   Change permissions of a file (e.g., 755)"
    echo "  -h, --help                        Show this help"
}

if [[ $# -eq 0 ]]; then
    show_help
    exit 1
fi

case "$1" in
    -o|--owner)
        if [ "$EUID" -ne 0 ]; then
            echo "Changing ownership requires root privileges."
            exit 1
        fi
        chown -R "$2" "$3"
        echo "Ownership of '$3' changed to '$2'."
        ;;
    -p|--perm)
        chmod -R "$2" "$3"
        echo "Permissions of '$3' changed to '$2'."
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
