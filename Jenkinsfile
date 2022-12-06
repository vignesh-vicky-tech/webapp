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
    /*stage ('Source Composition Analysis') {
      steps {
         sh 'wget "https://raw.githubusercontent.com/vignesh-vicky-tech/webapp/main/owasp-dependency-check.sh" '
         sh 'chmod +x owasp-dependency-check.sh'
         sh 'bash owasp-dependency-check.sh'
         }
    }*/
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
    

  
