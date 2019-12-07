FROM ubuntu:18.04

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

# Base system including toolchain and dependencies.
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    python3 \
    python3-pip

# Copy requirements file into container image.
COPY requirements.txt /

RUN pip3 install -r requirements.txt

# By convention, all development in /src.
WORKDIR /src

# Expose port for jupyter.
ENV JUPYTER_PORT 8888
EXPOSE ${JUPYTER_PORT}
