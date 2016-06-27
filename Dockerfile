FROM tsutomu7/python

RUN sudo apt-get update --fix-missing && \
    sudo apt-get install -y --no-install-recommends libgomp1 libgtk2.0 && \
    sudo apt-get clean && \
    conda install -y nomkl && \
    conda install -y -c https://conda.binstar.org/menpo opencv3 && \
	conda update -y --all && \
    find /opt -name __pycache__ | xargs rm -r && \
    sudo rm -rf /var/lib/apt/lists/* $HOME/.c* /opt/conda/pkgs/*
CMD ["/bin/bash"]
