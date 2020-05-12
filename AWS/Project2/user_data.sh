#!/bin/bash
sudo yum install httpd -y
sudo systemctl start httpd
# setup java environment
sudo yum update
sudo yum install java-1.8.0-openjdk -y
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins -y
sudo chkconfig jenkins on
sudo wget https://dl.influxdata.com/telegraf/releases/telegraf-1.6.0-1.x86_64.rpm -O /tmp/telegraf.rpm
sudo yum localinstall -y /tmp/telegraf.rpm
sudo rm /tmp/telegraf.rpm
sudo chkconfig telegraf on
sudo mv /tmp/telegraf.conf /etc/telegraf/telegraf.conf
sudo service telegraf start
sudo yum install git -y
sudo mkdir /var/lib/jenkins/.ssh
sudo touch /var/lib/jenkins/.ssh/known_hosts
sudo chown -R jenkins:jenkins /var/lib/jenkins/.ssh
sudo chmod 700 /var/lib/jenkins/.ssh
sudo mv /tmp/id_rsa /var/lib/jenkins/.ssh/id_rsa
sudo chmod 600 /var/lib/jenkins/.ssh/id_rsa
sudo mkdir -p /var/lib/jenkins/init.groovy.d
sudo mv /tmp/basic-security.groovy /var/lib/jenkins/init.groovy.d/basic-security.groovy
sudo mv /tmp/disable-cli.groovy /var/lib/jenkins/init.groovy.d/disable-cli.groovy
sudo mv /tmp/csrf-protection.groovy /var/lib/jenkins/init.groovy.d/csrf-protection.groovy
sudo mv /tmp/disable-jnlp.groovy /var/lib/jenkins/init.groovy.d/disable-jnlp.groovy
sudo mv /tmp/jenkins.install.UpgradeWizard.state /var/lib/jenkins/jenkins.install.UpgradeWizard.state
sudo mv /tmp/node-agent.groovy /var/lib/jenkins/init.groovy.d/node-agent.groovy
sudo chown -R jenkins:jenkins /var/lib/jenkins/jenkins.install.UpgradeWizard.state
sudo mv /tmp/jenkins /etc/sysconfig/jenkins
sudo chmod +x /tmp/install-plugins.sh
sudo bash /tmp/install-plugins.sh
sudo service jenkins start
sudo service httpd start