#!/bin/bash
# Automation script for CloudFormation templates. 
#
# Parameters
#   $1: Execution mode. Valid values: create-stack, update-stack, delete-stack
#
# Usage examples:
#   ./udagram.sh create-stack 
#   ./udagram.sh update-stack
#   ./udagram.sh delete-stack
#

# Validate parameters
if [[ $1 != "create-stack" && $1 != "update-stack" && $1 != "delete-stack" ]]; then
    echo "ERROR: Incorrect execution mode. Valid values: create-stack, update-stack, delete-stack." >&2
    exit 1
fi

# Execute CloudFormation CLI
if [ $1 == "create-stack" ]
then
    aws cloudformation $1 --stack-name udagramstack \
        --template-body file://udagram.yml   \
        --parameters file://udagram-parameters.json  \
        --capabilities "CAPABILITY_NAMED_IAM"  \
        --region="us-east-1"
fi
if [ $1 == "update-stack" ]
then
    aws cloudformation $1 --stack-name udagramstack \
        --template-body file://udagram.yml   \
        --parameters file://udagram-parameters.json  \
        --capabilities "CAPABILITY_NAMED_IAM"  \
        --region="us-east-1"
fi
if [ $1 == "delete-stack" ]
then
    aws cloudformation $1 --stack-name udagramstack \
        --region="us-east-1"
fi