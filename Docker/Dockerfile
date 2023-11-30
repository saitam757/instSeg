#FROM docker.io/nvidia/cuda:11.0.3-cudnn8-devel-ubuntu20.04
FROM docker.io/tensorflow/tensorflow:2.9.2-gpu

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libxcb-util1 '^libxcb.*-dev' libx11-xcb-dev \
    libglu1-mesa-dev \
    libxrender-dev \
    libxi-dev \
    libxkbcommon-dev \ 
    libxkbcommon-x11-dev \
    wget \
    python3-dev \
    python3-pip \
    python3-setuptools \
    neovim \
    libx11-dev \
    x11-apps \
    qtbase5-dev  

RUN pip install --upgrade pip

ENV BUILD_DIR /build
WORKDIR ${BUILD_DIR}

COPY requirements.txt .
RUN pip install -r requirements.txt

# when attaching to running container via vs code and creating new files
# they have the have user rights and not root:w

#comment out for podman, uncomment for docker
#RUN addgroup --gid 1000 devuser
#RUN adduser --disabled-password --gecos "" --uid 1000 --gid 1000 devuser
#ENV HOME /home/devuser

#USER devuser
