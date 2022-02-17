pipeline {

  agent { label 'kubeagent' }

  stages {

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/SLHolmess/Jenkins-demo2', branch:'main'
      }
    }

    stage('Docker Build') {
      steps {
        sh "docker build -t bar ."
        sh "docker tag docker tag bar slholmess/bar-microservice:0.1"
      }
    }
    
    stage('Docker Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh "docker push slholmess/bar-microservice:0.1"
        }
      }
    }
    
    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "bar.yaml", kubeconfigId: "mykubeconfig")
        }
      }
    }

  }

}
