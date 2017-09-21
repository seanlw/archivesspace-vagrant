###
# BASICS
###

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

# Update
apt-get -y update
apt-get -y upgrade

# Setup apt defaults
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
debconf-set-selections <<< 'iptables-persistent iptables-persistent/autosave_v4 boolean true'
debconf-set-selections <<< 'iptables-persistent iptables-persistent/autosave_v6 boolean true'

# Install needed packages
apt-get -y install iptables-persistent unzip sqlite3 git-core nodejs openjdk-8-jdk default-jre default-jdk mysql-server mysql-client

# Install iptable rules
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 8081 -j ACCEPT
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 8089 -j ACCEPT

iptables-save > /etc/iptables/rules.v4
