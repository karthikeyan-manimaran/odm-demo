# ODM Demo Setup

Quick demo pipeline using OpenDroneMap (ODM) via Docker.

## Dataset
Sample dataset from official ODM test data:
https://github.com/OpenDroneMap/odm_data_aukerman

## Run
docker pull opendronemap/odm
docker run -ti --rm -v $(pwd)/project:/datasets/project opendronemap/odm --project-path /datasets project --fast-orthophoto

## Outputs
- project/odm_orthophoto/odm_orthophoto.tif
- project/odm_report/
