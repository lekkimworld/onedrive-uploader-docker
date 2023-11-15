# onedrive-uploader #
Dockerfile to build a docker image for [onedrive-uploader](https://github.com/virtualzone/onedrive-uploader) using the `golang:alpine` base image. As I had issues with characters in `version.go` when building onedrive-uploader in the image I simply replace it outside the image and copy it into the image.

## Building ##
```
docker build . --tag lekkim/onedrive-uploader
```

## Usage ##
```
docker run --rm -it -v <path with config.json>:/settings lekkim/onedrive-uploader <arguments>
```

## Examples ##
```
docker run --rm -it -v ${PWD}:/settings lekkim/onedrive-uploader ls
docker run --rm -it -v ${PWD}:/settings -v /tmp:/uploaddata lekkim/onedrive-uploader upload /uploaddata/foo.bin /Some/Directory/on/OneDrive
```
