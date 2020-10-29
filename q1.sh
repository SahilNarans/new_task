#!/bin/bash
abc=$(docker version)
if [ $? -ne 0 ];then
  apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  apt update && apt install -y docker-ce=5:19.03.10~3-0~ubuntu-focal containerd.io
else
  echo "already installed"
fi

############
#Pull Docker Image
docker pull nginx:latest

#Run Docker Conatiner

launch(){
docker run -itd --name mynginx1 -p 81:81 nginx:latest && open http://127.0.0.1
}

start(){
check=$(docker ps | grep mynginx1 -cw)
  if [ $check -ne 0 ]; then
    docker start mynginx1
  else
    launch
  fi
}

stop(){
  docker stop mynginx1
}
case $1 in

        start)
          start
        ;;

        stop)  
          stop
        ;;

        restart)
          stop
          start
        ;;

        launch)
          launch

        ;;

        *)
                echo -e "Please enter stop/start/restart/launch as command line argument to script"
        ;;
esac
