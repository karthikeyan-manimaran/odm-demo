# ODM Demo Setup

Quick demo pipeline using OpenDroneMap (ODM) via Docker.

## Requirements
- Docker installed and running

## 1. Install ODM (Docker)

```bash
sudo apt update
sudo apt install -y docker.io
sudo systemctl start docker
sudo usermod -aG docker $USER
newgrp docker

docker pull opendronemap/odm
```

## 2. Get the sample dataset

```bash
mkdir -p project/images
git clone https://github.com/OpenDroneMap/odm_data_aukerman.git temp_data
mv temp_data/images/* project/images/
rm -rf temp_data
```

## 3. Run ODM

```bash
docker run -ti --rm \
  -v $(pwd)/project:/datasets/project \
  opendronemap/odm \
  --project-path /datasets project \
  --fast-orthophoto
```

## 4. View outputs

```bash
ls project/odm_orthophoto/
ls project/odm_report/
```

Key output files:
- `project/odm_orthophoto/odm_orthophoto.tif` — stitched orthomosaic
- `project/odm_report/` — processing report

## Dataset source
https://github.com/OpenDroneMap/odm_data_aukerman
