#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./deploy.sh

This script deploys the website in the production server.'
    exit
fi

cd "$(dirname "$0")"

main() {
    zola build

    git push -v origin master
    git push -v srht master

    # copy over html files
    rsync -avz --progress --delete public/ deploy@5.75.194.9:/var/www/laniakea

    # restart server
    ssh deploy@5.75.194.9 'sudo systemctl reload caddy'
}

main "$@"
