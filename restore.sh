#!/bin/sh

# default value: test_db
DATABASE=$1

if [ -z $DATABASE ]
then
    echo DATABASE variable is not set.
    exit 1
fi

BACKUP_ROOT=dump

arangorestore --input-directory $BACKUP_ROOT/`ls -t $BACKUP_ROOT|head -n 1` --server.database $DATABASE --server.password ""
