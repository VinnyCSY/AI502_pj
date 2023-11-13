# AI502_pj

## Docker
### build image
docker build -t {image name}:latest .
### pull image
docker pull vinny1126/ai502:latest
### run
docker run -it --ipc=host --gpus device=0 -v {local directory path}:{docker directory path} --name {container name} {image name}:latest
### view docker images
docker images -a
### view all docker containers
docker ps -a
### start
docker start {container name}
### stop
docker stop {container name}
### exec
docker exec -it {container name} bash
### remove image
docker rmi {image name}
### remove containter
docker rm {container ID or container name}

## Tensorboard
tensorboard --logdir={directory}/tensorboard --port={local port}

### copy file from local to server
scp -r {directory or files} {username}@{server path}:{directory}