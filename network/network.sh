#!/bin/bash
# Automation script for CloudFormation templates. 
#
# Parameters
#   $1: Execution mode. Valid values: create-stack, update-stack, delete-stack
#
# Usage examples:
#   ./network.sh create-stack 
#   ./network.sh update-stack
#   ./networkn.sh delete-stack
#

# Validate parameters
if [[ $1 != "create-stack" && $1 != "update-stack" && $1 != "delete-stack" ]]; then
    echo "ERROR: Incorrect execution mode. Valid values: create-stack, update-stack, delete-stack." >&2
    exit 1
fi

# Execute CloudFormation CLI
if [ $1 == "create-stack" ]
then
    aws cloudformation $1 --stack-name networksstack \
        --template-body file://network.yml   \
        --parameters file://network-parameters.json  \
        --region="us-east-1"
fi
if [ $1 == "update-stack" ]
then
    aws cloudformation $1 --stack-name networksstack \
        --template-body file://network.yml   \
        --parameters file://network-parameters.json  \
        --region="us-east-1"
fi
if [ $1 == "delete-stack" ]
then
    aws cloudformation $1 --stack-name networksstack \
        --region="us-east-1"
fi