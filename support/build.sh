#!/bin/bash -e 

IMAGE_ID=$1
LOCAL_DIR=$2
MAPPED_DIR=$3
BUILD_CMD=$4

[ -z "$IMAGE_ID" ] && { echo "No Docker Build Image ID"; exit 1; }
[ -z "$LOCAL_DIR" ] && { echo "No Local Build Directory Root";exit 1; }
[ -z "$MAPPED_DIR" ] && { echo "No Mapped Container Directory";exit 1; }
[ -z "$BUILD_CMD" ] && { echo "No Build Command";exit 1; }

LOCAL_BUILD_ROOT=$LOCAL_DIR
if [[ "$LOCAL_DIR" != /* ]]; then
  LOCAL_BUILD_ROOT=$(pwd)/$LOCAL_DIR
elif  [[ "$LOCAL_DIR" = "." ]]; then
  LOCAL_BUILD_ROOT=$(pwd)
fi

[ ! -z "$BUILD_USER" ] && RUN_BUILD_USER_PARAM="-u $BUILD_USER"
LOCAL_HOME_DIR=$(eval echo ~$BUILD_USER)

echo "Using as build root directory: $LOCAL_BUILD_ROOT"
echo "Running build as user: $BUILD_USER"
EXEC_CMD="docker run -a stderr \
                     -a stdout \
                     --rm \
                     -v $LOCAL_BUILD_ROOT:$MAPPED_DIR \
                     -w $MAPPED_DIR \
                     -e HOST_UID=$(id -u) \
                     -e HOST_GID=$(id -g) \
                     -e TARGET_WORK_DIR=$MAPPED_DIR \
                     $IMAGE_ID \
                     $BUILD_CMD"
                     
echo "Running with command: $EXEC_CMD"
eval $EXEC_CMD
RETVAL=$?

echo "Done - $RETVAL"

exit $RETVAL
