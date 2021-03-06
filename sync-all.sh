#!/bin/bash
set -e

LOG_DIR=${1:-$~/logs}
PORT=${2:-9934}

REMOTE_ROOT=mielliott@preston.guoda.bio:/home/preston
REMOTE_GIB=$REMOTE_ROOT/preston-archive/data/
REMOTE_BHL=$REMOTE_ROOT/preston-bhl/data/
REMOTE_DATAONE=$REMOTE_ROOT/preston-bhl/data/

LOCAL_ROOT=//mnt/preston.acis.ufl.edu_data
LOCAL_GIB=$LOCAL_ROOT/gbif-idigbio-biocase/data/
LOCAL_BHL=$LOCAL_ROOT/bhl/data/
LOCAL_DATAONE=$LOCAL_ROOT/dataone/data/

LOG_FILE=$LOG_DIR/$(date +"%Y-%m-%d-%H-%M").out
LATEST_FILE=$LOG_DIR/latest.out

echo "Saving log to $LOG_FILE"

mkdir -p $LOG_DIR
touch $LOG_FILE
ln -sf $LOG_FILE $LATEST_FILE

./sync-remote.sh $PORT $REMOTE_GIB $LOCAL_GIB >> $LOG_FILE
./sync-remote.sh $PORT $REMOTE_BHL $LOCAL_BHL >> $LOG_FILE
./sync-remote.sh $PORT $REMOTE_DATAONE $LOCAL_DATAONE >> $LOG_FILE

