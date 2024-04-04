# CI Project Overview

This repository has the base for a server with a Continuous Integration (CI) setup for testing and deploying. The pipeline is configured to run tests and images from Docker on each push that is on the main branch.

## Purpose

The purpose of this Continuous Integration setup is to make sure the codebase's changes are tested and deployed thoroughly. By automating the testing and deploying process, the code quality is maintained and the development workflow will be streamlined.

## Tools Used

- Docker:
- Github
- nGinx

  # Run Project Locally

  To run the project locally, follow these steps:

  ## Install Docker on Desktop

  1. Type in Google"Docker Desktop"
  2. Create an account for Docker, this will be needed later.
  3. Download Docker per the requirements of your operating system. (Mine is windows so I will be downloading it for Windows.)
  4. Set up Windows for Linux 2 (WSL2) so that it becomes compatible.
  5. Open up Powershell on Windows and run as administrator
  6. Type the command in Powershell to enable the WSL2 feature. `wsl --set-default-version 2`
  7. Open Docker after installment and go to Settings > General
  8. Check the box that is next to "Use the WSL 2-based engine".
  9. Proceed to the terminal of choice. (I used Ubuntu).
 
## Ubuntu Terminal

  1. Clone the repository `git clone https://github.com/WSU-kduncan/s24cicd-ggreen96777`
  2. Navigate into the repository directory `cd s24cicd-ggreen96777`. (Your username will be different)
  3. Make a folder named `website`
  4. Add the contents from a previous website into the website folder.
  5. The command used to do so is `cp -r s24cicd-ggreen96777/website* /website`
  6. Edit the index.html file and personalize the content for easier grading.

## Installing Docker

  1. Type in `sudo apt update` for good measure.
  2. Type in `sudo apt install docker-ce`

## Create a Dockerfile

  1. For the Dockerfile, I inserted into it...
     ```
     FROM nginx:latest
     COPY ./website /usr/share/nginx/html
     ```
  2. Create this dockerfile at the root of the repository.
  3. Cd into the root of the repository and create an image using the docker file.
  4. Do so with this command `sudo docker build -t your-website-image-name .`
  5. After the website image is created, to run it type in this command, `sudo docker run -d -p 8080:80 my-website-image`.
  6. To see the website, type in a browser (I'm using google) `http://localhost:8080`
  7. You should be able to see the website. :)

# DockerHub

## Creating a public repo on Dockerhub.

  1. Search Dockerhub on a browser
  2. Create an account for Dockerhub.
  3. Remember your login information.
  4. Click on the "Create Repository" button.
  5. Provide a name and description for the repository
  6. Select the visibility on "Public". (You can only have one private)
  7. Click on the "Create" button

## How to Authenticate with DocketHub via CLI.

  1. Open a terminal (I used ubuntu)
  2. Run the command:
   ```
   echo "your-dockerhub-password" | docker login --username your-dockerhub-username --password-stdin
   ```
  3. Replace the password and username with your actual password and username.

## What credentials would I recommend providing?

I would recommend using GitHub secrets to store sensitive information like that. This way, the login information is encrypted and is not exposed in your repository. 

## How to push the Container Image to DockerHub without using Github Actions.

  1. Build your docker image locally
  2. Tag that docker image with your Dockerhub username and repository.
  3. Insert this command `docker tag imagename dockerhubusername/repositoryname:latent
  4. Push the tagged image to DockerHub: `docker push dockerhubusername/repositoryname:latest`

## Link to DockerHub Repository

  [Link to DockerHub Repository](https://hub.docker.com/repository/docker/ggreen96777/ci-project-green/general)

## Configuring GitHub Secrets

  GitHub Secrets are a secure way to store sensitive information such as passwords and usernames and are used by the GitHub Actions workflows. Follow these steps to set the secrets.

  1. Go to the GitHub Repository.
  2. Go to "Settings" and to "New repository secret".
  3. Add two secrets. DOCKER_USERNAME should be your username on DockerHub and DOCKER_PASSWORD should be the password that you used. I am not going to type this information.

     The project requires two total secrets: DOCKER_USERNAME and DOCKER_PASSWORD. These secrets are used to authenticate with DockerHub and push the image created to the DockerHub Repository.

The GitHub workflow that is defined in `.github/workflows/docker-build.yml` file automates the building and pushing of the docker image to DockerHub. It should run on every single push to the main branch. 

The variables that need to be changed are the username and password if another person were to want the image to be pushed on their repository. They have different login credentials than you so those credentials will need to be changed.
  
# The Diagram

![Diagram](https://github.com/WSU-kduncan/s24cicd-ggreen96777/blob/main/website/DockerHub_Diagram.png)
