### 1.把脚本文件夹也放在该目录

### 2.修改start.sh的脚本目录名称和Dockerfile中相关的脚本目录名称

### 3.创建镜像

    docker build -t runrobot -f Dockerfile .

#### 4.启动镜像

    docker run --name test -it runrobot 


