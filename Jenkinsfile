pipeline {
    agent any

    stages {
        stage('Deploy') {
            steps {
                // Copy the PHP files to the Nginx web root
                sh 'sudo cp -r . /var/www/html/' // Adjust the path as needed

                // Restart Nginx to apply changes
                sh 'sudo systemctl restart nginx'
            }
        }
    }

    // Post-build actions, etc.
}
