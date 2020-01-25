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
        sh 'docker build -t mynginximagetest https://github.com/geegithub2019/capstone/tree/master/green'
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
    stage('Kubernetes deploy') {
      steps{
        sh "kubectl apply -f https://github.com/geegithub2019/capstone/tree/master/green/deployment.yml"
      }
    }
    stage('Kubernetes service deploy') {
      steps{
        sh "kubectl apply -f https://github.com/geegithub2019/capstone/tree/master/green/service.yml"
      }
    }
  }
}
