FROM debian:stable-20240423-slim
WORKDIR /latex
COPY ./install-tl-xxxxxxx /tmp/
RUN apt update && apt install -y wget && \
    apt install -y perl-tk && \
    cd /tmp && \
    perl ./install-tl --no-interaction --no-doc-install --no-src-install 
ENV PATH="/usr/local/texlive/yyyy/bin/x86_64-linux:${PATH}"
CMD ["/bin/bash"]
