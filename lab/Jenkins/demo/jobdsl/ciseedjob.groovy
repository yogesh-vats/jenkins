job("CIDSL") {
 description("I\'ll say hello to person.")
 logRotator(-1, 10)
  parameters {	
    stringParam('PROJECT', 'project-x', 'your project name')
    stringParam('ENV', 'dev', 'your env name')
	stringParam('REPOSITORY', 'https://github.com/OpsTree/ContinuousIntegration.git', 'your repo of code')
	stringParam('BRANCH', 'master', 'your branch')
	stringParam('POMRELATIVEPATH', 'Spring3HibernateApp', 'your pom\'s relative path')
	stringParam('MVNGOALS', 'compile', 'EX: compile pmd:pmd checkstyle:checkstyle -DskipTests cobertura:cobertura -Dcobertura.report.format=xml')
	stringParam('MAVENAME', 'default', 'This is the name/identifire of your maven.')
    }
   scm {
        git {
      remote {
        url("https://github.com/ot-training/jenkins.git")
      }
      branch("*/master")
     }
    } 
   steps {
    dsl {
      external('lab/Jenkins/demo/jobdsl/ci/*.groovy')
  }
 }
}
