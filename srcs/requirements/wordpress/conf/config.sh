# #!/bin/bash

# #check if wp-config.php exist

# #Download wordpress and all config files
# wget http://wordpress.org/latest.tar.gz
# tar xfz latest.tar.gz
# mv wordpress/* .
# rm -rf latest.tar.gz
# rm -rf wordpress

# sed -e "s/username_here/$SQL_USER/g" wp-config-sample.php
# sed -e "s/password_here/$SQL_PASSWORD/g" wp-config-sample.php
# sed -e "s/localhost/$SQL_HOSTNAME/g" wp-config-sample.php
# sed -e "s/database_name_here/$SQL_DATABASE/g" wp-config-sample.php

# mv wp-config-sample.php wp-config.php