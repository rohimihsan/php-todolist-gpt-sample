stage('Stop and Remove Existing Container') {
            steps {
                script {
                    // Define the name of the existing container
                    def containerName = 'todo-app'
                    
                    // Check if the container is running
                    def isRunning = sh(returnStatus: true, script: "docker inspect -f '{{.State.Running}}' ${containerName}").trim() == 'true'
                    
                    // If the container is running, stop and remove it
                    if (isRunning) {
                        sh "docker stop ${containerName}"
                        sh "docker rm ${containerName}"
                    }
                }
            }
        }

        stage('Build and Run New Container') {
            steps {
                // Your build and run steps here to build and run the new Docker container
                // For example:
                sh "docker build -t todo-app ."
                sh "docker run -d -p 8080:80 --name todo-app todo-app"
            }
        }