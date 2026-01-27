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

        stage('Deploy with Compose') {
            steps {
                sh """
                  TAG=${TAG} docker-compose down || true
                  TAG=${TAG} docker-compose up -d
                """
            }
        }
    }
}
