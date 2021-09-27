#!/bin/bash
cecho() {
    LB='\033[1;36m' # Light Blue
    LG='\033[1;32m' # Light Green
    YE='\033[1;33m' # Yellow

    # print normally if no second arg added
    if [[ $2 == "" ]]; then
        echo $1
        return
    fi

    case $1 in
    BL)
        printf "$LB%s\033[0m\n" "$2" # Light Cyan
        ;;
    GR)
        printf "$LG%s\033[0m\n" "$2" # Light green
        ;;
    YE)
        printf "$YE%s\033[0m\n" "$2" # Light green
        ;;
    normal | *)
        echo $2 # Light Purple
        ;;
    esac
}

function run_up {
    cecho "BL" "Tilting..."
    tilt up
}

function run_sh {
    cecho "BL" "Shelling deploy/example-python..."
    kubectl exec -it deploy/example-python -- /bin/bash
}

function run_migrate {
    cecho "BL" "Migrating..."
    ./scripts/run_manage_py.sh migrate
}

function run_makemigrations {
    cecho "BL" "Making migrations..."
    ./scripts/run_manage_py.sh makemigrations common
}

function run_unit {
    cecho "BL" "Run tests..."
    ./scripts/run_manage_py.sh test
}

function show_help {
    cecho "Help: $0 <ACTION>"
    cecho "Parameters :"
    cecho " - ACTION values :"
    cecho "   * up                            - Run tilt up."
    cecho "   * sh                            - Open a command line in the python app."
    cecho "   * migrate                       - Migrate the db."
    cecho "   * makemigrations                - Make db migrations."
    cecho "   * unit                          - Run unit tests."
}

if [[ "$1" == "" ]]; then
    cecho "No arguments provided."
    show_help
    exit 1
fi

case "$1" in
up)
    run_up
    ;;
sh)
    run_sh
    ;;
migrate)
    run_migrate
    ;;
makemigrations)
    run_makemigrations
    ;;
unit)
    run_unit
    ;;
*)
    show_help
    ;;
esac
