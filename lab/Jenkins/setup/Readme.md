Instruction sets to install jenkins on Ubuntu 14.04
* Installation instructions
  * Login to the allocated machine

    ``` ssh ubuntu@<ip>```
  * Switch to root user

    ```sudo su```
  * Java Installation
    * Add Oracle’s PPA(Personal Package Archive) to your list of sources so that Ubuntu knows where to check for the updates

      ```add-apt-repository ppa:webupd8team/java```
    * Update package repository

      ```apt-get -y update```
    * Install Oracle JDK 8

      ```apt-get -y install oracle-java8-installer```
    * Check for the Java version

      ```javac -version```

  * Jenkins Installation
    * Add the key to your system

      ```wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -```
    * Add an entry in your /etc/apt/sources.list

      ```echo "deb https://pkg.jenkins.io/debian binary/" >> /etc/apt/sources.list```
    * Update package repository

      ```apt-get -y update```
    * Install Jenkins

      ```apt-get -y jenkins```
    * Check for the Java version

      ```ps -ef | grep jenkins```

* Reference
  * https://medium.com/coderscorner/installing-oracle-java-8-in-ubuntu-16-10-845507b13343
  * https://pkg.jenkins.io/debian/
