#!/bin/bash
set -e
set -u

PWD="`pwd`"
PROG="`basename $0`"
echo $PROG

######### sdositeapp prepare script #######
LIST="*.yaml
    data
    docs
    templates
    *.json"
    

if [ ! -d runscripts ]
then
    echo "No 'runscripts' directory here aboorting!"
    exit 1
fi
if [ ! -d site ]
then
    echo "No 'site' directory here aboorting!"
    exit 1
fi
TARGET="`pwd`/site"
(
    cd ..
    for i in $LIST
    do
        #rsync --progress -r -u $i $TARGET
        rsync -r -u $i $TARGET
    done
)
