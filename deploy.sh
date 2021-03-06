#!/bin/bash

test -d /opt/toughradius || cd /opt/toughradius

# 下载容器部署描述文件
curl https://raw.githubusercontent.com/toughstruct/toughradius-docker/master/docker-compose.yml -o docker-compose.yml

# 下载数据库脚本文件
curl https://raw.githubusercontent.com/toughstruct/toughradius-docker/master/toughradius.sql -o toughradius.sql

# 拉取最新镜像
docker-compose pull

# 首先创建mysql容器
docker-compose up -d mysql

sleep 2
# 等待 3秒 mysql 初始化完成后再执行sql
sleep 1
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"


# 创建数据库表
mysql -h 127.0.0.1 -uroot -pmyroot < ./toughradius.sql

# 创建所有容器
docker-compose  up -d