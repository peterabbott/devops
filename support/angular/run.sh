#!/bin/bash  

BUILD_DIR=$1

if [ -z "$1" ];  then
  BUILD_DIR=/opt/build
fi

if [ ! -z "$HOST_UID" ] && [ ! -z "$HOST_GID" ]; then 
  BUILDER_USER=builder

  echo "Setting up HOST user with ($HOST_UID:$HOST_GID)"

  groupadd -g $HOST_GID $BUILDER_USER 
  useradd -m -u $HOST_UID -g $HOST_GID $BUILDER_USER

  export HOME=/home/$BUILDER_USER 
else 
  BUILDER_USER=$(whoami) 
fi 

SUDO_CHECK=$(sudo -u $BUILDER_USER -n true > /dev/null 2>&1) 
if [ $? -ne 0 ]; then
  echo "Not able to continue to run the build as $BUILDER_USER"
  exit 1
fi
echo "Build from $BUILD_DIR with user $BUILDER_USER"
set -e #set to exit on error mode
 
sudo -u $BUILDER_USER npm install
sudo -u $BUILDER_USER bower install
sudo -u $BUILDER_USER grunt build

echo "Done build"
