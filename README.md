# Letsencrypt Automation for Godday

0. Install kdig
```
sudo apt install knot-dnsutils
```

1. Create GoDaddy API key/secret here
  - https://developer.godaddy.com

2. Copy & update values for .env.secrets with api key/secret
```
cp example.env.secrets .env.secrets
nano .env.secrets
```

3. Update .env variables if needed for ote

5. Install certbot if you haven't already 
  - https://eff-certbot.readthedocs.io/en/stable/install.html

4. Run but avoid using wildcards

```
. .env.secrets
./get-cert "host1.example.org" myemail@gmail.com
./get-cert "*.example.org" myemail@gmail.com
```

If all runs well  your cert if available in config/live/<your domain>/



# Windows DNS Using ansible  
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
- https://chariotsolutions.com/blog/post/automating-lets-encrypt-certificate-renewal-using-dns-challenge-type/

## Useful Options
```
  -m email
```
 

curl --http2 -H "accept: application/dns-json" "https://1.1.1.1/dns-query?name=cloudflare.com" --next --http2 -H "accept: application/dns-json" "https://1.1.1.1/dns-query?name=example.com"

# Explore Other Options
- https://github.com/miigotu/certbot-dns-godaddy
