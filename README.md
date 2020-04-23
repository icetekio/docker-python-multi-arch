# Docker multi-arch playground 

This repository contains example code for the article published [here](https://medium.com/icetek/understanding-how-docker-multi-arch-images-work-9a7e035e2868)

## Running locally 

To run this project locally create a virtual environment and install on dependencies by running:

```shell script
python3.7 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

Now you can simply run the application
```shell script
python app.py
```

And test it in seperate terminal
```shell script
curl localhost:8080
```

## Commands used in the article 

To follow along you will have to change `icetekio` into your Docker Hub username, or organization that you have write access to. This includes this commands, and also the `manifest.yaml` file. 

Running simple test on machine, to check if python image is supported on this image and docker is working correctly.
```shell script
docker run -it python:3.8 python -c 'print("Hello world!")'
```

Building the image.
```shell script
docker build -t icetekio/nodeinfo:fixedarch . 
```

Running the container with our test image.
```shell script
docker run --name nodeinfo -d -p 8080:8080 icetekio/nodeinfo:fixedarch
curl localhost:8080
```
**NOTE:** The `-d` detaches the container. If you want to see it logs, then you can run `docker logs nodeinfo` of run the image with interactive mode by switching the `-d`  flag with `-it`. 

Pushing image to the docker registry.
```shell script
docker push icetekio/nodeinfo:fixedarch
```
**NOTE:** Before running this command you have to be login to docker registry.


Commands that were run on Raspberry Pi, Jetson Nano and Laptop to build images for specific architecture

Laptop
```shell script
docker build -t icetekio/nodeinfo:multiarch-amd64 . 
docker push icetekio/nodeinfo:multiarch-amd64
```

Raspberry Pi
```shell script
docker build -t icetekio/nodeinfo:multiarch-arm32 . 
docker push icetekio/nodeinfo:multiarch-arm32
```

NVIDIA Jetson Nano
```shell script
docker build -t icetekio/nodeinfo:multiarch-arm64. 
docker push icetekio/nodeinfo:multiarch-arm64
```

Creating a manifest
```shell script
manifest-tool --debug push from-spec manifest.yaml
```

---

Kept cool &#x1f9ca; by [Icetek](https://icetek.io/)

