FROM ubuntu:21:10

RUN apt-get update && \
    apt-get install -y python3 python3-pip gcc g++ curl

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - 

RUN sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

RUN apt-get update && \
    apt-get install -y terraform && \
    pip3 install ansible && \
    pip3 install ansible-lint

ENTRYPOINT [ "/bin/bash" ]
