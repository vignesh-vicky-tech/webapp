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
     steps{
     sh 'cp target/WebApp.war /prod/apache-tomcat-9.0.70/webapps/WebApp.war'
     }
   }
     stage ('DAST') {
      steps {
         sh 'docker run -t owasp/zap2docker-stable zap-baseline.py -t http://172.30.44.95:8085/WebApp/ -r testreport.html || true'
        }
    }
    
   }
}
    

  
