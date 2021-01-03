#!/usr/bin/env bash
XAUTH=/tmp/.docker.xauth
if [ ! -f $XAUTH ]
then
    xauth_list=$(xauth nlist :0 | sed -e 's/^..../ffff/')
    if [ ! -z "$xauth_list" ]
    then
        echo $xauth_list | xauth -f $XAUTH nmerge -
    else
        touch $XAUTH
    fi
    chmod a+r $XAUTH
fi
docker run -it \
    --rm \
    --name="ros-desktop-container" \
    -e DISPLAY \
    -e "QT_X11_NO_MITSHM=1" \
    -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -v "$PWD/catkin_ws:/catkin_ws" \
    -e "XAUTHORITY=$XAUTH" \
    -v "$XAUTH:$XAUTH" \
    my-ros-desktop:latest $@
