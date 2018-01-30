mavenJob('MavenJob') {
    description("I\'ll build the application")
    logRotator(-1, 10)
    scm {
     git {
     remote {
       url("https://github.com/OpsTree/ContinuousIntegration.git'")
     }
      branch("*/master")
     }
    }
    triggers {
	scm('@daily')
    }
    goals('clean compile')
 	rootPOM('Spring3HibernateApp/pom.xml')
}
