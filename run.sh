#!/bin/bash
set -e
mkdir -p project/images
if [ -z "$(ls -A project/images 2>/dev/null)" ]; then
  echo "Downloading sample dataset..."
  git clone https://github.com/OpenDroneMap/odm_data_aukerman.git temp_data
  mv temp_data/images/* project/images/
  rm -rf temp_data
fi

echo "Running ODM..."
docker run -ti --rm \
  -v "$(pwd)/project:/datasets/project" \
  opendronemap/odm \
  --project-path /datasets project \
  --fast-orthophoto

echo "Done. Check project/odm_orthophoto/odm_orthophoto.tif"
