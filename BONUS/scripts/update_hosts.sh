#!/bin/bash

# This is a script to update the hosts with the new Docker image

# I'm gonna use this to not hard code the version variable and this will fetch the version on dockerhub to make my life easier.

NEW_IMAGE_VERSION=$(curl -s "https://registry.hub.docker.com/v2/repositories/ggreen96777/ci-project-green/tags/" | jq -r '.results[].name' | grep -v latest | sort -V | tail -n 1)

# This here updates the task definition with the new docker image version

aws ecs register-task-definition \ 
  --family myTaskDefinition \
  --container-definitions "[{\"name\":\"myContainer\",\"image\":\"ggreen96777/ci-project-green:$NEW_IMAGE_VERSION\",\"memory\":256,\"portMappings\":[{\"containerPort\":80,\"hostPort\":80}],\"essential\":true}]"

# This is to update the ECS service, forcing a new development with updated task definitions.

aws ecs update-service \ 
  --cluster myEcsCluster \ 
  --service myEcsService \ 
  --force-new-deployment
