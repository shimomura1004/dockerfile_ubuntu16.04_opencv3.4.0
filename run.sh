#!/bin/bash
docker run -it --rm -v $(pwd):/home/ubuntu -v $HOME/.Xauthority:/root/.Xauthority:rw -w=/home/ubuntu -e DISPLAY=$(ifconfig en0 | grep "inet " | awk '{print $2}'):0 ubuntu16.04_opencv3.4.0 $*
