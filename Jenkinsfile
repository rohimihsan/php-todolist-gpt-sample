pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'sudo docker build -t todo-app .'
            }
        }
        stage('Run') {
            steps {
                sh 'sudo docker stop todo-app'
                sh 'sudo docker run -d --name todo-app -p 8010:80 todo-app' 
            }
        }
    }
}
