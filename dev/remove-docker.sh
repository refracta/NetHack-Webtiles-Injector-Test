#!/bin/bash

sudo docker stop nethack-webtiles-dev &&
sudo docker rm nethack-webtiles-dev &&
sudo docker rmi emalron/nethack
