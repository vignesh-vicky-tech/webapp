pipeline {
  agent any 
  tools {
    maven 'Maven'
  }
  stages {
     stage ('Source Composition Analysis') {
      steps {
         sh 'rm owasp* || true'
         sh 'wget "https://raw.githubusercontent.com/cehkunal/webapp/master/owasp-dependency-check.sh" '
         sh 'chmod +x owasp-dependency-check.sh'
         sh 'bash owasp-dependency-check.sh'
         sh 'cat /var/lib/jenkins/OWASP-Dependency-Check/reports/dependency-check-report.xml'
        
      }
    }
    stage ('OWASP Dependency-Check') {
      steps {
        dependencyCheck('OWASP-Dependency-Check') {
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
    

  
