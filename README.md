DevOps Project 1: Linux Server Setup on AWS EC2

📌 Project Overview

This project demonstrates how to launch and configure an Ubuntu Linux server on AWS EC2 and install the basic DevOps tools required for development and future CI/CD projects.

The project includes:

AWS EC2 instance setup

Ubuntu Linux server configuration

SSH connection

Linux package update and upgrade

Git installation

Java 17 installation

Maven installation

Docker installation

Docker service configuration

Docker user permission configuration

Docker container testing

Final tool verification

🎯 Project Objective

Set up an Ubuntu Linux server on AWS EC2 and install, configure, and verify:

Git

Java OpenJDK 17

Apache Maven

Docker

🛠 Technologies Used

Technology

Purpose

AWS EC2

Cloud virtual server

Ubuntu Linux

Server operating system

SSH

Secure remote server connection

Git

Version control

Java 17

Java development environment

Maven

Build automation and dependency management

Docker

Containerization

Amazon EBS gp3

EC2 persistent storage

🔄 Project Architecture

Windows Laptop
      ↓
AWS Console
      ↓
EC2 Ubuntu Server
      ↓
SSH Connection
      ↓
Update Linux Packages
      ↓
Install Git
      ↓
Install Java 17
      ↓
Install Maven
      ↓
Install Docker
      ↓
Configure Docker
      ↓
Run hello-world Container
      ↓
Verify All Tools

Step 1: Select Ubuntu AMI

I selected Ubuntu Server as the operating system for the EC2 instance.

Configuration

Operating System: Ubuntu Server 26.04 LTS

Architecture: 64-bit (x86)

Default Username: ubuntu

Why Ubuntu?

Ubuntu is widely used for cloud servers, DevOps environments, Docker, CI/CD tools, and Linux administration.



Step 2: Select EC2 Instance Type

I selected:

t3.micro

The instance provides:

2 vCPU
1 GiB Memory

It is suitable for this learning DevOps project.



Step 3: Create SSH Key Pair

I created a new key pair.

Key Pair Name: DevOps-Project-1-Key
Key Type: RSA
Private Key Format: .pem

Why is the key pair required?

The .pem private key is used to authenticate securely when connecting to the EC2 server using SSH.

⚠️ Never upload the .pem private key to GitHub.



Step 4: Configure Security Group

I configured the security group to allow SSH access.

Protocol: SSH
Port: 22

Why SSH?

SSH provides a secure remote connection from the local computer to the Ubuntu EC2 server.



Step 5: Configure EBS Storage

Configured:

Storage Size: 8 GiB
Volume Type: gp3

What is Amazon EBS?

Amazon Elastic Block Store acts like a virtual hard disk attached to the EC2 server. It stores the operating system, applications, installed tools, and server data.

Why gp3?

gp3 is a general-purpose SSD suitable for Linux servers and DevOps learning environments.



Step 6: Launch EC2 Instance

After reviewing the configuration, I launched the EC2 instance and waited until it reached the running state.



Step 7: Get SSH Connection Details

AWS provides the SSH command required to connect to the EC2 instance.

Command

ssh -i "DevOps-Project-1-Key.pem" ubuntu@<EC2-PUBLIC-DNS>

Command Explanation

ssh → starts a secure shell connection

-i → specifies the private key

DevOps-Project-1-Key.pem → private key used for authentication

ubuntu → default Ubuntu username

<EC2-PUBLIC-DNS> → EC2 server address



Step 8: Connect to Ubuntu EC2 Server

After connecting successfully, the terminal changes to an Ubuntu server prompt similar to:

ubuntu@ip-172-31-xx-xx:~$

This confirms that commands are now being executed on the remote Ubuntu EC2 server.



Step 9: Update Ubuntu Package Repository

Command

sudo apt update

Why?

sudo apt update refreshes Ubuntu's package index so the server knows about the latest packages available from its configured repositories.

sudo apt update
      ↓
Check repositories
      ↓
Download latest package information
      ↓
Package index refreshed

Step 10: Upgrade Installed Packages

Command

sudo apt upgrade -y

Why?

This upgrades currently installed packages to newer available versions.

Meaning

sudo → run with administrator privileges

apt → Ubuntu package manager

upgrade → upgrade installed packages

-y → automatically answer Yes to prompts

Difference

sudo apt update
= Refresh package information

sudo apt upgrade -y
= Install available package upgrades

Step 11: Install Git

Command

sudo apt install git -y

Verify

git --version

Why Git?

Git is a distributed version-control system used to:

Track source-code changes

Maintain project history

Collaborate with developers

Create branches

Work with GitHub repositories

Step 12: Install Java 17

Command

sudo apt install openjdk-17-jdk -y

Verify

java --version

Why Java 17?

Java 17 is a Long-Term Support version suitable for Java applications and many enterprise and DevOps environments.

Step 13: Install Apache Maven

Command

sudo apt install maven -y

Verify

mvn --version

Why Maven?

Maven is a build automation and dependency-management tool mainly used for Java projects. It helps with:

Compiling source code

Managing dependencies

Running tests

Packaging applications

Step 14: Install Docker Prerequisites

Command

sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

Why?

ca-certificates → allows Ubuntu to trust HTTPS certificates

curl → downloads Docker files and signing keys

software-properties-common → provides repository-management utilities

apt-transport-https → supports package downloads over HTTPS

Step 15: Add Docker Official GPG Key

Command

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg

Why?

Docker digitally signs its packages. Ubuntu uses Docker's GPG key to verify that:

The package really came from Docker

The package has not been modified

Docker Package
      ↓
Signed by Docker
      ↓
Ubuntu checks signature
      ↓
Docker GPG Key
      ↓
Trusted Package ✅

Step 16: Add Docker Official Repository

Command

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

Then refresh the package index:

sudo apt update

Why?

Adding Docker's official repository allows Ubuntu to download Docker Engine packages directly from Docker's repository.

Step 17: Install Docker Engine

Command

sudo apt install docker-ce docker-ce-cli containerd.io -y

Package Explanation

docker-ce → Docker Community Edition Engine

docker-ce-cli → Docker command-line interface

containerd.io → container runtime

Verify

docker --version

Step 18: Start Docker Service

Command

sudo systemctl start docker

Why?

Starts the Docker service immediately.

Step 19: Enable Docker at Boot

Command

sudo systemctl enable docker

Why?

Automatically starts Docker whenever the Linux server reboots.

Step 20: Check Docker Service Status

Command

sudo systemctl status docker

Expected result:

Active: active (running)

This confirms that the Docker daemon is running.

Step 21: Add Ubuntu User to Docker Group

Command

sudo usermod -aG docker $USER

Why?

This adds the current Ubuntu user to the docker group so Docker commands can be run without sudo.

Step 22: Apply Docker Group Permission

Command

newgrp docker

Why?

The group change may not be active in the current terminal session. newgrp docker applies the Docker group membership immediately.

Verify:

groups

Step 23: Test Docker

Command

docker run hello-world

What happens?

Docker:

Checks whether the hello-world image exists locally

Downloads the image if necessary

Creates a container

Runs the container

Displays a success message

Exits

Expected output:

Hello from Docker!

This message shows that your installation appears to be working correctly.



Step 24: Final DevOps Tool Verification

Commands

git --version
java --version
mvn --version
docker --version

These commands verify that Git, Java, Maven, and Docker are installed successfully.



🐛 Errors and Troubleshooting

Error 1: SSH Private Key Permission Error

While connecting from Windows, SSH displayed an error similar to:

WARNING: UNPROTECTED PRIVATE KEY FILE!
Permissions for the private key are too open.

Cause

The .pem private key had permissions that were too open.

Fix

The Windows permissions on the private key were restricted so unauthorized users or groups could not access it. After fixing the permissions, the SSH connection worked successfully.

Error 2: Docker Permission Denied

Initially:

docker run hello-world

returned a Docker socket permission error.

Cause

The Ubuntu user did not yet have active Docker group permissions.

Fix

sudo usermod -aG docker $USER
newgrp docker

Then:

docker run hello-world

worked successfully without sudo.

📋 Complete Command Reference

# Update Ubuntu package index
sudo apt update

# Upgrade installed packages
sudo apt upgrade -y

# Install Git
sudo apt install git -y
git --version

# Install Java 17
sudo apt install openjdk-17-jdk -y
java --version

# Install Maven
sudo apt install maven -y
mvn --version

# Install Docker prerequisites
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

# Add Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg

# Add Docker repository
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Refresh package repository
sudo apt update

# Install Docker Engine
sudo apt install docker-ce docker-ce-cli containerd.io -y

# Verify Docker
docker --version

# Start Docker
sudo systemctl start docker

# Enable Docker after reboot
sudo systemctl enable docker

# Check Docker service
sudo systemctl status docker

# Add current user to Docker group
sudo usermod -aG docker $USER

# Apply new group membership
newgrp docker

# Check groups
groups

# Test Docker
docker run hello-world

# Final verification
git --version
java --version
mvn --version
docker --version

🌍 Real-World Scenario

A developer joins a team and needs a Linux environment for building and deploying Java applications with Docker.

The DevOps setup process is:

Launch an Ubuntu cloud server

Connect securely using SSH

Update the operating system

Install Git

Install Java

Install Maven

Install Docker

Configure Docker permissions

Verify all tools

Deliver the server ready for development and future CI/CD work

💡 What I Learned

Through this project, I learned:

How to launch an AWS EC2 instance

How to configure an Ubuntu Linux server

How to connect to a remote server using SSH

How Linux package management works

How to install Git, Java, and Maven

How Docker package verification works

How to install Docker Engine

How to manage services using systemctl

How Linux groups affect Docker permissions

How to troubleshoot SSH and Docker permission errors

How to verify a complete DevOps server environment

✅ Project Outcome

Successfully created and configured an Ubuntu Linux server on AWS EC2.

AWS EC2            ✅
Ubuntu Linux       ✅
SSH                ✅
Git                ✅
Java 17            ✅
Apache Maven       ✅
Docker Engine      ✅
Docker Service     ✅
Docker Permissions ✅
Docker Container   ✅

The server is now ready for future DevOps projects involving:

Git and GitHub workflows

Maven build automation

Jenkins CI/CD

Docker image creation

Kubernetes deployment

Ansible automation

Monitoring

Cloud automation

📸 Project Screenshots

01-select-ubuntu-ami.png

02-select-instance-type-t3-micro.png

03-create-key-pair.png

04-configure-security-group.png

05-configure-ebs-storage.png

06-instance-running.png

07-connect-ec2-ssh-client.png

08-ssh-connected-to-ubuntu.png

09-docker-hello-world.png

10-verify-all-tools.png

🔗 Project Links

GitHub Repository: linux-server-setup

LinkedIn: Dhananjay Narwade

👨‍💻 Author

Dhananjay Narwade

GitHub: Dhananjaynarwade

LinkedIn: Dhananjay Narwade