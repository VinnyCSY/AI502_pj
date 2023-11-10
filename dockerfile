FROM pytorch/pytorch:1.9.0-cuda11.1-cudnn8-devel
ARG DEBIAN_FRONTEND=noninteractive
# To fix GPG error: https://sseongju1.tistory.com/61, https://linuxconfig.org/ubuntu-20-04-gpg-error-the-following-signatures-couldn-t-be-verified
RUN apt-key del 7fa2af80 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F60F4B3D7FA2AF80
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC
# Install apt dependencies as root
RUN apt-get update && apt-get install -y \
    git \
	wget \
    ffmpeg \
    libsm6 \
    libxext6 \
    nano \
    sudo
RUN pip install timm matplotlib pandas  \
    torchvision \
    numpy>=1.14.3 \
    scipy \
    scikit-learn \
    opencv-python \
    scikit-image \ 
    tensorboard \
    tensorflow>=1.10.0 \
	pyyaml \
	argparse \
	h5py \
	imageio \
	scikit-video \
	torch \
    gdown
# RUN echo "Installing dependencies..." && \
# 	apt-get -y --no-install-recommends update && \
# 	apt-get -y --no-install-recommends upgrade && \
# 	apt-get install -y --no-install-recommends \
# 	wget \
# 	build-essential \
# 	cmake \
# 	git \
# 	libatlas-base-dev \
# 	libprotobuf-dev \
# 	libleveldb-dev \
# 	libsnappy-dev \
# 	libhdf5-serial-dev \
# 	protobuf-compiler \
# 	libboost-all-dev \
# 	libgflags-dev \
# 	libgoogle-glog-dev \
# 	liblmdb-dev \
# 	pciutils \
# 	python3-setuptools \
# 	python3-dev \
# 	python3-pip \
# 	opencl-headers \
# 	ocl-icd-opencl-dev \
# 	libviennacl-dev \
# 	libcanberra-gtk-module \
# 	libopencv-dev && \
# 	python3 -m pip install \
# 	numpy \
# 	protobuf \
# 	opencv-python

# RUN echo "Downloading and building OpenPose..." && \
# 	git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose.git && \
# 	mkdir -p /openpose/build && \
# 	cd /openpose/build && \
# 	cmake .. && \
# 	make -j`nproc` && \
# 	wget -P /openpose/models/pose/coco/ https://github.com/foss-for-synopsys-dwc-arc-processors/synopsys-caffe-models/raw/master/caffe_models/openpose/caffe_model/pose_iter_440000.caffemodel

# # Add new user to avoid running as root
# RUN useradd -ms /bin/bash docker
# USER docker
WORKDIR /home/docker/mmnet
# docker build -t sycho_{}:latest .
# docker run -it --ipc=host --gpus device=0 -v /home/sycho/SLRT/TwoStreamNetwork:/home/docker/two_stream_slr -v /data/sycho:/home/docker/two_stream_slr/data sycho_{}:latest

# docker exec -it {} bash
# conda env list
# source activate slt
# RUN conda env create -f environment.yml
# RUN source activate slt