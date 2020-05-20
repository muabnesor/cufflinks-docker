FROM ubuntu:18.04
MAINTAINER muabnesor <adam.rosenbaum@umu.se>

LABEL description="Image for cufflinks 2.2.1"

ENV CUFFLINKS_VERSION 2.2.1
ENV MINICONDA_VERSION latest 

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    build-essential \
    libncurses5-dev \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libcurl3-dev && \
    apt-get clean && apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget  --no-check-certificate https://repo.continuum.io/miniconda/Miniconda2-${MINICONDA_VERSION}-Linux-x86_64.sh 
RUN chmod +x Miniconda2-${MINICONDA_VERSION}-Linux-x86_64.sh
RUN bash Miniconda2-${MINICONDA_VERSION}-Linux-x86_64.sh -b -p /usr/miniconda2
ENV PATH /usr/miniconda2/bin:$PATH 

RUN conda install -c bioconda cufflinks=${CUFFLINKS_VERSION}


