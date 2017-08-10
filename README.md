# CS294

docker run -it gcr.io/tensorflow/tensorflow -env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" -v $(pwd):/ --privileged --net=host --name CS294 CS294
