FROM ubuntu:22.04

ARG USER_NAME=myuser
ARG USER_PASSWORD=password

# Change apt source
RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list
RUN apt update
RUN apt install -y sudo

# Set user
RUN useradd -m $USER_NAME && \
    echo $USER_NAME:$USER_PASSWORD | chpasswd
RUN usermod -aG sudo $USER_NAME 
RUN echo $USER_NAME' ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER $USER_NAME 
ENV HOME /home/$USER_NAME

# Copy config
ENV CONFIG_DIR $HOME/.config
RUN mkdir $CONFIG_DIR
COPY * $CONFIG_DIR/
RUN sudo chown $USER_NAME:sudo $CONFIG_DIR/*

# Set fish and vim
RUN chmod +x $CONFIG_DIR/setup.sh && \
    bash $CONFIG_DIR/setup.sh $CONFIG_DIR

WORKDIR $HOME