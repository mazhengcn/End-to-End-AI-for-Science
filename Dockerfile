# Copyright (c) 2024 NVIDIA Corporation.  All rights reserved.

# To build the docker container, run: $ sudo docker build -t openhackathons:ai-for-science .
# To run: $ sudo docker run --gpus all --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -p 8888:8888 -p 8899:8899 -it --rm openhackathons:ai-for-science-v2
# Finally, open http://127.0.0.1:8888/

# Select Base Image
FROM nvcr.io/nvidia/modulus/modulus:24.09

# Install required python packages
RUN pip3 install gdown ipympl cdsapi
RUN pip3 install --upgrade nbconvert

# TO COPY the data
COPY workspace/ /workspace/

# This Installs All the Dataset
RUN python3 /workspace/python/source_code/dataset.py

# This decompresses the Dataset for usage
RUN python3 /workspace/python/source_code/fourcastnet/decompress.py

# Remove Compressed files
RUN rm -rf /workspace/python/source_code/fourcastnet/pre_data

# Install Earth-2 Studio
RUN apt update && apt install ffmpeg -y
#RUN git clone https://github.com/NVIDIA/earth2mip.git && cd earth2mip && pip install .
RUN pip install "makani[all] @ git+https://github.com/NVIDIA/modulus-makani.git@v0.1.0"
RUN pip install torch-harmonics==0.6.5
RUN pip install earth2studio[all]==0.2.0
RUN pip install cartopy mlflow

## Uncomment this line to run Jupyter notebook by default
CMD jupyter-lab --no-browser --allow-root --ip=0.0.0.0 --port=8888 --NotebookApp.token="" --notebook-dir=/workspace/python/
