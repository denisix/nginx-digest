FROM nginx

RUN apt-get update \
	&& apt-get install --no-install-recommends -y git gcc make libpcre3-dev libssl-dev libxml2-dev libxslt-dev libgd-dev libgeoip-dev wget apache2-utils ca-certificates \
	&& update-ca-certificates \
	&& git clone https://github.com/atomx/nginx-http-auth-digest \
	&& wget `nginx -v 2>&1|awk -F\/ '{print "https://nginx.org/download/nginx-"$2".tar.gz"}'` \
	&& tar zxvf nginx-*.tar.gz \
	&& ( cd nginx-* && nginx -V 2>&1|awk '/configure/{ print "./configure " substr($0,22) " --add-module=../nginx-http-auth-digest/ --sbin-path=/usr/sbin/"}' | sh && make -j4 && make install ) \
	&& apt-get remove -y gcc make libpcre3-dev libssl-dev libxml2-dev libxslt-dev libgd-dev libgeoip-dev wget apache2-utils \
	&& apt-get autoremove -y \
	&& apt-get clean all \
	&& rm -rf /var/lib/apt/lists/* \
	&& nginx -V
