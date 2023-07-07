#!/bin/bash

# 从终端输入获取动作
ACTION=$1

# 从终端输入获得容器名称
if [ -z $2 ]; then
    CONTAINER_NAME="myapp"
else 
    CONTAINER_NAME=$2
fi


# 检查第一个参数，如果是 build
if [ $ACTION = "build" ]; then
    # 检查是否存在 $ACTION 镜像
    if [ $(docker images | grep $CONTAINER_NAME | wc -l) -gt 0 ]; then
        # 存在则删除
        docker rmi -f $CONTAINER_NAME
    fi

    # 构建镜像
    docker build -t $CONTAINER_NAME . --build-arg USER_NAME=$(id -un) --build-arg USER_GROUP=$(id -gn)
elif [ $ACTION = "run" ]; then
    # 运行容器
    docker run -it --rm $CONTAINER_NAME zsh
elif [ $ACTION = "rm" ]; then
    docker rmi $CONTAINER_NAME
else
    # 打印帮助信息
    echo "Usage: ./dockerup.sh [build|run] [container_name]"
fi
