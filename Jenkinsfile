pipeline {  

  environment {
       registry = "geepee2017/greenimage"
       registryCredential = 'dockerhub'
       dockerImage = ''
  }
  agent any
  stages {
    stage('Build') {
      steps {
        sh './green/run_docker.sh '
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
        sh 'sudo kubectl version'
        sh 'sudo kubectl apply -f ./green/deployment.yml'
      }
    }
    stage('Kubernetes service') {
      steps{
        sh 'sudo kubectl apply -f ./green/service.yml'
      }
    }
  }
}
