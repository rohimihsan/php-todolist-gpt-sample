pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the PHP application code from the repository
                checkout scm
            }
        }

        // stage('Build') {
        //     steps {
        //         // Install PHP dependencies using Composer
        //         // sh 'composer install'

        //         // Build your PHP application (if needed)
        //         // For example, compile assets, etc.
        //         // sh 'php build_script.php'
        //     }
        // }

        stage('Deploy') {
            steps {
                // Copy the PHP files to the Nginx web root
                sh 'sudo cp -r . /var/www/html/' // Adjust the path as needed

                // Restart Nginx to apply changes
                sh 'sudo service nginx restart'
            }
        }
    }

    // Post-build actions, etc.
}
