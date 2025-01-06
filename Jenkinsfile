pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'harizdizasantoso/projectrevisi:latest'
        CONTAINER_NAME = 'revisi'
        PORT_MAPPING = '8086:80'  // Adjust the port mapping as needed
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}", '-f Dockerfile .')
                }
            }
        }

     stage('Clean Existing Container') { // Pindahkan ke awal
            steps {
                script {
                    powershell """
                        \$containerId = docker ps -aq -f "name=${CONTAINER_NAME}"
                        if (\$containerId) {
                            echo "Stopping and removing container: \$containerId"
                            docker stop \$containerId
                            docker rm \$containerId
                        } else {
                            echo "No container to remove"
                        }
                    """
                }
            }
        }


        stage('Run Docker Container') {
            steps {
                script {
                    // Run Docker container based on the built image
                    docker.image("${DOCKER_IMAGE}").run("-d -p ${PORT_MAPPING} --name ${CONTAINER_NAME}")
                }
            }
        }
    }
}
