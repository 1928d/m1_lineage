FROM continuumio/miniconda3

RUN apt update && apt install -y procps pigz && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN conda config --add channels conda-forge && \
    conda config --add channels bioconda && \
    conda config --add channels default

RUN conda install minimap2 samtools bcftools && conda clean -a
