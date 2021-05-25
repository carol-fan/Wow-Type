FROM ubuntu:focal-20201106

RUN apt update &&\
    apt install -y sudo &&\
    apt install -y curl &&\
    apt install -y python3 &&\
    apt install -y python3-pip &&\
    curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash - &&\
    sudo apt-get install -y nodejs &&\
    apt upgrade -y &&\
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip3 install -r requirements.txt

ENV NODE_OPTIONS=--max-old-space-size=4096
RUN jupyter labextension install jupyterlab-plotly@4.14.3 &&\
    jupyter lab build
ENV NODE_OPTIONS=
