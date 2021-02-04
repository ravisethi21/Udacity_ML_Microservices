
[![Build Status](https://circleci.com/gh/ravisethi21/Udacity_ML_Microservices.svg?style=shield)](https://app.circleci.com/pipelines/github/ravisethi21/Udacity_ML_Microservices)

> Project Overview
In this project, I have applied the skills to operationalize a Machine Learning Microservice API.

There are given a pre-trained, sklearn model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on the data source site.


> Application:

- `app.py` application script
- `requirements.txt` dependencies of app


>  CI/CD:

- `.circleci/config.yml` folder with the configuration to CircleCI


>  Outputs:

- `output_txt_files`  folder with docker and kubernetes outputs files

>  Screenshots:

- `Screenshots`  folder with with some additional captures

>  Docker:

- `Dockerfile` use this file to deploy an image for the app to be runned on a container

> Scripts & Makefiles

- `Makefile`  useful commands to make setup, install, test, lint, run_docker, run_kubernetes, upload_docker, all
- `run_docker.sh` script to build and start container 
- `run_kubernetes.sh` script to run on Kubernetes
- `upload_docker.sh` script to upload to dockerhub container
- `make_prediction.sh` script to test application

> Setup the Environment

* Run `make setup` to create a virtual env and activate it
* Run `make install` to install the necessary dependencies
* Run `make lint` to perform code lynting

## Running `app.py`

You can run in different ways this app,these are Docker or Kubernetes

1. Run in Docker:  `./run_docker.sh`

The script will:
- Build an docker image
- List images to verify that this app is dockerized
- Run a container with this specified image and map port 5000 (host) to 80 (container)

> You can now access the app on localhost port 5000. [http://localhost:5000](http://localhost:5000)


2. Run in Kubernetes:  `./run_kubernetes.sh`

The script will:
- Start to run a container in Kubernetes cluster (make sure to have one ready the best option to locally is use `minikube`)
- Wait for the pod to be running
- List pod to verify your pod is up
- Forward port 5000 (host) to 80 (container)

> You can now access the app on localhost port 5000. [http://localhost:5000](http://localhost:5000)

You can delete when you've finished the pod with the command `kubectl delete pod prediction` and if you use `minikube` to test locally you should clean up your resources and delete the kubernetes cluster with a call to `minikube delete` to delete it or `minikube stop` for pause it.

## Test the app

You can test this application by running the script `./make_prediction.sh`, remember that depending on the input the model returns a price prediction on a house in Boston. In the script above there is a default json (you can change it) input:

```json
{  
   "CHAS":{  
      "0":0
   },
   "RM":{  
      "0":9.575
   },
   "TAX":{  
      "0":296.0
   },
   "PTRATIO":{  
      "0":15.3
   },
   "B":{  
      "0":396.9
   },
   "LSTAT":{  
      "0":4.98
   }
}
```
