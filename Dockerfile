FROM gcr.io/tensorflow/tensorflow:latest-gpu
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install git -y
RUN apt-get install -y python-numpy python-dev cmake zlib1g-dev libjpeg-dev xvfb libav-tools xorg-dev python-opengl libboost-all-dev libsdl2-dev swig
WORKDIR /
RUN git clone https://github.com/openai/gym.git
WORKDIR /gym
RUN pip install -e .[all]
WORKDIR /
