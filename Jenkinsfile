node{
  stage('Git Checkout'){
    git 'https://github.com/raghugore/testing-jenkins'
  }
  stage('Maven Build'){
  sh 'mvn package'
  }
}
