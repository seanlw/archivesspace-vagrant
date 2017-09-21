############
# ArchivesSpace
############

echo "Installing ArchivesSpace"

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

if [ ! -f "$DOWNLOAD_DIR/archivesspace-v$ARCHIVESSPACE_VERSION.zip" ]; then
  echo -n "Downloading ArchivesSpace..."
  wget -q -O "$DOWNLOAD_DIR/archivesspace-v$ARCHIVESSPACE_VERSION.zip" "https://github.com/archivesspace/archivesspace/releases/download/v$ARCHIVESSPACE_VERSION/archivesspace-v$ARCHIVESSPACE_VERSION.zip"
  echo " done"
fi

cd /tmp
cp -f "$DOWNLOAD_DIR/archivesspace-v$ARCHIVESSPACE_VERSION.zip" /tmp
unzip "$DOWNLOAD_DIR/archivesspace-v$ARCHIVESSPACE_VERSION.zip" -d /opt
cp -f $SHARED_DIR/config/config.rb /opt/archivesspace/config

# Setup MySQL connector
if [ ! -f "$DOWNLOAD_DIR/mysql-connector-java-5.1.39.jar" ]; then
  echo -n "Downloading MySQL Connector..."
  wget -q -O "$DOWNLOAD_DIR/mysql-connector-java-5.1.39.jar" "http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.39/mysql-connector-java-5.1.39.jar"
  echo " done"
fi

cp -f "$DOWNLOAD_DIR/mysql-connector-java-5.1.39.jar" /opt/archivesspace/lib

# Create Archivesspace database
mysql -uroot -proot -e "create database if not exists aspace character set utf8 collate utf8_general_ci;create user if not exists 'aspace'@'localhost' identified by 'aspace';grant all privileges on aspace.* to 'aspace'@'localhost';flush privileges;"

/opt/archivesspace/scripts/setup-database.sh

# Setup startup init
chmod 755 /opt/archivesspace/archivesspace.sh
ln -s /opt/archivesspace/archivesspace.sh /etc/init.d/archivesspace
sudo update-rc.d archivesspace defaults
sudo update-rc.d archivesspace enable
sudo /etc/init.d/archivesspace start
