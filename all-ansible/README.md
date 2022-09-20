Install the amazon.aws ansible plugin

```
ansible-galaxy collection install amazon.aws
```

edit the ansible.cfg file and give it the path to your private key .pem file

fill in the vault template and encrypt it using ansible-vault.

```
ansible-vault encrypt --ask-vault-pass --output vault.yml vault_template.yml
```
