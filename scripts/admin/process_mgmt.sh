#!/bin/bash
# Process Monitoring and Management Script

function show_help {
    echo "Usage: $0 [OPTION] [ARGUMENT]"
    echo "  -l, --list                  List top 10 memory-consuming processes"
    echo "  -s, --search [PROCESS_NAME] Search for a running process by name"
    echo "  -k, --kill [PID]            Kill a process by PID"
    echo "  -h, --help                  Show this help"
}

if [[ $# -eq 0 ]]; then
    show_help
    exit 1
fi

case "$1" in
    -l|--list)
        echo "Top 10 processes by memory usage:"
        ps aux --sort=-%mem | head -n 11
        ;;
    -s|--search)
        echo "Searching for process '$2':"
        pgrep -a "$2" || echo "Process not found."
        ;;
    -k|--kill)
        kill -9 "$2"
        echo "Process $2 killed."
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
