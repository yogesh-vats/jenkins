job("Codeclone") {
 description("I\'ll  git clone")
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
}
