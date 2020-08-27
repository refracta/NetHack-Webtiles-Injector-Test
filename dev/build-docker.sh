#!/bin/bash

xhost +local:docker
sudo docker build -t emalron/nethack ./dev
mkdir server
sudo docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v "$PWD":/usr/src/nethack \
    -v "$PWD/server":/usr/src/nethack-server \
	  -p 80:80 \
    --name nethack-webtiles-dev \
    emalron/nethack \
    bash

