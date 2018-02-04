FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential cmake ffmpeg git libavcodec-dev libavformat-dev libdc1394-22 libdc1394-22-dev libfaac-dev libgstreamer-plugins-base0.10-dev libgstreamer-plugins-base1.0-dev libgstreamer0.10-dev libgstreamer1.0-dev libgtk-3-dev libgtk2.0-dev libjasper-dev libjpeg-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libopencv-dev libpng12-dev libqt4-dev libswscale-dev libtbb-dev libtheora-dev libtiff5-dev libv4l-dev libvorbis-dev libxine2-dev libxvidcore-dev pkg-config python3-dev python3-numpy python3-pip qtbase5-dev unzip v4l-utils x264 wget && \
    rm -rf /var/lib/apt/lists/* && \
    cd /tmp && \
    wget https://github.com/opencv/opencv/archive/3.4.0.zip && \
    unzip 3.4.0.zip && \
    cd opencv-3.4.0 && \
    mkdir build && \
    cd build && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D BUILD_opencv_python3=ON -D BUILD_opencv_python2=OFF -D BUILD_DOCS=OFF -D BUILD_EXAMPLES=OFF -D BUILD_TESTS=OFF .. && \
    make -j`cat /proc/cpuinfo | grep -c ^processor` && \
    make install && \
    ldconfig && \
    cd /tmp && \
    rm -rf 3.4.0.zip opencv-3.4.0 && \
    echo DONE

CMD ["/bin/bash"]
