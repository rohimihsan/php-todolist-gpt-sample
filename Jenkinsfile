pipeline {
    agent any

    stages {
        stage('Stop and Remove Existing Container') {
            steps {
                script {
                    // Define the name of the existing container
                    def containerName = 'todo-app'

                    sh "sudo docker stop ${containerName}"
                    sh "sudo docker rm ${containerName}"
                }
            }
        }

        stage('Build and Run New Container') {
            steps {
                sh "sudo docker build -t todo-app ."
                sh "sudo docker run -d -p 8080:80 --name todo-app todo-app"
            }
        }
    }
}
