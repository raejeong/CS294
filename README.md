# CS294

xhost +local:root

sudo docker stop $(sudo docker ps -aq) && sudo docker rm $(sudo docker ps -aq) && sudo docker build . -t cs294 && sudo nvidia-docker run -it --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" -v $(pwd)/src:/src --privileged --net=host --name cs294 cs294

sudo docker exec -it cs294 bash

