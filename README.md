![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/denisix/nginx-digest?style=flat-square)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/denisix/nginx-digest?style=flat-square)
![Docker Pulls](https://img.shields.io/docker/pulls/denisix/nginx-digest?style=flat-square)
![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/denisix/nginx-digest?style=flat-square)

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
 - this image uses [nginx-http-auth-digest](https://github.com/atomx/nginx-http-auth-digest) module
