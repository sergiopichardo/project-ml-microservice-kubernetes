# Operationalize a Machine Learning Microservice API 
[![CircleCI](https://circleci.com/gh/sergiopichardo/project-ml-microservice-kubernetes/tree/circleci-project-setup.svg?style=svg)](https://circleci.com/gh/sergiopichardo/project-ml-microservice-kubernetes/tree/circleci-project-setup)

## Summary of the Project

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

## Instructions on How to Run the Scripts

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

### Running the App 
#### Standalone
```sh 
$ python app.py # make sure your virtual environment is running
```

#### Run in Docker  
NOTE: Sometimes the installation fails due to connectivity issues. If this happens to you please try to running the script again.
```sh
$ ./run_docker.sh  # or bash run_docker.sh
```

#### Run in Kubernetes  
NOTE: During step 2 you have to wait until the Kubernetes deployment is completely done. I added a *timeout* clause at the end of step 2 to wait for 3 seconds, you can change this to add more time if neccessary.
```sh
$ ./run_kubernetes.sh  # or bash run_kubernetes.sh
```

## Short Explaination of Each File
#### circle.ci/config.yml
#### app.py 
#### Dockerfile
#### Makefile 
#### requirements.txt 
#### upload_docker.sh 
#### run_docker.sh 
#### run_kubernetes.sh 
#### make_prediction.sh 


