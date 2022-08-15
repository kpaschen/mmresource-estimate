# Assuming you still have your RDS instance on your AWS account, here are the codes to deploy to EC2 instances. 
# Step 1: Run Terraform.
You need to check the provider first.
First of all you need you go to the provider.tf to change the path to the credentials file and the profile (i think it doesnt work with (>4.0 version) only works with version = "3.7")

Then, you need to make a modification to "vpc ids", "ami type"... in the variable file.

# # Step 2 update configurations using Ansible
You will see the output of the instance's public-ip after the instance has finished running.
copy it and paste it in the inventory.yml file
mattermost:
  hosts:
    <ec2-ip>:
      ansible_user: ubuntu

Additionally, you must modify the ansible.cfg file's private ssh key path.

Find the line that says "- name: set up the database driver in the file /opt/mattermost/config/config.json" in the mattermost-ansible.yml file. Replace the "postgres:/<mmuser:mmuser-password>@<host-name-or-IP>:5432/<databasename>?sslmode=disable&connect timeout=10" with the equivalent information for your RDS instance.