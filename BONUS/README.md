# CloudFormation 

## Implementation Explanation

The CloudFormation template deploys a basic AWS infrastructure. This infrastructure consists of a Virtual Private Cloud, a proxy server instance, and a web server instance. It also installs only necessary software, (nginx, python3, git) and has a method of updating all hosts when a new Docker image is pushed on a DockerHub repository. 

## How does it Work?

- The template has parameters that are defined such as the EC2 Key Pair name
- The template utilizes mappings and selects the AMI for instances based on the AWS region.
- VPCs, subnets, internet gateway, security groups, and instances are appropriately configured.

- Each instance's `UserData` section contains shell commands to install the software that is required.
- Both the proxy server `ProxyInstance` and the web server `WebServ1Instance` both installs `git`, `python3`, and `nginx`. while the proxy server installs `haproxy`
- The scripts for installation are fetched from a repository (the scripts folder). This will keep things organized and make the project maintainable.

- The template also updates all of the hosts when a new Docker image is pushed onto DockerHub
- The script is also under the `UserData` section of each instance. This pulls the latest image and updates the running container.
- The execution of the script triggers during instance initialization, making sure the hosts are up to date on the docker images that are the latest.

## How to Recreate

- Make sure to have access to an AWS account that has permissions for the CloudFormation stack creation. (I personally failed this step)
- Have a DockerHub Repository containing the Docker image that is usable by the instances

- Go to CloudFormation
- Create a new stack using the CloudFormation template
- Fill out the necessary parameters
- Review stack creation

- Adjust the configurations to meet your needs, you may want another necessary software that is required.
- Make sure that software is installed and configure by sshing to the instance.
- Do tests to make sure functional requirements are met.

- Change the CloudFormation template that may need more requirements or software dependencies.

## Diagram

![This is the PNG of the diagram](https://github.com/WSU-kduncan/s24cicd-ggreen96777/blob/main/BONUS/cloudFormationTemplateDiagram.png)
