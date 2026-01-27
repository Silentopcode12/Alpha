pipeline {
    agent any

    environment {
        IMAGE_NAME = "tango"
        TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Silentopcode12/Alpha.git'
            }
        }

        stage('Build Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${TAG} ."
            }
        }

        stage('Deploy with Compose (v2)') {
            steps {
                sh '''
                  docker compose down || true
                  docker compose up -d
                '''
            }
        }
    }
}
