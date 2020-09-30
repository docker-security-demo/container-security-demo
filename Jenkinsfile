pipeline {
    agent any

    environment {
        baseImage = 'postgres:latest'
        SCANNER_TOKEN = credentials('scanner-token')
    }

    stages {
        stage ("lint dockerfile") {
            agent {
                docker {
                    image 'hadolint/hadolint:latest-debian'
                }
            }
            steps {
                sh 'hadolint Dockerfile | tee -a hadolint_lint.txt'
            }
            post {
                always {
                    archiveArtifacts 'hadolint_lint.txt'
                }
            }
        }
        stage ("verify signatures") {
            steps {
                sh 'docker trust inspect $baseImage | tee -a signatures.txt'
            }
            post {
                always {
                    archiveArtifacts 'signatures.txt'
                }
            }
        }
        stage('Build App') {
            steps {
                sh './gradlew build --no-daemon'
            }
        }
        stage('Build Image & Scan') {
            steps {
                sh 'docker build --build-arg=token=$SCANNER_TOKEN --no-cache .'
            }
        }
    }
}
