#!/bin/bash

# Add Jenkins repository key
 
 sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian/jenkins.io-2023.key



# Add Jenkins repository to sources list
 echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null


# Update package lists
 sudo apt-get update

# Install Java (OpenJDK 17)
  sudo apt-get install fontconfig openjdk-17-jre

# Install Jenkins
  sudo apt-get install jenkins

# Print initial admin password to the terminal
echo "Waiting for Jenkins to start..."
sleep 10s  # Wait for Jenkins to start (adjust if needed)

# Print the initial admin password
echo "Initial admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
