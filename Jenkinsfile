pipeline {
    agent any
    tools {
        maven 'MAVEN'
        jdk 'JDK'
        //tool name: 'MAVEN', type: 'maven'
    }

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
                sh 'mvn clean install'
            }
        }
        
        stage('Test') {
            steps {
                // Run Maven tests
                sh 'mvn test'
            }
        }
        
        stage('Package') {
            steps {
                // Package the application
                sh 'mvn package'
            }
        }
        
        
        stage('Build Docker Image') {
            steps {
                script {
            
                    sh 'docker build -t simple-webpage .'
                    sh 'docker tag simple-webpage:1 pt1212/cicd:2'
                    sh 'docker login -u pt1212 -p DevOps@123'
                    sh 'docker push pt1212/cicd:2'
                   
                }
            }
        }
        // stage('Run Docker Container') {
        //     steps {
        //         script {
        //             sh 'docker run -d -p 8085:8085 simple-webpage'
        
        //         }
        //     }
        // }
        stage('Deploy pods on K8S cluster') {
            steps {
                script {
                    sh 'kubectl create -f deployment.yml'
                }
            }
        }

    

   
    }
}
