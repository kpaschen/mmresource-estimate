Install the amazon.aws ansible plugin

```
ansible-galaxy collection install amazon.aws
```

Edit the ansible.cfg file and give it the path to your private key .pem file

Fill in the vault template and encrypt it using ansible-vault.

```
ansible-vault encrypt --ask-vault-pass --output vault.yml vault_template.yml
```

Remember to remove this from the template before you check it into git.

Then run the playbooks like this:

```
AWS_PROFILE=<your profile> ansible-playbook create_instances.yml

AWS_PROFILE=<your_profile> ansible-playbook -i inventory_aws_ec2.yml update-instances.yml --ask-vault-pass --skip-tags=run_loadtest

AWS_PROFILE=<your profile> ansible-playbook -i inventory_aws_ec2.yml run-loadtest.yml --ask-vault-pass
```
