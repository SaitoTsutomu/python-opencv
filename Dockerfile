FROM tsutomu7/python

RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends libgomp1 libgtk2.0 && \
	apt-get clean && \
    conda install -y nomkl && \
    conda install -c https://conda.binstar.org/menpo opencv3 && \
    find /opt -name __pycache__ | xargs rm -r && \
    rm -rf /var/lib/apt/lists/* /root/.c* /opt/conda/pkgs/*
CMD ["/bin/bash"]
