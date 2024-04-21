# Continuous Deployment (CD) Project Overview.

The goal of this project is to automate the deployment process. This will utilize Github Actions and DockerHub. Semantic versioning will be used to tag docker images appropriately.

## The Tools Being Used.
  - Semantic Versioning
  - GitHub Actions
  - DockerHub

## How to Generate a Tag in Git / GitHub

For generating a tag in Github, use `git tag -a v1.0.0 -m "Version Message Here 1.0.0"`. The version numbers can be different to your choosing

After generating that tag, don't forget to push it with `git push origin v1.0.0`. Make sure that the version number matches the tag that you created.

## Behavior of the GitHub Workflow

When the tag gets pushed towards the repository, the workflow triggers, building the Docker image and pushing it towards DockerHub with the tags 'latest' and the version tag that you just created.

## DockerHub Repository

[Link To DockerHub Repository](https://hub.docker.com/repository/docker/ggreen96777/ci-project-green/general)

## Docker Installation

A Tutorial on how to install docker on a EC2 instance.

1. I updated the instance just in case with `sudo apt-get update`
2. I installed any dependencies that docker may have needed with
   ```
   sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
   ```
3. I added the Docker GPG key:
    ```
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    ```
4. I then added the docker repository.
   ```
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu   $(lsb_release -cs) stable"
    ```
4.5 I did `sudo apt-get update` again just in case.

5. Finally, to install docker, I did `sudo apt-get install docker-ce`

## Container Restart Script

### Description

The container script is a way for Docker to automatically restart just in case the docker stops unexpectedly or crashes.

### Justification

The script makes sure that the services are available even when the containers have issues.

### Location on Instance

The container was put in a folder called deployment, and I put it there because there are other scripts/programs that will be utilizing it.

# Webhook Listener Setup

## Installing adnanh's webhook

I did these to install the webhook.

1. Download the latest release from the webhook GitHub Repository. (I used this wget command)
   ```
   wget https://github.com/adnanh/webhook/releases/download/2.8.1/webhook-linux-amd64.tar.gz
   ```
2. Extract the downloaded archive. `tar -xvzf webhook-linux-amd64.tar.gz`
3. I then moved the webhook into the desired folder, (the deployment folder to make my life easier.) `mv`

## Webhook Task Definition File

###The Description

The task definition file specifies actions that need to be taken when a webhook event is received.

### Location on Instance

I put the webhook task file in a directory where it can be accessed by other things it may need. (The container bash script). Therefore, it goes in the deployment folder.

## Starting the Webhook

For starting the Webhook, it worked best for me when I used cd into the deployment directory and typed `webhook -hooks hook.json -verbose` into the terminal.

I used verbose here to discover any problems early.

### Creating a Webhook Service File

For the service file, I broke it down into unit, service, and install

### Reloading Service

After I modified my webhook service file to work, I typed `sudo system ctl daemon-reload` and `sudo systemctl restart webhook` right after.
To enable the autostart on boot, I use the command `sudo systemctl enable webhook` and then i reloaded and restarts using the previous commands.

## Configuring Github/Dockerhub to Message the Listener

1. I first went into my repository on GitHub.
2. Then I went towards the settings and the Webhooks or Integration section.
3. Then I clicked on "Add a New Webhook" and pasted this url `http://3.217.189.102:9000` which was the EIP of the instance and the port 9000. I want the events to be push only so I clicked on that.


