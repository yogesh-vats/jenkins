#!/bin/bash
export JENKINS_HOME='/var/lib/jenkins'
export JENKINS_UC_EXPERIMENTAL='https://updates.jenkins.io/experimental'

#Install Essential packages
echo "Essential package Installation Start "
sudo apt-get -y install vim tar zip unzip git


# Install Java
echo "Java Installation Start"
sudo apt-get update -y
echo | sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update -y
sudo echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer


# Install Maven
echo "Maven Installation Start"
if [ ! -d "/opt/maven" ]; then
	cd /opt/
	wget -nc http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
	sudo tar -xvzf apache-maven-3.3.9-bin.tar.gz
	sudo mv apache-maven-3.3.9 maven 
	echo "export M2_HOME=/opt/maven" > /etc/profile.d/mavenenv.sh
	echo "export PATH=/opt/maven/bin:${PATH}" >> /etc/profile.d/mavenenv.sh
        sudo chmod +x /etc/profile.d/mavenenv.sh
	source /etc/profile.d/mavenenv.sh 
	cd - 
fi

#Install Python
echo "Python Installation Start "
sudo  apt-get install -y  python



#Install Jenkins
echo "Jenkins Installation Start "
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins 	#=2.19.4
sudo sed -i "s/HTTP_PORT=8080/HTTP_PORT=8090/" /etc/default/jenkins



# Configuring Jenkins Installation
echo "Create init direactory for jenkins scripts"
sudo mkdir -p  /var/lib/jenkins/init.groovy.d/

echo "Move scripts to run at initialization"
sudo cp ./basic-security.groovy  /var/lib/jenkins/init.groovy.d/
sudo cp ./installJava.groovy  /var/lib/jenkins/init.groovy.d/
sudo cp ./create-seed-job.groovy  /var/lib/jenkins/init.groovy.d/
sudo cp ./mavenAutoInstaller.groovy  /var/lib/jenkins/init.groovy.d/
sudo cp ./disableDSLSecurity.groovy  /var/lib/jenkins/init.groovy.d/
sudo cp ./oracle-user.groovy  /var/lib/jenkins/init.groovy.d/

echo "Start plugin installation"
sudo cp ./plugins.txt /var/lib/jenkins/plugins.txt
sudo chmod u+x install-plugins.sh
#sudo bash install-plugins.sh --plugins plugins.txt --plugindir /var/lib/jenkins/plugins
sudo xargs ./install-plugins.sh  < plugins.txt


echo "Copy Jobs to seed jobs worksapace"
sudo cp jobs/* /var/lib/jenkins/jobs/SeedJob/workspace


sudo chown -R jenkins:jenkins /var/lib/jenkins
echo  "Resatrt Jenkins service"
sudo service jenkins restart
