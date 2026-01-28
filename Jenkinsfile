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

        stage('Deploy') {
            steps {
                sh """
                  export TAG=${TAG}
                  docker compose up -d
                """
            }
        }
    }
}
