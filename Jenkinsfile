pipeline {
  agent any
  stages {
    stage('go-build') {
      parallel {
        stage('go-build') {
          steps {
            echo 'hello world'
          }
        }

        stage('') {
          steps {
            echo 'hello 2'
          }
        }

      }
    }

    stage('go-test') {
      parallel {
        stage('go-test') {
          steps {
            echo 'hello test'
          }
        }

        stage('') {
          steps {
            echo 'hello tes'
          }
        }

      }
    }

    stage('') {
      steps {
        echo 'hello end'
      }
    }

  }
  environment {
    text = 'value'
  }
}