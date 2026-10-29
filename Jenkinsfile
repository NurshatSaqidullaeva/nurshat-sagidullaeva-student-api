pipeline {
    agent any   // needs JDK 17 + Docker CLI on the Jenkins agent

    environment {
        STUDENT_NAME = 'Nurshat Sagidullaeva'
        STUDENT_ID   = '41536'
        IMAGE_NAME   = 'nurshat-sagidullaeva-student-api'
        IMAGE_TAG    = 'v1.0-nurshat-sagidullaeva'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Student: ${STUDENT_NAME} (ID ${STUDENT_ID})"
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo "Building project for ${STUDENT_NAME}"
                sh 'chmod +x gradlew'
                sh './gradlew clean assemble --no-daemon'
            }
        }

        stage('Test') {
            steps {
                sh './gradlew test --no-daemon'
            }
            post {
                always {
                    junit allowEmptyResults: true, testResults: 'build/test-results/test/*.xml'
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Verify') {
            steps {
                sh "docker image inspect ${IMAGE_NAME}:${IMAGE_TAG} --format 'Image: {{index .RepoTags 0}} | Size: {{.Size}} bytes | Created: {{.Created}}'"
                echo "Image ${IMAGE_NAME}:${IMAGE_TAG} exists - verified for ${STUDENT_NAME}"
            }
        }
    }

    post {
        success { echo "Pipeline SUCCESS for ${STUDENT_NAME}" }
        failure { echo "Pipeline FAILED for ${STUDENT_NAME}" }
    }
}
