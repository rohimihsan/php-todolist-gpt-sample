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
                sh 'sudo docker run -d -p 8010:8010 my-php-app' 
            }
        }
    }
}
