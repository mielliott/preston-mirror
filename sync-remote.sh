#!/bin/bash
PORT=$1
REMOTE_DIR=$2
LOCAL_DIR=$3

rsync -OPavze "ssh -p $PORT" $REMOTE_DIR $LOCAL_DIR

