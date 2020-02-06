// This is capstone project for blue-green kubernetes deployment
pipeline {  
//Dockerhub access info
  environment {
       registry = "geepee2017/blueimage"
       registryCredential = 'dockerhub'
       dockerImage = ''
  }
  agent any
  options {
        // Keeping max 4!
        buildDiscarder(logRotator(numToKeepStr: '4'))

        // time out set for 20 mins.
        timeout(time: 20, unit: 'MINUTES')
  }

  stages {
    stage('Compile') {
//Compile the docker image
      steps {
        sh './blue/run_docker.sh '
      }
    }
    stage('Building image') {
//Building the docker image for dockerhub
      steps{
        script {
          dir('./blue/') {
            dockerImage = docker.build registry + ":latest" 
          }
        }   
      }
    }
    stage('Push Image to dockerhub') {
//Pushing image to dockerhub
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
//Remove unused image from system
      steps{
        sh "docker rmi $registry:latest"
      }
    }
    

    stage('Deploy RC to k8') {
//Deploy the docker image to kubernetes pods
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
//Deploy the service to access the kubernetes pod from the internet
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
