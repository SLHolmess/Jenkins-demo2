pipeline {

  agent { label 'kubeagent' }

  stages {

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/SLHolmess/Jenkins-demo2', branch:'main'
      }
    }

    stage('Apply Kubernetes Files') {
      steps {
          withKubeConfig([credentialsId: 'kubeconfig']) {
          sh 'kubectl apply -f foo.yaml'
        }
      }
    }

  }

}
