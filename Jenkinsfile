pipeline {
  agent any 
  tools {
    maven 'Maven'
  }
  stages {
     
    stage ('SAST') {
      steps {
        withSonarQubeEnv('sonarqube') {
          sh 'mvn sonar:sonar'
        
        }
      }
    }
    stage ('Source Composition Analysis') {
      steps {
         sh 'rm owasp* || true'
         sh 'wget "https://raw.githubusercontent.com/vignesh-vicky-tech/webapp/main/owasp-dependency-check.sh" '
         sh 'chmod +x owasp-dependency-check.sh'
         sh 'owasp-dependency-check.sh'
         sh 'cat /var/lib/jenkins/OWASP-Dependency-Check/reports/dependency-check-report.xml'
        
      }
    }
     stage ('Build') {
      steps {
      sh 'mvn clean package'
       }
    }
    
    }
}
    

  
