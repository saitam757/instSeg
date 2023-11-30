#!/bin/bash

XAUTH=$(realpath /tmp/xauth*)
echo $XAUTH
echo $HOME

HOST_WORKSPACE="$HOME/Development/Python/instSeg"
DOCKER_WORKSPACE="/home/project"

#HOST_DATASETS="$HOME/Development/DataSets"
#DOCKER_DATASETS="/datasets"

podman run --rm --network host -it \
--device nvidia.com/gpu=all \
--security-opt=label=disable \
--userns=keep-id \
--env DISPLAY=$DISPLAY \
--env="QT_X11_NO_MITSHM=1" \
--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
--volume="$XAUTH:/home/project/.Xauthority:z" \
--mount source="$HOST_WORKSPACE",target=$DOCKER_WORKSPACE,type=bind,consistency=cached \
--workdir $DOCKER_WORKSPACE \
--env HOME=$DOCKER_WORKSPACE \
--env PYTHONPATH=$DOCKER_WORKSPACE \
tensorflow:1.0

