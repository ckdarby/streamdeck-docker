FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/root/.local/bin:${PATH}"
ENV DISPLAY=:0

# Install required packages
RUN apt-get update && apt-get install -y --no-install-recommends \
      libhidapi-libusb0 \
      pipx \
      wget \
      python3 \
      python3-pip \
      udev \
      x11-apps \
      build-essential \
      python3-dev \
      libudev-dev \
      libglib2.0-0 \
      libgl1-mesa-glx\
      libegl1-mesa-dev \
      qt6-base-dev \
      libcairo2 \
      libxcb-cursor0 \
    && rm -rf /var/lib/apt/lists/*


# Don't care unoptimised install Docker - testing
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable"
RUN apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io


RUN python3 -m pipx install streamdeck-linux-gui


COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh


ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
