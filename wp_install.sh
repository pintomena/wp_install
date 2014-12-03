#!/bin/bash

# Install WordPress from scratch with wp-cli
#
# Pedro Pinto  http://bitado.com



# Data base vars
db_name='db_name'
db_user='db_usr'
db_pass='db_pass'
db_prefix='jks_'

# WordPress vars
wp_locale='es_ES'
wp_url='example.com'
wp_title='Mi testing site'
wp_admin_name='wp_admin'
wp_admin_password='wp_pass'
wp_admin_email='wp_admin@example.com'

# Download latest WordPress.
echo 'Downloading latest WordPress'
wp core download


# Create wp-config.php.
echo 'Creating wp-config.php file'
wp core config \
  --dbname=${db_name} \
  --dbuser=${db_user} \
  --dbpass=${db_pass} \
  --dbprefix=${db_prefix} \
  --locale=${wp_locale}

# Install WordPress
echo "Installing WordPress"
wp core install \
  --url=${wp_url} \
  --title="${wp_title}" \
  --admin_name=${wp_admin_name} \
  --admin_password=${wp_admin_password} \
  --admin_email=${wp_admin_email}

# Permalink config
echo "Permalink config"
wp rewrite structure '/%postname%/'
wp rewrite flush

# Cleaning WordPress
echo "Cleaning WordPress"
wp plugin delete hello
wp post delete 1

# Install plugins
echo "Installing WordPress"
wp plugin install google-sitemap-generator wp-super-cache contact-form-7 cookie-control --activate

