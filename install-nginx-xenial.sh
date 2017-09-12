#!/bin/bash

# Test ROOT
if [[ "$USER" != 'root' ]]; then
	echo "Sorry, you need to run this as root"
	exit
fi

# Clear Terminal
reset

# Nginx-Pagespeed by RydhoMS Banner
echo "                               "
echo "##  ###        #               "
echo " ##  #                         "
echo " ### #   #### ##  #####  ## ## "
echo " # ###  #  #   #   #  #   ###  "
echo " #  ##  ####   #   #  #   ###  "
echo "###  #  ##### ### ##  ## ## ## "
echo "        #   #                  "
echo "        ####                   "
echo "                                                 "
echo "####                   ###                   ##  "
echo " #  #                 #  #                    #  "
echo " #  # ###   ####  ##  ###  ####   ##   ##   ###  "
echo " ###  ###  #  #  ####   ##  #  # #### #### #  #  "
echo " #    # #  ####  #    #  #  #  # #    #    #  #  "
echo "###   ## # #####  ### ###   ###   ###  ###  #### "
echo "           #   #            #                    "
echo "           ####            ###                   "

# Nginx Version Input
echo "Please Enter Nginx Version"
echo "For Latest Nginx Version, Visit http://nginx.org/en/download.html"
echo "Please be careful when entering nginx version. Mistakes can make the script can not working properly!"
read -p "Nginx Version [e.g., 1.11.5]: " NGINX_VER

if [ -n "$NGINX_VER" ]; then
    echo "Nginx Version $NGINX_VER entered!"
else
    echo "Please Enter Nginx Version!"
    exit 1
fi

# Clear Terminal
reset

# Nginx-Pagespeed by RydhoMS Banner
echo "                               "
echo "##  ###        #               "
echo " ##  #                         "
echo " ### #   #### ##  #####  ## ## "
echo " # ###  #  #   #   #  #   ###  "
echo " #  ##  ####   #   #  #   ###  "
echo "###  #  ##### ### ##  ## ## ## "
echo "        #   #                  "
echo "        ####                   "
echo "                                                 "
echo "####                   ###                   ##  "
echo " #  #                 #  #                    #  "
echo " #  # ###   ####  ##  ###  ####   ##   ##   ###  "
echo " ###  ###  #  #  ####   ##  #  # #### #### #  #  "
echo " #    # #  ####  #    #  #  #  # #    #    #  #  "
echo "###   ## # #####  ### ###   ###   ###  ###  #### "
echo "           #   #            #                    "
echo "           ####            ###                   "

# Google PageSpeed Version Input
echo "Please Enter Pagespeed Version"
echo "For Latest Pagespeed Version, Visit https://github.com/pagespeed/ngx_pagespeed/releases/"
echo "Please be careful when entering pagespeed version. Mistakes can make the script can not working properly!"
read -p "Pagespeed Version [e.g., 1.11.33.4]: " NPS_VERSION

if [ -n "$NPS_VERSION" ]; then
    echo "Pagespeed Version $NPS_VERSION entered!"
else
    echo "Please Enter Pagespeed Version!"
    exit 1
fi

# Test your NPS Version
if [[ "$NPS_VERSION" != 'NULL' ]]; then
  echo "NPS Version OK"
else
  echo "Sorry, you need to edit NPS and Nginx version"
exit
fi

# Test your Nginx Version
if [[ "$NGINX_VER" != 'NULL' ]]; then
  echo "Nginx Version OK"
else
  echo "Sorry, you need to edit Nginx version"
exit
fi

# Clear Terminal
reset

# Nginx-Pagespeed by RydhoMS Banner
echo "                               "
echo "##  ###        #               "
echo " ##  #                         "
echo " ### #   #### ##  #####  ## ## "
echo " # ###  #  #   #   #  #   ###  "
echo " #  ##  ####   #   #  #   ###  "
echo "###  #  ##### ### ##  ## ## ## "
echo "        #   #                  "
echo "        ####                   "
echo "                                                 "
echo "####                   ###                   ##  "
echo " #  #                 #  #                    #  "
echo " #  # ###   ####  ##  ###  ####   ##   ##   ###  "
echo " ###  ###  #  #  ####   ##  #  # #### #### #  #  "
echo " #    # #  ####  #    #  #  #  # #    #    #  #  "
echo "###   ## # #####  ### ###   ###   ###  ###  #### "
echo "           #   #            #                    "
echo "           ####            ###                   "

echo Everything looks fine
echo Installation takes about 10-15 minutes

# Update Upgrade OS
apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y

# Install nano as text editor
apt-get install nano

# Install dependency packages
apt-get install build-essential zlib1g-dev libpcre3 libpcre3-dev unzip make curl libc6 libpcrecpp0v5 libssl1.0.0 libssl-dev zlib1g lsb-base openssl libssl-dev  libgeoip1 libgeoip-dev  google-perftools libgoogle-perftools-dev libperl-dev  libgd2-xpm-dev libatomic-ops-dev libxml2-dev libxslt1-dev python-dev -y

# Get Nginx Signing-Key
# curl http://nginx.org/keys/nginx_signing.key | apt-key add -

# Get PPA signkey
# sudo add-apt-repository ppa:0k53d-karl-f830m/openssl -y

# Add Nginx source to Repo
# echo -e "deb http://nginx.org/packages/mainline/ubuntu/ `lsb_release -cs` nginx\ndeb-src http://nginx.org/packages/mainline/ubuntu/ `lsb_release -cs` nginx" > /etc/apt/sources.list.d/nginx.list

# Add OpenSSL source by  to Repo
# echo -e "deb http://ppa.launchpad.net/0k53d-karl-f830m/openssl/ubuntu `lsb_release -cs` main\ndeb-src http://ppa.launchpad.net/0k53d-karl-f830m/openssl/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/openssl.list

# Update Upgrade OS
apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y

# Install Nginx from apt-source
# apt-get install nginx

# Update Upgrade
apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y

# Add user nginx
useradd -s /sbin/nologin nginx

# Change directory to ~ root
cd

# Remove Nginx File and Folder If Exist
rm -r v${NPS_VERSION}.zip
rm -r ngx_pagespeed-${NPS_VERSION}
rm -r nginx-${NGINX_VER}.tar.gz
rm -r nginx-${NGINX_VER}

# Get Latest Pagespeed Stable Version Module
cd
wget https://github.com/pagespeed/ngx_pagespeed/archive/v${NPS_VERSION}.zip
unzip v${NPS_VERSION}.zip
cd ngx_pagespeed-${NPS_VERSION}/
NPS_RELEASE_NUMBER=${NPS_VERSION/beta/}
NPS_RELEASE_NUMBER=${NPS_VERSION/stable/}
psol_url=https://dl.google.com/dl/page-speed/psol/${NPS_RELEASE_NUMBER}.tar.gz
[ -e scripts/format_binary_url.sh ] && psol_url=$(scripts/format_binary_url.sh PSOL_BINARY_URL)
wget ${psol_url}
tar -xzvf $(basename ${psol_url})  # extracts to psol/

# Get Latest Nginx
cd
wget http://nginx.org/download/nginx-${NGINX_VER}.tar.gz

# Untar Nginx Source Code
tar -xvzf nginx-${NGINX_VER}.tar.gz

# Change Directory
cd nginx-${NGINX_VER}

# Clear Terminal
reset

# Nginx-Pagespeed by RydhoMS Banner
echo "                               "
echo "##  ###        #               "
echo " ##  #                         "
echo " ### #   #### ##  #####  ## ## "
echo " # ###  #  #   #   #  #   ###  "
echo " #  ##  ####   #   #  #   ###  "
echo "###  #  ##### ### ##  ## ## ## "
echo "        #   #                  "
echo "        ####                   "
echo "                                                 "
echo "####                   ###                   ##  "
echo " #  #                 #  #                    #  "
echo " #  # ###   ####  ##  ###  ####   ##   ##   ###  "
echo " ###  ###  #  #  ####   ##  #  # #### #### #  #  "
echo " #    # #  ####  #    #  #  #  # #    #    #  #  "
echo "###   ## # #####  ### ###   ###   ###  ###  #### "
echo "           #   #            #                    "
echo "           ####            ###                   "
echo

# Edit Server Signature Option
echo Do you want edit Nginx Server Signature?
echo Read ReadMe before edited Server Signature!
echo "   1) Yes. I want edit my server Signature!"
echo "   2) No thanks."
read -p "Select an option [1-2]: " option
case $option in

1)
# Edit your nginx signature
# Edit static char ngx_http_server_string[] = "Server: nginx" CRLF; to static char ngx_http_server_string[] = "Server: Your Server Signatur" CRLF;
# #define NGINX_VER          "nginx/" NGINX_VERSION to #define NGINX_VER          "Your Server Signature/" NGINX_VERSION
nano src/http/ngx_http_header_filter_module.c
nano src/core/nginx.h
;;
2)
# Start Compiling Nginx
echo "Ok. Let's Compiling Nginx!"
;;
esac

# Compiling from source code
./configure --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --modules-path=/usr/lib/nginx/modules --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx/proxy_temp --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp --http-scgi-temp-path=/var/cache/nginx/scgi_temp --user=nginx --group=nginx --with-http_ssl_module --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_stub_status_module --with-http_auth_request_module --with-http_xslt_module=dynamic --with-http_image_filter_module=dynamic --with-http_geoip_module=dynamic --with-http_perl_module=dynamic --with-threads --with-stream --with-stream_ssl_module --with-http_slice_module --with-mail --with-mail_ssl_module --with-file-aio --with-ipv6 --with-http_v2_module --add-module=$HOME/ngx_pagespeed-${NPS_VERSION} ${PS_NGX_EXTRA_FLAGS} --with-cc-opt='-g -O2 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2' --with-ld-opt='-Wl,-Bsymbolic-functions -Wl,-z,relro -Wl,--as-needed'
# ./configure --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --modules-path=/usr/lib/nginx/modules --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx/proxy_temp --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp --http-scgi-temp-path=/var/cache/nginx/scgi_temp --user=nginx --group=nginx --with-http_ssl_module --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_stub_status_module --with-http_auth_request_module --with-http_xslt_module=dynamic --with-http_image_filter_module=dynamic --with-http_geoip_module=dynamic --with-http_perl_module=dynamic --with-threads --with-stream --with-stream_ssl_module --with-http_slice_module --with-mail --with-mail_ssl_module --with-file-aio --with-ipv6 --with-http_v2_module --with-cc-opt='-g -O2 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2' --with-ld-opt='-Wl,-Bsymbolic-functions -Wl,-z,relro -Wl,--as-needed'
make
make install

# Config Your Pagespeed
mkdir /var/ngx_pagespeed_cache
chown nginx:nginx /var/ngx_pagespeed_cache

# Get Nginx_Unit File
cd /lib/systemd/system/
wget https://raw.githubusercontent.com/rydhoms/Nginx-Pagespeed-Script/master/nginx.service
chmod +x /lib/systemd/system/nginx.service
sudo systemctl start nginx.service && sudo systemctl enable nginx.service

Nginx_Daemon="/etc/init.d/nginx"
if [ -f "$Nginx_Daemon" ]
then
	echo "$Nginx_Daemon found."
else
	echo "Nginx Daemon not found."
	echo "Install Nginx Daemon . . ."
# Get Nginx Daemon File
cd /etc/init.d/
wget https://raw.githubusercontent.com/rydhoms/Nginx-Pagespeed-Script/master/nginx
chmod +x /etc/init.d/nginx
# Back to ~
cd
fi

# Create Folder Cache
mkdir -p /var/cache/nginx/client_temp

# Start-Restart-Reload Nginx
/etc/init.d/nginx start
/etc/init.d/nginx restart

# Remove Nginx and Google Pagespeed Installation Files and Folders Include nginx-install.sh
echo Clean Up Installation Files and Folders
cd
rm -r v${NPS_VERSION}.zip
rm -r ngx_pagespeed-${NPS_VERSION}
rm -r nginx-${NGINX_VER}.tar.gz
rm -r nginx-${NGINX_VER}
rm -r install-nginx-xenial.sh

# Completed!!
echo Installation Completed!!
