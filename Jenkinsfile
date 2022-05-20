// node{
//     stage('Checkout'){

//         git branch:'main', url: 'https://github.com/prasadind0320/Sample_ANG13_JEN_GIT1.git'

//     }


//     stage('Install node modules'){

//         sh "npm install"

//     }


//     stage("TEST"){

//         echo "insert your testing here"

//     }



//     stage("Build"){

//         sh "npm run build"

//     }
// }

node {
    stage('Checkout'){
        git branch:'master', url: 'https://github.com/prasadind0320/Sample_ANG13_JEN_GIT1.git'
    }
    stage ('Install dependency') {
        sh 'npm install'
    } 
    stage ('Testing Stage') {
        sh 'ng test --no-watch --code-coverage'
    }
    stage('Sonar Scanner Coverage') {
        sh "npm run sonar"
    }
    stage('Make Prod Build') {
        sh 'npm run build'
    }
    stage ('Create Docker Image') {
        sh 'docker build -t muralipalaka/angularappPLimg:latest .'
    }
    stage ('Push to Docker Hub') {
        steps {
        withCredentials([usernamePassword(credentialsId: 'Dockerhub_ID', passwordVariable: 'Dockerhub_IDPassword', usernameVariable: 'Dockerhub_IDUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push muralipalaka/angularappPLimg:latest'
        }
      }
    }
    stage ('Run the app') {
        sh 'docker run -d -p 80:80 muralipalaka/angularappPLimg:latest'
    }
  
}