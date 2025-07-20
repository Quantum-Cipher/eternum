FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install core packages
RUN apt-get update && apt-get install -y \
  gnupg2 \
  openssl \
  python3 \
  python3-pip \
  nodejs \
  npm \
  curl \
  wget \
  unzip \
  git \
  shred \
  && rm -rf /var/lib/apt/lists/*

# Install Foundry
RUN curl -L https://foundry.paradigm.xyz | bash \
    && echo ". ~/.foundry/bin" >> ~/.bashrc

ENV PATH="/root/.foundry/bin:$PATH"
