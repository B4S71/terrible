FROM ubuntu:21.10

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
    apt-get install -y python3 python3-pip gcc g++ curl lsb-core software-properties-common git 

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - 

RUN apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

RUN apt-get update && \
    apt-get install -y terraform && \
    pip3 install ansible && \
    pip3 install ansible-lint
    
RUN apt-get upgrade -y

ENTRYPOINT [ "/bin/bash" ]
