pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t todo-app .'
            }
        }
        stage('Run') {
            steps {
                sh 'docker run -d -p 8010:8010 my-php-app' 
            }
        }
    }
}
