// This is capstone project for blue-green kubernetes deployment
pipeline {  

  environment {
       registry = "geepee2017/blueimage"
       registryCredential = 'dockerhub'
       dockerImage = ''
  }
  agent any
  options {
        // For example, we'd like to make sure we only keep 10 builds at a time, so
        // we don't fill up our storage!
        buildDiscarder(logRotator(numToKeepStr: '5'))

        // And we'd really like to be sure that this build doesn't hang forever, so
        // let's time it out after an hour.
        timeout(time: 25, unit: 'MINUTES')
    }

  stages {
    stage('Build') {
      steps {
        sh './blue/run_docker.sh '
      }
    }
    stage('Building image') {
      steps{
        script {
          dir('./blue/') {
            dockerImage = docker.build registry + ":latest"
          }
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
        sh "docker rmi $registry:latest"
      }
    }
    

    stage('Deploy RC to k8') {
      steps{
        sshagent(['kops-mackine']) {
          script{
            dir('./blue') {
              sh "ssh -o StrictHostKeyChecking=no ubuntu@ec2-44-229-83-223.us-west-2.compute.amazonaws.com sudo kubectl apply -f $workspace/blue/replicationcontroller.yml"
            }
          }
        }
      }
    }
    stage('Deploy service to k8') {
      steps{
        sshagent(['kops-mackine']) {
          script{ 
            dir('./') {
              sh "ssh -o StrictHostKeyChecking=no ubuntu@ec2-44-229-83-223.us-west-2.compute.amazonaws.com sudo kubectl apply -f $workspace/nginx-service.json"
            }
          } 
        }  
      }
    }
  }
}
