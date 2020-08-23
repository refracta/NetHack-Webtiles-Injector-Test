#!/bin/bash

xhost +local:docker
sudo docker build -t emalron/nethack /dev
sudo docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v /tmp:/tmp \
    -v "$PWD":/usr/src/nethack \
    -v "$PWD"/../Nethack-Webtiles/test/pseudo-node-server:/usr/src/nethack-server \
    --name nethack-webtiles-dev \
    emalron/nethack \
    bash
