#!/bin/bash
# (c) copyright 2014 martin lurie sample code not supported

# reminder to activate CM in the quickstart
echo Activate CM in the quickstart vmware image
echo Hit enter when you are ready to proceed
# pause until the user hits enter
read foo
# for debugging - set -x

# fix the permissions in the quickstart vm
# may not be an issue in later versions of the vm
# this fixes the following error
# failed to start File /etc/hadoop must not be world 
# or group writable, but is 775
# File /etc must not be world or group writable, but is 775
#
#  run this as root
#  to become root
#  sudo su - 
cd /root
chmod 755 /etc
chmod 755 /etc/hadoop

# install the kerberos components
yum install -y krb5-server
yum install -y openldap-clients
yum install -y krb5-workstation

# update the config files for the realm name and hostname
# in the quickstart VM
# notice the -i.xxx for sed will create an automatic backup
# of the file before making edits in place
# 
# set the Realm
#sed -i.orig 's/EXAMPLE.COM/cluster/g' /etc/krb5.conf
## set the hostname for the kerberos server
#sed -i.m1 's/kerberos.example.com/node-1.cluster/g' /etc/krb5.conf
## change domain name to cloudera 
#sed -i.m2 's/example.com/cluster/g' /etc/krb5.conf

# download UnlimitedJCEPolicyJDK7.zip from Oracle into
# the /root directory
# we will use this for full strength 256 bit encryption

mkdir jce
cd jce
unzip ../UnlimitedJCEPolicyJDK7.zip 
# save the original jar files
cp /usr/java/jdk1.7.0_67-cloudera/jre/lib/security/local_policy.jar local_policy.jar.orig
cp /usr/java/jdk1.7.0_67-cloudera/jre/lib/security/US_export_policy.jar US_export_policy.jar.orig

# copy the new jars into place
cp /root/jce/UnlimitedJCEPolicy/local_policy.jar /usr/java/jdk1.7.0_67-cloudera/jre/lib/security/local_policy.jar
cp /root/jce/UnlimitedJCEPolicy/US_export_policy.jar /usr/java/jdk1.7.0_67-cloudera/jre/lib/security/US_export_policy.jar


