#!/bin/bash

xhost +local:docker
sudo docker build -t emalron/nethack .
sudo docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v /tmp:/tmp \
    -v "$PWD":/usr/src/nethack \
    emalron/nethack \
    bash
