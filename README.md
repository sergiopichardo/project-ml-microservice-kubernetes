# Operationalize a Machine Learning Microservice API 
[![CircleCI](https://circleci.com/gh/sergiopichardo/project-ml-microservice-kubernetes/tree/circleci-project-setup.svg?style=svg)](https://circleci.com/gh/sergiopichardo/project-ml-microservice-kubernetes/tree/circleci-project-setup)

## Summary of the Project

In this project, we applied the skills we acquired in this course to operationalize a Machine Learning Microservice API. 

We were given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. 

This project tested our ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing).

## 1. Instructions on How to Run the Scripts

### Create a virtualenv and activate it
```sh
$ make setup 
```
```sh
$ source venv/bin/activate
```

### Install the necessary dependencies
Install modules in *requirements.txt* file
```sh
$ make install
```

### Running Linters
Test for errors in Dockerfile and python source code
```sh
$ make lint
```

### Docker steps 
Install docker locally. This will install docker and kubernetes. 

```sh
$ brew install docker
```

### Setup Kubernetes locally
Install *minikube* utility. 
```sh
$ brew install minikube 
```

## 2. Running the App 
#### Standalone
```sh 
$ python app.py # make sure your virtual environment is running
```

#### Run in Docker  
NOTE: Sometimes the installation fails due to Docker Hub connectivity issues. If this happens please try running the script again.
```sh
$ ./run_docker.sh  # or bash run_docker.sh
```

#### Run in Kubernetes  
NOTE: During step 2 you have to wait until the Kubernetes deployment is completely done. I added a *timeout* clause at the end of step 2 in the **.run_kubernetes.sh** to wait for 3 seconds, you can change this to add more time if neccessary. 
```sh
$ ./run_kubernetes.sh  # or bash run_kubernetes.sh
```

## 3. Short Explaination of Each File
#### circle.ci/config.yml
Circle CI needs this file to test our source code on their platform. Inside this file are *steps* that tell circleci which steps it needs to follow to test for successfully installing dependencies, or to test for syntax errors with linters.

#### app.py 
This is the main entry point of the application. 

#### Dockerfile
Dockerfile is used to create an image which we can then upload to Docker Hub and use it to launch a container inside kubernetes.

#### Makefile 
Makefile is used to setup or automate the local setup for the application.

#### requirements.txt 
Is used to list the dependencies needed to install with pip inside a virtual envrironment. 

#### upload_docker.sh 
A bash script used to automate the uploading process of a Docker image to Docker Hub. 

#### run_docker.sh 
Used to build, list the docker image created and to run the container locally. 

#### run_kubernetes.sh 
Used to create a kubernetes *Deployment* and use that deployment to run a Docker container using Kubernetes, list Pods, and Forward the Container Por to the Host, so we can access the container locally. 

#### make_prediction.sh 
I used to send a POST request that contains some data that the ML algorithm will use to generate a prediction.

