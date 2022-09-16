
pipeline {
   // ## triggers {
  //  ##pollSCM('* * * * *')
   // }
   agent any
    tools {
  maven 'M2_HOME'
  }
    
 environment {
    registry = '520394173897.dkr.ecr.us-east-1.amazonaws.com/devop_repository'
    registryCredential = 'ecr-user'
    dockerimage = ''
  }

    stages {


        stage('maven package') {
            steps {
                sh 'mvn clean'
                sh 'mvn install -DskipTests'
                sh 'mvn package -DskipTests'
            }
        }
        stage('Build Image') {
            
            steps {
                script{
                  def mavenPom = readMavenPom file: 'pom.xml'
                    dockerImage = docker.build registry + ":${mavenPom.version}"
                } 
            }
        }
        stage('Deploy image') {
           
            
            steps{
                script{ 
                    docker.withRegistry("https://"+registry,"ecr:us-east-1:"+registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }    
                  
  }
}
