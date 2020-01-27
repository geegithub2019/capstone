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
    stage('Remote ssh') {
     steps{
        withKubeConfig([credentialsId: 'iam-root-account', serverUrl: 'https://74B8E582A8CC04E5B2484C6ACC26E47B.yl4.us-west-2.eks.amazonaws.com']) {
        sh 'kubectl get nodes'
      }
    }
  }
 }
}
