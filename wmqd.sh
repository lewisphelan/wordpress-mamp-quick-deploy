#!/bin/sh
cd /Applications/MAMP/htdocs
printf "Name your project:"
read PROJECTNAME
wget https://wordpress.org/latest.zip -P $PROJECTNAME
cd $PROJECTNAME
unzip latest.zip
rm -r latest.zip
cd wordpress
mv * ..
cd ..
rm -r wordpress
printf "mySQL Username:"
read MYSQLUSER
if [ "$MYSQLUSER" = "" ]; then
		set MYSQLUSER = "root"
	fi
printf "mySQL Password:"
read MYSQLPASS
printf "Name your database:"
read DATABASENAME
echo "CREATE DATABASE $DATABASENAME; GRANT ALL ON $DATABASENAME.* TO '$MYSQLUSER'@'localhost';" | ../../Library/bin/mysql -u $MYSQLUSER -p $MYSQLPASS


if [ -f ./wp-config.php ]
then
open http://localhost:8888//wp-admin/install.php
else
cp -n ./wp-config-sample.php ./wp-config.php
SECRETKEYS=$(curl -L https://api.wordpress.org/secret-key/1.1/salt/)
EXISTINGKEYS='put your unique phrase here'
printf '%s\n' "g/$EXISTINGKEYS/d" a "$SECRETKEYS" . w | ed -s wp-config.php
DBUSER=$"username_here"
DBPASS=$"password_here"
DBNAME=$"database_name_here"
sed -i '' -e "s/${DBUSER}/${MYSQLUSER}/g" wp-config.php
sed -i '' -e "s/${DBPASS}/${MYSQLPWD}/g" wp-config.php
sed -i '' -e "s/${DBNAME}/${NEWDB}/g" wp-config.php
open http://localhost:8888/wp-admin/install.php
fi
