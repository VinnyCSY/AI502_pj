# AI502_pj

## Docker
### build image
docker build -t {image name}:latest .
### pull image
docker pull {remote image path}
### run
docker run -it --ipc=host --gpus device=0 -v {local directory path}:{docker directory path} {image name}:latest
### view docker images
docker images -a
### view all docker containers
docker ps -a
### start
docker start {container name}
### exec
docker exec -it {container_name} bash
### remove image
docker rmi {image name or containerID}

## Tensorboard
tensorboard --logdir={directory}/tensorboard --port=6008

### copy file from local to server
scp -r models {username}@143.248.47.110:{directory}