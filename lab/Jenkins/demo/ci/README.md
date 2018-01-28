Steps to be performed by Trainer to showcase CI

* Pre requisite
  * Install Maven integration plugin
  * Install below softwares under Global tool configuration
    * Maven | Maven 3.5.2
    * Java | You need Oracle account for same | JDK 8u162
    * Git | You need to manually install git first

      ```apt-get -y install git```

* Setup CodeStability Job
  * Choose Job type as MavenProject
  * Provide git repository ```https://github.com/OpsTree/ContinuousIntegration```
  * Use ```clean compile``` as target
