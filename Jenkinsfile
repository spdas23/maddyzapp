pipeline {
environment {
    registry = "maddyz23/myspace"
    registryCredential = 'maddyz23'
    dockerImage = ''
    DOCKERHUB_CREDENTIALS=credentials('DockerToken')

}
agent any
stages {
    stage('Cloning our Git') {
        steps {
            checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/spdas23/maddyzapp']])
        }
}
stage('Building our image') {
    steps{
        script {
            sh('pwd')
            sh 'docker logout'
            sh('docker build -t maddyz23/myspace:$BUILD_NUMBER . --no-cache')
            sh('docker images')
            }
        }
    }
stage('Deploy our image') {
    steps{
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
        sh ('docker push maddyz23/myspace:$BUILD_NUMBER')
    }
}
stage('Cleaning up') {
    steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
        }
    }
}
}