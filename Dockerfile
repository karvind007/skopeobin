FROM jdeathe/centos-ssh:2.6.1

LABEL org.opencontainers.image.authors="superarvind007@gmail.com"

ENV CGO_ENABLED=0
ENV GOPATH=/usr/local/go
ENV PATH=$PATH:/usr/local/go/bin

RUN yum update -y &&\
    yum install wget git tar -y &&\
    wget https://golang.org/dl/go1.15.5.linux-amd64.tar.gz &&\
    tar -zxvf go1.15.5.linux-amd64.tar.gz -C /usr/local/

ENV skopeo_version="v1.7.0"
RUN git clone https://github.com/containers/skopeo --branch ${skopeo_version} $GOPATH/src/github.com/containers/skopeo

WORKDIR $GOPATH/src/github.com/containers/skopeo
RUN make BUILDTAGS=containers_image_openpgp GO_DYN_FLAGS= bin/skopeo

ENTRYPOINT [ "/usr/local/go/src/github.com/containers/skopeo/bin/skopeo" ]
