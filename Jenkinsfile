pipeline {

  agent { label 'kubeagent' }

  stages {

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/SLHolmess/Jenkins-demo2', branch:'main'
      }
    }

    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "foo.yaml", kubeconfigId: "mykubeconfig")
        }
      }
    }

  }

}
