FROM nvidia/cuda:8.0-cudnn6-devel

# set up environment
ENV DEBIAN_FRONTEND noninteractive

# update repos/ppas...
RUN apt-get update 
RUN apt-get install -y python3-software-properties software-properties-common curl
RUN apt-add-repository -y ppa:x2go/stable
RUN apt-get update 

# install core packages
RUN apt-get install -y python3-pip git
RUN apt-get install -y python3-matplotlib python3-scipy python3-numpy

# install python packages
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade ipython[all]
# RUN pip install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.11.0rc0-cp27-none-linux_x86_64.whl
RUN export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64"
RUN export CUDA_HOME=/usr/local/cuda
RUN pip3 install tensorflow-gpu
RUN pip3 install opencv-python
# set up gnuradio and related toolsm
RUN apt-get install -y sudo

# check out sources for reference
RUN mkdir /root/src/

# Gym deps
RUN apt-get install -y python3-numpy python3-dev cmake zlib1g-dev libjpeg-dev xvfb libav-tools xorg-dev python3-opengl libboost-all-dev libsdl2-dev swig pypy-dev automake autoconf libtool

# set up OpenAI Gym
RUN cd /root/src/ && git clone https://github.com/openai/gym.git && cd gym && pip3 install -e .
RUN pip install gym[atari] pachi_py
RUN mkdir /workspace
RUN pip3 install --upgrade scipy

