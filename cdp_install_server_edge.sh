# Install tools
yum install -y vim
yum update -y
# Ifconfig 
yum install -y net-tools
# Test install sudo
sudo yum install -y ntp
sudo yum install -y wget
# Nombrar el nodo 1
sudo hostnamectl set-hostname bigdata1.dach.org
# -------------------------
# Network
# -------------------------
sudo vim /etc/hosts
# -------------------------
# Nodo Edge
192.168.100.161 bigdata1.dach.org bigdata1
192.168.100.162 bigdata2.dach.org bigdata2

# -------------------------
sudo vim /etc/hosts
# -------------------------
# Name Host
sudo vim /etc/sysconfig/network
HOSTNAME=bigdata1.dach.org

# Validar registro
uname -a
Linux bigdata1.dach.org 3.10.0-1160.71.1.el7.x86_64 #1 SMP Tue Jun 28 15:37:28 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux

# Install hosts
sudo yum install -y bind-utils

# Desactivar firewall
sudo systemctl disable firewalld
sudo systemctl stop firewalld

# https://docs.cloudera.com/documentation/enterprise/6/6.3/topics/install_cdh_disable_selinux.html
sudo vim /etc/selinux/config
SELINUX=permissive

# https://docs.cloudera.com/documentation/enterprise/6/6.3/topics/install_cdh_enable_ntp.html
sudo vim /etc/selinux/config
sudo setenforce 0
# Sincronizar hora
sudo systemctl start ntpd
sudo systemctl enable ntpd
sudo ntpdate -u 192.168.100.161
# Validar version de python
python --version
# Install cloudera
chmod u+x cloudera-manager-installer.bin
sudo ./cloudera-manager-installer.bin
