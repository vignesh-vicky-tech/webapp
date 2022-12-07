pipeline {
  agent any 
  tools {
    maven 'Maven'
  }
  stages {
       /*stage ('Source Composition Analysis') {
      steps {
         sh 'wget "https://raw.githubusercontent.com/vignesh-vicky-tech/webapp/main/owasp-dependency-check.sh" '
         sh 'chmod +x owasp-dependency-check.sh'
         sh 'bash owasp-dependency-check.sh'
         }
    }*/
    
    stage('dependency-check'){
    steps{
        sh 'dependencyCheck additionalArguments: scan="https://github.com/vignesh-vicky-tech/webapp.git" --format HTML, odcInstallation: OWASP-Dependency-Check'
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
    stage('Deploy to Tomcat'){
     steps{
     sh 'cp target/WebApp.war /prod/apache-tomcat-9.0.70/webapps/WebApp.war'
     }
   }
     stage ('DAST') {
      steps {
         sh 'docker run -t owasp/zap2docker-stable zap-baseline.py -t http://172.30.44.95:8085/WebApp/ || true'
        }
    }
    
   }
}
    

  
