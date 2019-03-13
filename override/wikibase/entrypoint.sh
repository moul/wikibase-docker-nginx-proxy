#!/bin/sh

cat >>/var/www/html/.htaccess <<EOF
AuthUserFile /var/www/html/.htpasswd
AuthName "Please Log In"
AuthType Basic
require valid-user
Order allow,deny
#Allow from x.x.x.x # whitelist an ip address
satisfy any
EOF

ln -sf /override/.htpasswd /var/www/html/.htpasswd
ln -sf /override/LocalSettings.php /var/www/html/LocalSettings.php

exec /entrypoint.sh
