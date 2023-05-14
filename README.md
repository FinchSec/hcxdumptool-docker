# Hcxdumptool container

Docker for https://github.com/ZerBea/hcxdumptool using Kali as a base. Rebuilt daily.

## Pulling

### DockerHub

[![Docker build and upload](https://github.com/FinchSec/hcxdumptool-docker/actions/workflows/docker.yml/badge.svg?event=push)](https://github.com/FinchSec/hcxdumptool-docker/actions/workflows/docker.yml)

URL: https://hub.docker.com/r/finchsec/hcxdumptool

`sudo docker pull finchsec/hcxdumptool`

## Running

`sudo docker run --rm -it --privileged --net=host --pid=host finchsec/hcxdumptool`
