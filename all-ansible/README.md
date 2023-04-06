Install the amazon.aws ansible plugin

```
ansible-galaxy collection install amazon.aws
```

Edit the ansible.cfg file and give it the path to your private key .pem file

Fill in the vault template and encrypt it using ansible-vault.

If you change the mattermost user password, you have to make sure to get it into the database dump file, for example
by running mattermost locally and dumping the postgres file.

```
ansible-vault encrypt --ask-vault-pass --output vault.yml vault_template.yml
```

Remember to remove this from the template before you check it into git.

You can choose whether you want separate instances per purpose (mattermost, db, reverseproxy) or the same by setting the instance_tag variables. Edit vars.yaml and pass the tags on the commandline for the update-instances playbook as shown below.

Then run the playbooks like this:

```
AWS_PROFILE=<your profile> ansible-playbook create-instances.yml

AWS_PROFILE=<your_profile> ansible-playbook -i inventory_aws_ec2.yml update-instances.yml --ask-vault-pass --skip-tags=run_loadtest -e db_instance_tag=tag_mattermost,reverseproxy_instance_tag=tag_mattermost

AWS_PROFILE=<your profile> ansible-playbook -i inventory_aws_ec2.yml run-loadtest.yml --ask-vault-pass
```

Instead of running `run-loadtest` you can run `create-jenkins`. That will create a jenkins instance.

Adding an ec2 cloud to jenkins and launching the loadtest from there:

I haven't made an ansible setup for this because there isn't a good cli or api
for it and I didn't want to put the secret key that it needs into an AMI either.

Login to jenkins at the public IP using port 8080. The username is `mmjenkins`, the password is in the vault.

Click on `Manage Jenkins`, `Configure Clouds`, `Add a new cloud`. Choose ec2.
Fill in:

- name: does not matter. I use mmloadtest
- Credentials: just check the box that says `Use EC2 instance profile`. The jenkins instance runs using the mmjenkins role, which has just the permissions needed
to launch the loadtest instance.
- Select `eu-central-1` from the Region dropdown.
- Add a private key.
	- first, make sure you have a private key. It has to be an RSA key,
	   the Jenkins code does not deal with ed25519.
	- select `Jenkins` from the dropdown (it's the only entry) to get the credentials provider screen.
	- `Kind` must be `SSH Username with private key`
	- choose `System` scope
	- you do not have to set an ID or description but you can
	- username has to be the one for the keypair
	- paste the private key into the text field
	- do not set a passphrase (or if you do and get it to work, let me know what you did!)
	- save, and do not be alarmed when the system claims there is no key. You can now select the key pair you set up from the `EC2 Key Pair's Private key` dropdown.
- Use the `Test connection` button to see if everything is working. If it isn't,
you will need to ssh to the jenkins machine and use `journalctl` to view the jenkins logs.
- add an AMI. The `loadtest ami` in `vars.yaml` will do: `ami-084e7155d4e70881d`.
- Select the instance type, such as `T2Micro`. This is just the instance type that the loadtest runner itself will use, so it does not need to be beefy, but big enough so the loadtest itself runs as fast as it needs to.
- The region should be the one that has your other instances in it, so `eu-central-1` probably.
- use a security group that will provide access to the mattermost instance for running mattermost and monitoring, and to the db instance for monitoring. `kathrin-mm-security-group` will do.
- somewhere in the advanced settings, make sure the ssh client will not ask whether to store the host key.
	
- save, then go back to configuring clouds. you can now 'provision' your new cloud.
- congratulations, you probably have a node now.
