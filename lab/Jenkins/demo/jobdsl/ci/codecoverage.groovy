job("${PROJECT}-${ENV}-DSLCodeCoverage") {
  description('Code Coverage')
  logRotator {
    daysToKeep(60)
    numToKeep(20)
    artifactDaysToKeep(1)
  }
  scm {
     git {
      remote {
        url("$REPOSITORY")
      }
      branch("*/$BRANCH")
     }
  }
  steps {
    maven {
      mavenInstallation("${MVNGOALS}")
      goals("${MVNGOALS}")
      rootPOM("${POMRELATIVEPATH}/pom.xml")
    }
  }
  publishers {
	cobertura('**/target/site/cobertura/coverage.xml')
  }
}
