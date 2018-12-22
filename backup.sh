#!/bin/sh

DATABASE=test_db
BACKUP_ROOT=dump/

if [ ! -d "$DIRECTORY" ]; then
  echo BACKUP_ROOT $BACKUP_ROOT does not exists.
  mkdir -p $BACKUP_ROOT
  echo Created BACKUP_ROOT $BACKUP_ROOT
else
  echo BACKUP_ROOT $BACKUP_ROOT exists.
fi

arangodump --server.database $DATABASE --server.password "" --output-directory $BACKUP_ROOT/$DATABASE-`date +%F-%H-%M`
