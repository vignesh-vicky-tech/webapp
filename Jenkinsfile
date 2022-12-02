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
     stage ('Build') {
      steps {
      sh 'mvn clean package -f pom.xml'
       }
    }
    }
}
    

  
