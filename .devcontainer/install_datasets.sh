#!/usr/bin/env bash

# Install the dataset
python3 workspace/python/source_code/dataset.py

# This decompresses the Dataset for usage
python3 workspace/python/source_code/fourcastnet/decompress.py

# Remove Compressed files
rm -rf workspace/python/source_code/fourcastnet/pre_data
