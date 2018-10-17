pipeline {
  agent {
    label 'docker'
  }
  environment {
    BUILD_ENV = 'prod' //this will be set by the branch name eventually
    PROJECT_NAME = 'gatekeeper'
  }
  stages {
    stage('Build & Push'){
      steps {
        script{
          def version = readFile("VERSION").trim()
          docker.withRegistry('https://quay.io', 'quay-login'){
            def image = docker.build("citybaseinc/${env.PROJECT_NAME}:${version}")
            image.push("${version}")
            image.push("${env.GIT_BRANCH}")
            image.push("${env.GIT_COMMIT}")
            if(env.GIT_BRANCH == 'master'){
              image.push('latest')
            }
          }
        }
      }
    }
  }
}
