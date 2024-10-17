pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                // Run Maven build
                script {
                    // Optionally set the MAVEN_OPTS if needed
                    env.MAVEN_OPTS = "-Xmx1024m"
                }
                sh 'maven clean install'
            }
        }
        
        stage('Test') {
            steps {
                // Run Maven tests
                sh 'maven test'
            }
        }
        
        stage('Package') {
            steps {
                // Package the application
                sh 'maven package'
            }
        }
        
        // stage('Deploy') {
        //     steps {
        //         // Optional: Add your deployment steps here
        //         echo 'Deploying the application...'
        //         // Example: sh 'scp target/my-app.war user@server:/path/to/deploy'
        //     }
        // }
    

   
    }
}
