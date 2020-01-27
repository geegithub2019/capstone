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
        withKubeConfig([credentialsId: 'ZXlKaGJHY2lPaUpTVXpJMU5pSXNJbXRwWkNJNklpSjkuZXlKcGMzTWlPaUpyZFdKbGNtNWxkR1Z6TDNObGNuWnBZMlZoWTJOdmRXNTBJaXdpYTNWaVpYSnVaWFJsY3k1cGJ5OXpaWEoyYVdObFlXTmpiM1Z1ZEM5dVlXMWxjM0JoWTJVaU9pSmtaV1poZFd4MElpd2lhM1ZpWlhKdVpYUmxjeTVwYnk5elpYSjJhV05sWVdOamIzVnVkQzl6WldOeVpYUXVibUZ0WlNJNkltcGxibXRwYm5NdGRHOXJaVzR0WjJ0eFl6a2lMQ0pyZFdKbGNtNWxkR1Z6TG1sdkwzTmxjblpwWTJWaFkyTnZkVzUwTDNObGNuWnBZMlV0WVdOamIzVnVkQzV1WVcxbElqb2lhbVZ1YTJsdWN5SXNJbXQxWW1WeWJtVjBaWE11YVc4dmMyVnlkbWxqWldGalkyOTFiblF2YzJWeWRtbGpaUzFoWTJOdmRXNTBMblZwWkNJNklqUmpNV1EzTldWbUxUUXhOVE10TVRGbFlTMDRNRFptTFRBeU5HTTRPVEkwWkdRelpTSXNJbk4xWWlJNkluTjVjM1JsYlRwelpYSjJhV05sWVdOamIzVnVkRHBrWldaaGRXeDBPbXBsYm10cGJuTWlmUS5nQU1PWHJ3SkZuQkRtSVk0Wk84cGhTYURPNG8zeF9pNVhkbjEzbUZoM1hmM0F2VVV5R1Zmb0s3Tk5JTUxvYWxNbE8tQXNUem1wYm1UcmZwUGlYVlMzY0lSNnFmaEp0cVVNWjAxR2NxdkNfdWdiUjdOWWZlOUF1ejNkSjN2azBFRzZZYWktN2ctTUR6Y2p5bGN0aktNLWxEQ3RRTk9sUzlaX3VxS3B2MnVaMGR2MS0wVVhvbmRsUGhzaXJxU3Z4N2hpbEFhSFpqTlVDQk1taWZYeF81eWt0OXpTNHIyUDluZHhld1h5czM5c1NWaldZVENra1BoeF9JY25pN2V0NS1UTTBPNVRuRlNUTnMySkdKcmVpaGJKY1U5ZHNtSWxqYnlUeXNDTlluelM0U3d5dUJXOEYxbDVnZWpMa2FJQ3pUVG9TNm1oZlRUVkZ2cWZEaTJLZVd2Y1E=', serverUrl: 'https://74B8E582A8CC04E5B2484C6ACC26E47B.yl4.us-west-2.eks.amazonaws.com']) {
        sh 'kubectl get nodes'
      }
    }
  }
 }
}
