# texlive-docker
TexLive Nnofficial Docker.

## Get Image
### docker pull
```
docker pull
```
### Dockerfile
Run comand below.
```
git clone depth=1
cd 
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar -xzf install-tl-unx.tar.gz
```
你会得到一个安装包，根据这个安装包的名字修改 Dockerfile

```
FROM debian:stable-20240423-slim
WORKDIR /latex
## 替换成解压文件夹的名字
COPY ./install-tl-xxxxxxxx /tmp/
RUN apt update && apt install -y wget && \
    apt install -y perl-tk && \
    cd /tmp && \
    perl ./install-tl --no-interaction --no-doc-install --no-src-install
## 根据软件发行的年份修改 yyyy
ENV PATH="/usr/local/texlive/yyyy/bin/x86_64-linux:${PATH}"
# 设置默认命令
CMD ["/bin/bash"]
```
Build image

```
docker build --tag "img_name:tag" .
```
## Run a containt
根据你的喜好启动容器
## 进入容器
```
latex --version
```
