# Bring up mattermost
In the shell.sh file, change the AWS_PROFILE=<yourAWSprofile>
In the ansible.cfg file in ansible-ec2 folder, change the path to the place where you stored your ssh key.
I used ansible-vault to encrypt the vars.yml in the ansible-ec2 folder so you would need to enter Hellocat123 as passworld
run the shell.sh

# Destroy mattermost instance 
In the shell.sh file, line 21
replace: terraform plan -var "vpc_ID=$vpcid" -var "aws-ami=$amiid" -var "keyname=$keypair" -out tfplan
with: terraform plan -destroy -var "vpc_ID=$vpcid" -var "aws-ami=$amiid" -var "keyname=$keypair" -out tfplan
run the shell.sh