pipeline {

  options {
    ansiColor('xterm')
  }

  agent {
    kubernetes {
      yamlFile 'builder.yaml'
    }
  }

  stages {

    stage('Kaniko Build & Push Image') {
      steps {
        container('kaniko') {
          script {
            sh '''
            /kaniko/executor --dockerfile `pwd`/Dockerfile \
                             --context `pwd` \
                             --destination=awear/jenkinsplayground:${BUILD_NUMBER}
            '''
          }
        }
      }
    }

stage('Apply Kubernetes files') {
    withKubeConfig([credentialsId: 'user1', serverUrl: 'https://192.168.64.2']) {
      sh 'kubectl apply -f my-kubernetes-directory'
    }
  }
  
  }
  
}
