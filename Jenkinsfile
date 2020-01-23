pipeline {  

  environment {
       registry = "geepee2017/dockercap"
       registryCredential = 'dockerhub'
       dockerImage = ''
  }
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'sudo docker build -t mynginximage2 .'
      }
    }
    stage('Deploy') {
      steps {
        sh 'sudo docker run --name mynginx4 -P -d mynginximage1'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "sudo docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
