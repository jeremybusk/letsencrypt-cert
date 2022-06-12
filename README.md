# Letsencrypt Automation for Godday

1. Create GoDaddy API key/secret here
  - https://developer.godaddy.com
2. Update .env variables
3. Run ./get-manual-cert.sh

If all runs well  your cert if available here /etc/letsencrypt/live/<my domain>/
  
## Install Ansible

# Pip & venv way
```
python3 -m venv venv
. venv/bin/activate
pip install ansible pywinrm
deactivate
```

Another way
```
apt install python3-pywinrm
python3 -m pip install ansible --user ansible
```

## Dig
```
dig -t TXT _acme-challenge.example.com @8.8.8.8
```

## Ref
- https://eff-certbot.readthedocs.io/en/stable/using.html
- https://eff-certbot.readthedocs.io/en/stable/using.html#configuration-file

## Useful Options
```
  -m email
```
 
