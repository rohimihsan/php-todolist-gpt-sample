pipeline {
    agent any

    stages {
        stage('Stop and Remove Existing Container') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    // Stage 1 steps that might produce an error
                        script {
                        // Define the name of the existing container
                        def containerName = 'todo-app'

                        sh "sudo docker stop ${containerName}"
                        sh "sudo docker rm ${containerName}"
                    }
                }

                
            }
        }

        stage('Build and Run New Container') {
            steps {
                    sh "sudo docker build -t todo-app ."
                    sh "sudo docker run -d -p 8010:9000 --name todo-app todo-app"                
            }
        }
    }
}
