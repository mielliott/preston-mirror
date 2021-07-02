#!/bin/bash

PORT=${1:-9934}

REMOTE_ROOT=mielliott@preston.guoda.bio:/home/preston
REMOTE_GIB=$REMOTE_ROOT/preston-archive/data/
REMOTE_BHL=$REMOTE_ROOT/preston-bhl/data/
REMOTE_DATAONE=$REMOTE_ROOT/preston-bhl/data/

LOCAL_ROOT=//mnt/preston.acis.ufl.edu_data
LOCAL_GIB=$LOCAL_ROOT/gbif-idigbio-biocase/data/
LOCAL_BHL=$LOCAL_ROOT/bhl/data/
LOCAL_DATAONE=$LOCAL_ROOT/dataone/data/

LOG_DIR=$(pwd)/logs
LOG_FILE=$LOG_DIR/$(date +"%Y-%m-%d-%H-%M").out

mkdir -p $LOG_DIR
touch $LOG_FILE
nohup time bash -c "\\
  ./sync-remote.sh $PORT $REMOTE_GIB $LOCAL_GIB \\
  ./sync-remote.sh $PORT $REMOTE_BHL $LOCAL_BHL \\
  ./sync-remote.sh $PORT $REMOTE_DATAONE $LOCAL_DATAONE
" > $LOG_FILE 2>&1 &

