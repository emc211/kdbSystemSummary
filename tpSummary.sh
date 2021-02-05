#!/bin/bash

# Function to log out a message + date + time
function log {
    echo "[$(date -d "today" +"%Y.%m.%dD%H:%M:%S")]: $*"
}

log "Usage - sh tpSummary.sh OWNER TARGETHOST SOURCEPATH "
log "Example - sh tpSummary.sh ecunnin madeuphost /path/to/tpLogs/"

if [[ $# -eq 0 ]] ; then
    exit 2
fi

OWNER=$1
TARGETHOST=$2
SOURCEPATH=$3
mkdir -p data
log "Running .."
log "ssh -o BatchMode=yes -q $OWNER@$TARGETHOST \"find -L $SOURCEPATH -maxdepth 1 -type f -regex '.*20.*' -exec gzip -l {} +\" | tr \"\\t\" \" \" | awk -v host=$TARGETHOST '{print \$0, host, "tp"}' "
ssh -o BatchMode=yes -q $OWNER@$TARGETHOST "find -L $SOURCEPATH -maxdepth 1 -type f -regex '.*20.*' -exec gzip -l {} +" | tr "\\t" " " | awk -v host=$TARGETHOST '{print $0, host, "tp"}' >> data/tpInfo.txt

