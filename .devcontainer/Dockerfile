# Copyright (c) 2024 NVIDIA Corporation.  All rights reserved.

# To build the docker container, run: $ sudo docker build -t openhackathons:ai-for-science .
# To run: $ sudo docker run --gpus all --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -p 8888:8888 -p 8899:8899 -it --rm openhackathons:ai-for-science-v2
# Finally, open http://127.0.0.1:8888/

# Select Base Image
FROM nvcr.io/nvidia/modulus/modulus:24.09

# Install required python packages
RUN pip3 install --upgrade gdown ipympl cdsapi nbconvert

# Install Earth-2 Studio
RUN apt update && apt install ffmpeg -y
#RUN git clone https://github.com/NVIDIA/earth2mip.git && cd earth2mip && pip install .
RUN pip install "makani[all] @ git+https://github.com/NVIDIA/modulus-makani.git@v0.1.0" \
    torch-harmonics==0.6.5 \
    earth2studio[all]==0.2.0 \
    cartopy \
    mlflow

## Uncomment this line to run Jupyter notebook by default
# CMD jupyter-lab --no-browser --allow-root --ip=0.0.0.0 --port=8888 --NotebookApp.token="" --notebook-dir=/workspace/python/
