FROM tsutomu7/scientific-python

RUN sudo apt-get update --fix-missing && \
    sudo apt-get install -y --no-install-recommends libgtk2.0 && \
    sudo apt-get clean && \
    conda install -y -c menpo opencv3 && \
    find /opt -name __pycache__ | xargs rm -r && \
    sudo rm -rf /var/lib/apt/lists/* $HOME/.c* /opt/conda/pkgs/*
CMD ["/bin/bash"]
