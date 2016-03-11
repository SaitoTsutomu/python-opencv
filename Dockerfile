FROM tsutomu7/ubuntu-essential

ENV PATH=/opt/conda/bin:$PATH \
    LANG=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive \
    MINICONDA=Miniconda3-latest-Linux-x86_64.sh
RUN apt-get update --fix-missing && apt-get install -y --no-install-recommends \
        libglib2.0-0 libxext6 libsm6 libxrender1 busybox wget libgomp1 libgtk2.0 && \
    /bin/busybox --install && \
    apt-get clean && \
    echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget -q --no-check-certificate \
            https://repo.continuum.io/miniconda/$MINICONDA && \
    bash /$MINICONDA -b -p /opt/conda && \
    conda install -y nomkl && \
    conda install -c https://conda.binstar.org/menpo opencv3 && \
    rm -rf /var/lib/apt/lists/* /$MINICONDA /root/.c* /opt/conda/pkgs/*
CMD ["/bin/bash"]
