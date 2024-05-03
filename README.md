# TexLive Docker
TexLive unofficial Docker.

## Get the Image

>The image only supports amd64.

There two ways to get the image.

### Docker Pull
```bash
docker pull hallyoung/texlive
```

### Dockerfile
Run the following commands:
```bash
git clone --depth=1 https://github.com/hallyoung/texlive-docker.git
cd texlive-docker
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar -xzf install-tl-unx.tar.gz
```
This will provide you with an installation package. Adjust the Dockerfile accordingly:

```Dockerfile
FROM debian:stable-20240423-slim
WORKDIR /latex
## Replace with the name of the installation package
COPY ./install-tl-xxxxxxxx /tmp/
RUN apt update && apt install -y wget && \
    apt install -y perl-tk && \
    cd /tmp && \
    perl ./install-tl --no-interaction --no-doc-install --no-src-install
## Modify yyyy according to the package release version, such as 2023, 2024,...
ENV PATH="/usr/local/texlive/yyyy/bin/x86_64-linux:${PATH}"
CMD ["/bin/bash"]
```

### Build the Image
```bash
docker build --tag "img_name:tag" .
```

## Run a Container 
You can refer to this document: [Docker Run a Container](https://docs.docker.com/guides/walkthroughs/run-a-container/)

Here's an example command:
```bash
docker run -itd --name container_name texlive_img_name /bin/bash
```

## Verify
Enter the container and run the following command:
```bash
tex --version
latex --version
pdflatex --version
xelatex --version
```
