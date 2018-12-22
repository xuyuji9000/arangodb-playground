#!/bin/sh

# default value: test_db
DATABASE=$1

if [ -z $DATABASE ]
then
    echo DATABASE variable is not set.
    exit 1
fi

BACKUP_ROOT=dump

if [ ! -d "$BACKUP_ROOT" ]; then
  echo BACKUP_ROOT $BACKUP_ROOT does not exists.
  mkdir -p $BACKUP_ROOT
  echo Created BACKUP_ROOT $BACKUP_ROOT
else
  echo BACKUP_ROOT $BACKUP_ROOT exists.
fi

arangodump --server.database $DATABASE --server.password "" --output-directory $BACKUP_ROOT/$DATABASE-`date +%F-%H-%M`
