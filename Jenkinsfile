pipeline{
  agent any
  tools{
    maven 'maven-3'
  }
  envirnoment{
  	DOCKER_TAG = getDockerTag()
  }
  stages{
    stage('Build'){
      steps{
        sh 'mvn clean package'
        }
      }
      stage('Build Docker Image'){
      steps{
        sh "docker build . -t raghugore/kube:${DOCKER_TAG}"
      }
    } 
    stage('Push Docker Image'){
     withCredentials([string(credentialsId: 'raghav-docker-hub', variable: 'dockerHubPassword')]) {
       sh "docker login -u raghugore -p ${dockerHubPassword}"
       sh "docker push raghugore/kube:${DOCKER_TAG}"
      }
    } 
  } 
}

def getDockerTag(){
  def tag = sh script: 'git rev-parse HEAD', returnStdout: true
  return tag
}
