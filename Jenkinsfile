pipeline {
    agent any
  
    stages {
        stage('Deploy') {
            steps {
                echo "run"
                sh "export JENKINS_NODE_COOKIE=dontKillMe; nohup php -S localhost:8000 > todophp.log 2>&1 &"
            }
        }
    }

    post {
        always {
            // Wait for a few seconds to ensure the Go binary is started properly
            sleep time: 10, unit: 'SECONDS'

            // Optionally, you can include further steps here to validate the Go binary's behavior or perform other tasks.
        }
        success {
            echo 'Build and deployment successful!'
        }
        failure {
            echo 'Build or deployment failed!'
        }
    }
}
