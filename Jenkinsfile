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
    

    stage('Deploy to k8') {
      steps{
        sshagent(['kops-mackine']) {
          script{
            dir('./green') {
              sh "ssh -o StrictHostKeyChecking=no ubuntu@ec2-44-229-83-223.us-west-2.compute.amazonaws.com sudo kubectl apply -f ./capstone/green/deployment.yml"
            }
          }
        }
      }
    }
  }
}
