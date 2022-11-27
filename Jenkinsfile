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

    stage('List pods') {
    withKubeConfig([credentialsId: 'mykubeconfig',
                    serverUrl: 'https://192.168.64.2:6443'
                    ]) {
      sh 'kubectl get pods'
    }
  }

/*
    stage('Deploy App to Kubernetes') {     
      steps {
        container('kubectl') {
          withCredentials([file(credentialsId: 'mykubeconfig', variable: 'KUBECONFIG')]) {
            sh 'sed -i "s/<TAG>/${BUILD_NUMBER}/" myweb.yaml'
            sh 'kubectl apply -f myweb.yaml'
          }
        }
      }
    }
*/


  }
  
}
