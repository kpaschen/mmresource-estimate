#!/bin/sh

set -euxo pipefail

PROFILE=${AWS_PROFILE:-mmkathriniam}

vpcid=$(aws --profile=$PROFILE ec2 describe-vpcs --filters "Name=is-default,Values=true" |  jq -r ".Vpcs | .[] | .VpcId")

echo -n "your default vpc id is $vpcid"

cd terraform
terraform plan -var "vpcID=$vpcid" -out tfplan

