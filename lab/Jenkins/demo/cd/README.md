Steps to be performed by Trainer to showcase CI
* Pre requisite
  * Nginx should be installed in the system
    ```sudo apt-get update
      sudo apt-get install nginx
    ```
  * Below plugins should be installed
    * Publish Over SSH
    * SSH plugin
    * Git Parameter Plug-In
  * Enable password less login between jenkins & root user
    * Generate a key pair for jenkins user
      ```
      sudo su - jenkins
      ssh-keygen -t rsa
      cat ~/.ssh/id_rsa.pub
      ```
    * Add jenkins user public key to authorized_keys file of root user.
  * Enable remote host setting for the root user from jenkins user
      * In Global configuration provide SSH remote host details
        * Hostname: Public ip of your server
        * Port: 22
        * Credential: Create ssh login credential for root user
      * Also provide SSH servers details
  * Steps
    * Create a tag creator Jenkins Job
      * Job should accept 2 parameters
        - SRC_BRANCH
        - TAG_NAME
      * Provide credential so that you can do commit in GitHub as well
    * Create a Deployer Jenkins Job
      * It will checkout code from
        ```https://github.com/ot-training/jenkins.git```
      * It will use SSH Publish plugin to publish files from jenkins server to target server
      * It will use SSH Publish plugin to execute a command on remote server
    * Create a rollback Jenkins Job that will deploy code from a tag
      * Job should accept tag name as parameter
      * Reuse the configurations that we have done in deployer jenkins job
