job("PollSCM") {
 description("I\'ll perform poll scm")
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
	scm('@daily')
  }
 steps {
       shell('echo "Hello World!"')
   }
}
