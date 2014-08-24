#!/bin/bash

IMAGE_ID=$1
LOCAL_DIR=$2
MAPPED_DIR=$3
BUILD_CMD=$4

[ -z "$IMAGE_ID" ] && exit 1
[ -z "$LOCAL_DIR" ] && exit 1
[ -z "$MAPPED_DIR" ] && exit 1
[ -z "$CMD" ] && exit 1

LOCAL_BUILD_ROOT=$LOCAL_DIR
if [[ "$LOCAL_DIR" != /* ]]; then
  LOCAL_BUILD_ROOT=$(pwd)/$LOCAL_DIR
elif  [[ "$LOCAL_DIR" = "." ]]; then
  LOCAL_BUILD_ROOT=$(pwd)
fi

docker -it --rm $IMAGE_ID -v $LOCAL_BUILD_ROOT:$MAPPED_DIR -w $MAPPED_DIR $CMD
