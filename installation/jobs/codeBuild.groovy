job("CodeStability") {
  description("I\'ll build the application")
  logRotator(-1, 10)
  jdk('jdk7')
  scm {
     git {
      remote {
        url("https://github.com/OpsTree/ContinuousIntegration.git")
      }
       branch("*/master")
     }
   }
  steps {
        shell '''
          #!/bin/bash \n
          source /etc/profile.d/mavenenv.sh
          cd Spring3HibernateApp
          mvn clean compile
          '''.stripIndent().trim()
    }
}
