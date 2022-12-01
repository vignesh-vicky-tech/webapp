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
    
    }
}
    
  
