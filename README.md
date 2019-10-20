# nginx-digest
Dockerfile to create docker image, based on official nginx image + atomx/nginx-http-auth-digest


#### Usage
```bash
docker pull nginx-digest
```

in your nginx.conf or site config use the following construction:
```nginx
 auth_digest_user_file /etc/nginx/.htdigest; # a file created with htdigest
 location /private {
     auth_digest 'this is not for you'; # set the realm for this location block
 }
 ```
 for more details please check the [official documentation](https://github.com/atomx/nginx-http-auth-digest/blob/master/readme.rst#example)

#### Build
```bash
git clone https://github.com/denisix/nginx-digest
docker build -t nginx-digest:latest . 
```
 
#### Credits
 - this images uses [nginx-http-auth-digest](https://github.com/atomx/nginx-http-auth-digest) module
