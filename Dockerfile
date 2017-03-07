FROM ubuntu:16.04


# Install apt-getable dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libgoogle-glog-dev libatlas-base-dev libeigen3-dev libsuitesparse-dev

ADD ./ /source

# Install Ceres from source
RUN \
    cd /source && \
    mkdir ceres-bin && \
    cd ceres-bin && \
    cmake ../ && \
    make -j3 && \
    make test && \
    make install




# GENERIC
WORKDIR /
