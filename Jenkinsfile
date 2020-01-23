pipeline {  

  environment {
       registry = "geepee2017/dockercap"
       registryCredential = 'dockerhub'
       dockerImage = ''
  }
  agent {
        docker { image 'node:7-alpine' }
    }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t mynginximage1 .'
      }
    }
    stage('Deploy') {
      steps {
        sh 'docker run --name mynginx4 -P -d mynginximage1'
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
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
