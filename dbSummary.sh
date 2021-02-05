#!/bin/bash

# Function to log out a message + date + time
function log {
    echo "[$(date -d "today" +"%Y.%m.%dD%H:%M:%S")]: $*"
}

log "Usage - sh dbSummary.sh OWNER TARGETHOST SOURCEPATH "
log "Example - sh dbSummary.sh ecunnin madeuphost /path/to/hdbs/*/hdb/"

if [[ $# -eq 0 ]] ; then
    exit 2
fi

OWNER=$1
TARGETHOST=$2
SOURCEPATH=$3
mkdir -p data/
ssh -o BatchMode=yes -q $OWNER@$TARGETHOST "find -L $SOURCEPATH -maxdepth 1 -type d -regex '.*20.*' -print0 | du -L --files0-from=- -bc -d 0" | tr "\\t" " " | awk -v host=$TARGETHOST '{print $0, host, "db"}' >> data/dbInfo.txt

