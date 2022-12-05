pipeline {
  agent any 
  tools {
    maven 'Maven'
  }
  stages {
    stage ('OWASP Dependency-Check Vulnerabilities') {
      steps {
        withdependencyCheck('OWASP-Dependency-Check') {
          sh 'mvn dependency-check:check'
        }
      }
    }
     
    stage ('SAST') {
      steps {
        withSonarQubeEnv('sonarqube') {
          sh 'mvn sonar:sonar'
        
        }
      }
    }
     stage ('Build') {
      steps {
      sh 'mvn clean package'
       }
    }
    }
}
    

  
