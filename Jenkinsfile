pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "shamanettar05/myapp:v1"
        DOCKER_CREDENTIALS_ID = "dockerhub-creds"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/vvce23ise0051-creator/docker.git'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "${DOCKER_CREDENTIALS_ID}",
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    bat 'echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                bat "docker push ${DOCKER_IMAGE}"
            }
        }
    }

    post {
        success {
            echo 'Image successfully built and pushed to Docker Hub!'
        }
        failure {
            echo 'Pipeline failed. Check logs.'
        }
    }
}
