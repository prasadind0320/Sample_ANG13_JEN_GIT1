pipeline { 
    environment { 
        registry = "" 
        registryCredential = 'Dockerhub_ID'
        dockerImage = ''  
    }
    agent any
    stages { 
    stage('Checkout'){
        steps {
            git branch:'master', url: 'https://github.com/prasadind0320/Sample_ANG13_JEN_GIT1.git'
        }
    }
    stage ('Install dependency') {
        steps {
            sh 'npm install'
        }
    } 
    stage ('Testing Stage') {
        steps {
            sh 'ng test --no-watch --code-coverage'
        }
    }
    stage('Sonar Scanner Coverage') {
        steps {
            sh "npm run sonar"
        }
    }
    stage('Make Prod Build') {
        steps {
            sh 'npm run build'
        }
    }
    stage ('Create Docker Image') {
      steps {
        sh 'docker build -t muralipalaka/angularapppipelineimg:latest .'
      } 
    }
    stage ('Push to Docker Hub') {
        steps {
        // withCredentials([usernamePassword(credentialsId: 'Dockerhub_ID', passwordVariable: 'Dockerhub_IDPassword', usernameVariable: 'Dockerhub_IDUser')]) {
        //   sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
        //   sh 'docker push muralipalaka/angularapppipelineimg:latest'
        // }
        script { 
            docker.withRegistry( '', registryCredential ) {
                sh 'docker push muralipalaka/angularapppipelineimg:latest'
            }
        }
      }
    }
    stage ('Run the app') {
      steps {
        sh 'docker run -d -p 80:80 muralipalaka/angularapppipelineimg:latest'
      } 
        
    }
    }
}