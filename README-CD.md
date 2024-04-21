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

