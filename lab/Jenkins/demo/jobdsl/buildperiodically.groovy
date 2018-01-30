job("Buildperiodically") {
 description("I\'ll build job periodically")
 logRotator(-1, 10)
 scm {
    git {
     remote {
       url("https://github.com/ot-training/jenkins.git")
     }
      branch("*/master")
    }
  }
  triggers {
	cron {
		spec("@hourly")
	}
  }
 steps {
       shell('echo "Hello World!"')
   }
}
