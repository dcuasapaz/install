# SO
# Ubuntu: 21.04
# RAM: 10GB
# Storage: 300GB
# Machine: Virtual machine, virtual box

# Steps
# 1. Ensure that your system packages are updated to the latest stable versions.
sudo apt update && sudo apt upgrade

# 2. Install the necessary packages:
sudo apt -y install gnupg2 wget vim

# 3. Install PostgreSQL 14
sudo apt-cache search postgresql | grep postgresql
# Add the repository that provides PostgreSQL 14 on Ubuntu.
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
# Next import the GPG signing key for the repository.
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# Then update your APT package list.
sudo apt -y update
# PostgreSQL 14 using the command below.
sudo apt -y install postgresql-14
# Verify the installed PostgreSQL version.

# 4. Connect to PostgreSQL 14 database.
sudo -u postgres psql
# For this option, you first have to switch to the Postgres user created after PostgreSQL 14 installation.
sudo -i -u postgres
psql
# Change PostgreSQL
ALTER USER postgres PASSWORD 'Pst!22!GIS';

# References
# https://techviewleo.com/how-to-install-postgresql-database-on-ubuntu/
