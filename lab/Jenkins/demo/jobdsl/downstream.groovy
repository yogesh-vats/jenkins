job("DownStreamJob") {
 description("I\'ll build trigger a post build job")
 logRotator(-1, 10)
 scm {
    git {
     remote {
       url("https://github.com/ot-training/jenkins.git")
     }
      branch("*/master")
    }
  }
 steps {
       shell('echo "Hello World!"')
   }
  publishers {
  	downstream('HelloWorld', 'SUCCESS')
  }
}
