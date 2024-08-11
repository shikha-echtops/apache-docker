<p align="center">
  <img src="https://img.shields.io/badge/Docker-Apache-blue?style=for-the-badge" alt="Docker Apache Badge">
</p>

# Apache Docker Container

This  Docker container sets up an Apache web server on an Ubuntu base image.

<p align="center">
  <img src="https://img.shields.io/badge/Ubuntu-Latest-orange?style=for-the-badge" alt="Ubuntu Badge">
  <img src="https://img.shields.io/badge/Docker-19.03%2B-blue?style=for-the-badge" alt="Docker Badge">
</p>

## Prerequisites

Before running the container, ensure that your system is up-to-date and Docker is installed.

### Update System

```bash
sudo apt update
sudo apt upgrade -y
```

##  Install Docker

```bash
sudo apt install docker.io -y
```
### Usage

### Build Docker Image

```bash
git clone https://github.com/SerrySingh/apache-docker.git
cd httpd-docker
sudo docker build -t my-apache-image .
```
# View Docker Images

Check the list of Docker images on your system.

```bash
sudo docker images
```

# Run Apache Docker Container

To run the Apache Docker container, execute the following command in your terminal:

```bash
sudo docker run -p 8080:80 my-apache-image
```

# Jenkins Configure excute shell commands 
```bash

cd httpd-docker
ls -lhtr

# Build the Docker image
docker build -t github-docker .

# Display the list of Docker images
docker images

docker run -d -p 5000:80 github-docker 
echo "Done"
```

# Jenkins Docker Integration

## Overview

This repository demonstrates the integration of Jenkins with Docker. The goal is to run Docker commands without using `sudo` by adding the Jenkins user to the Docker group.

## Instructions

### Step 1: Add Jenkins to the Docker Group


Run the following command to add the Jenkins user to the Docker group:

```bash
sudo usermod -aG docker jenkins

```
### Step 2: Restart Jenkins

Restart the Jenkins service to apply the group changes. Use the appropriate command based on your system. For example, on a system using systemd:
```bash
sudo systemctl restart jenkins
```
### Step 3: Verify Docker Access
Log in as the Jenkins user and run a simple Docker command to verify that Docker can be accessed without using sudo:
```bash
sudo su jenkins
docker run hello-world
```
If successful, you should see a message indicating that Docker is working.


# * How to share docker container in DockerHub Account through Jenkins (CI/CD). 

## Open Jenkins
1. Navigate to the Jenkins Dashboard.

2. Go to **Credentials**:
   - Dashboard -> Credentials -> System -> Global credentials (unrestricted) -> Add Credentials.

3. Open a new tab and proceed to your DockerHub account.

4. In DockerHub:
   - Go to **Settings** and create a Token.
   - Copy the Token Password and your Dockerhub Username.

5. Go back to Jenkins:
   - Add Credentials, and input the Token Password or Username. Save it.

6. Install the Docker Plugin:
   - Make sure to install the **Docker** plugins.

7. Create a New Job (Freestyle or any).

8. Configure the job:
   - Click **Source Code Management** and add your Repo URL.
   - Click **Build Environment** and add your DockerHub Credentials (no.5).
     - Write Username Variable and Password Variable.

9. Click on **Build Steps**, and choose any step according to your needs. I'll choose **Execute Shell**.

10. Open **Execute Shell** and write the following commands:

```bash
# Commands
echo "Docker"

# Change to the directory where your Dockerfile is located
cd httpd-docker
ls -lhtr

# Stop and remove any existing container running on port 3000
#docker stop $(docker ps -q -f "publish=3000") && docker rm $(docker ps -aq -f "publish=3000")

# Display the list of Docker images
docker images

docker run -d -p 6000:80 gjd
echo "Done"

echo $dpasswd | docker login -u $duser --password-stdin
docker tag gjd UserName/RepoName:TagName
docker push UserName/RepoName:TagName
```

## Container Run on Another EC2 instance with jenkins through SCP commands:- 

```bash
scp -r -o StrictHostKeyChecking=no httpd-docker ubuntu@52.91.166.214:/home/ubuntu
ssh -T -o StrictHostKeyChecking=no  ubuntu@52.91.166.214 sudo bash /home/ubuntu/httpd-docker/script-bash.sh
```
## Repository Structure
Dockerfile: Contains the Docker image configuration for the Jenkins job.
Jenkinsfile: Defines the Jenkins pipeline for building and running the Docker container.
