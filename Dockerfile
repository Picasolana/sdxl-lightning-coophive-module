FROM pytorch/pytorch:1.10.0-cuda11.3-cudnn8-runtime

# Set up environment variables
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

# Install system dependencies
RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates curl git libglib2.0-0 libxext6 libsm6 libxrender1

# Install Miniconda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py37_4.10.3-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

# Create a conda environment and activate it
RUN /opt/conda/bin/conda install -c pytorch pytorch=1.10.0 torchvision=0.11.1 torchaudio=0.10.0 cudatoolkit=11.3 && \
    /opt/conda/bin/conda clean -ya
RUN /opt/conda/bin/conda install -c conda-forge transformers=4.30.2

# Set up the working directory
WORKDIR /app

# Copy necessary files
COPY execute.py /app/execute.py

# Define entrypoint
ENTRYPOINT ["python", "execute.py"]
