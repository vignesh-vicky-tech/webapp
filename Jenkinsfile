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
      sh 'mvn clean package'
       }
    }
    stage('Deploy to Tomcat'){
     sh 'cpy target/WebApp.war /prod/apache-tomcat-9.0.70/webapps/WebApp.war'
   }
    
   }
}
    

  
