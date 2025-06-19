pipeline {
    agent any
    
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/spdas23/maddyzapp.git'
            }
        }

        stage('Build') {
            steps {
               // sh 'npm install'   // Modify based on your application type
            }
        }

        stage('Test') {
            steps {
                //sh 'npm test'    // Ensure tests pass before deployment
            }
        }

        stage('Deploy') {
            steps {
                sshagent(['compute-engine-key']) {
                    sh 'scp -r index.html azureuser@52.186.55.138:/var/www/html'
                    sh 'ssh azureuser@52.186.55.138 "sudo systemctl restart nginx"'
                }
            }
        }
    }
}
