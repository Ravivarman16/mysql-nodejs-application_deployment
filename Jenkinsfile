pipeline {
    agent any
 
    stages {

        stage ('Docker login & Building image') {
            steps {
                sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                sh 'docker build -t $DOCKER_USERNAME/mysql-nodejs:app1 .'
            }
        }

        stage ('Pushing the Docker image to DockerHub') {
            steps {
                sh 'docker push $DOCKER_USERNAME/mysql-nodejs:app1'
            }
        }
        
        stage('Deploy to Deployment server') {
            steps {
                script {
                    sshagent(['ssh']) {
                        // Execute the command within the sshagent block using sh step
                        sh 'ssh -o StrictHostKeyChecking=no ubuntu@3.20.227.222 "docker stop nodejs; docker rm nodejs; docker run -d -it --name nodejs -p 80:8080 ravivarman46/mysql-nodejs:app1"'
                    }
                }
            }
        }
    }
}
