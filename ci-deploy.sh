#!/usr/bin/env bash

#
# Bail out if something bad happens
#

set -e
set -o pipefail

#
# Image
#

$(aws ecr get-login)
docker build -t couchdb .
docker tag couchdb:latest 673249040706.dkr.ecr.eu-west-1.amazonaws.com/couchdb:latest
docker push 673249040706.dkr.ecr.eu-west-1.amazonaws.com/couchdb:latest

# TODO - Combine with Athena

#
# Task definition
#

aws ecs register-task-definition --cli-input-json file://athena-task-definition.json

# Uncomment to get more log info in Travis CI build log
#aws ecs list-task-definition-families
#aws ecs list-task-definitions
#aws ecs describe-task-definition --task-definition athena

#
# Service
#

#
# 1. Try to describe service to get ARN
# 2. If exists -> update
# 3. If not -> create it
#

ARN=$(aws ecs describe-services --cluster Athena --services athena | jq '.services? | .[0]? | .serviceArn?' -r -M)
if [ "$ARN" = "null" ]; then
    aws ecs create-service --cluster Athena --service-name athena --task-definition athena --desired-count 1
else
    aws ecs update-service --cluster Athena --service $ARN --task-definition athena --desired-count 1
fi

# Uncomment to get more log info in Travis CI build log
#aws ecs list-services --cluster Athena
#aws ecs describe-services --cluster Athena --services athena
#aws ec2 describe-instances
