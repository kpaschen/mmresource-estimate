#!/bin/sh

set -eux

PROFILE=${AWS_PROFILE=mmuser@quangcaoiam}

vpcid=$(aws --profile=$PROFILE ec2 describe-vpcs --filters "Name=is-default,Values=true" |  jq -r ".Vpcs | .[] | .VpcId")

amiid=$(aws --profile=$PROFILE ec2 describe-images --filters "Name=tag:Type,Values=Mattermost-AMI" |  jq -r ".Images | .[] | .ImageId")

keypair=$(aws --profile=$PROFILE ec2 describe-key-pairs --filters "Name=tag:Type,Values=Mattermost-key" |  jq -r ".KeyPairs | .[] | .KeyName")

echo  "your default vpc id is $vpcid"

echo  "your freetier ami id is $amiid"

echo  "your keypair is $keypair"

cd terra-ec2

terraform plan -var "vpc_ID=$vpcid" -var "aws-ami=$amiid" -var "keyname=$keypair" -out tfplan
#use terraform plan -destroy to destroy the instance

terraform apply "tfplan"

mm_ip=$(terraform output -raw ec2_public_ip)
#print out the instance public ip

if [ $mm_ip ]; then
#if $mm_ip is valid then exicute the other commands

cd ../ansible-ec2

echo "adding $mm_ip address to inventory.yml"
## if i have multi hosts then maybe i can learn how to use sid or awk to replace the value.

cat <<EOF > inventory.yml
mmserver:
 hosts:
    $mm_ip:
        ansible_user: ubuntu
EOF

#ansible-vault encrypt vars.yml
# use the ansible valt to encrypt the vars.yml file because i put secrets data in it.
# if i want to update the instane i will just comment the command out

ansible-playbook --ask-vault-pass main.yml

else

echo "You have no instance"

fi
