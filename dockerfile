FROM pytorch/pytorch:1.9.0-cuda11.1-cudnn8-devel
ARG DEBIAN_FRONTEND=noninteractive
# To fix GPG error: https://sseongju1.tistory.com/61, https://linuxconfig.org/ubuntu-20-04-gpg-error-the-following-signatures-couldn-t-be-verified
RUN apt-key del 7fa2af80 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F60F4B3D7FA2AF80
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC

ENV TORCH_CUDA_ARCH_LIST="6.0 6.1 7.0+PTX"
ENV TORCH_NVCC_FLAGS="-Xfatbin -compress-all"
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

# Install MMCV
RUN pip install mmcv-full==1.3.16 -f https://download.openmmlab.com/mmcv/dist/cu111/torch1.8.0/index.html


RUN git clone https://github.com/open-mmlab/mmgeneration.git /mmgen
WORKDIR /mmgen
ENV FORCE_CUDA="1"
RUN pip install -r requirements.txt
RUN pip install --no-cache-dir -e .


WORKDIR /home/sycho