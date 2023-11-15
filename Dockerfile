FROM golang:alpine

RUN apk update && apk upgrade && apk add curl make git sed
RUN git clone https://github.com/virtualzone/onedrive-uploader.git
WORKDIR onedrive-uploader
RUN sed -i 's/echo "package/#echo "package/g' Makefile
COPY ./version.go .
RUN VERSION=`cat VERSION` && sed -i "s/VERSION/${VERSION}/g" version.go
RUN make
RUN VERSION=`cat VERSION` && cp build/onedrive-uploader_linux_amd64_${VERSION} /usr/bin/onedrive-uploader
WORKDIR /go
RUN rm -rf onedrive-uploader
ENTRYPOINT [ "/usr/bin/onedrive-uploader", "-c", "/settings/config.json" ]
