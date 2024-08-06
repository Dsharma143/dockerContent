pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/Dsharma143/dockerContent.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("deepaksharma143/projcert:latest")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                        dockerImage.push()
                }
            }
        }



        
        stage('Deploy to Kubernetes') {
            steps {
                    withCredentials([file(credentialsId: 'minikube-kubeconfig-file', variable: 'KUBECONFIG')]) {
                    bat '''
                        kubectl --kubeconfig=%KUBECONFIG% config set-context minikube
                        kubectl --kubeconfig=%KUBECONFIG% apply -f deployment.yaml --validate=false
                        kubectl --kubeconfig=%KUBECONFIG% apply -f service.yaml --validate=false
                    '''
                    }
                }
            }
        }

    post {
        always {
            cleanWs()
        }
    }
}
