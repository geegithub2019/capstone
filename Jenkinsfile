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
    stage('Kubernetes deploy blue controller') {
      steps{
        ssh-agent(['kops-machine']) {
          sh "ssh ec2-user@54.71.211.49 kubectl get pods"
        }
      }
    }
  }
}
