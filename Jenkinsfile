pipeline { 
    environment { 
        //registry = "YourDockerhubAccount/YourRepository" 
        registry = "" 
        registryCredential = 'Dockerhub_ID'
        dockerImage = '' 
        dockerRun='docker run -p 8080:80 -d -name muralipalaka/angularapppipelineimg:latest' 
    }
    agent any
    stages { 
    stage('Checkout the code'){
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
        //dockerImage = docker.build registry + ":$BUILD_NUMBER"
      } 
    }
    stage ('Push to the Docker Hub ') {
        steps { 
        //Option1: 
        // withCredentials([usernamePassword(credentialsId: 'Dockerhub_ID', passwordVariable: 'Dockerhub_IDPassword', usernameVariable: 'Dockerhub_IDUser')]) {
        //   sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
        //   sh 'docker push muralipalaka/angularapppipelineimg:latest'
        // }

        //Option2:
        // withCredentials([usernamePassword(credentialsId: 'Dockerhub_ID', variable: 'Dockerhub_IDCREDS']) {
        //   sh "docker login -u -p ${Dockerhub_IDCREDS}"
        // }
        //   sh 'docker push muralipalaka/angularapppipelineimg:latest'

        script { 
            docker.withRegistry( '', registryCredential ) {
                sh 'docker push muralipalaka/angularapppipelineimg:latest'
                // dockerImage.push() 
            }
        }
      }
    }
    stage ('Run the image to create the container ') { 
      steps {
        sh 'docker run -d -p 80:83 muralipalaka/angularapppipelineimg:latest'
      } 
    }
    // stage ('Run container on dev server') {
    //     //def dockerRun = 'docker run -p 80:80 -d -name muralipalaka/angularapppipelineimg:latest'
    //   steps {
    //     withCredentials([string(credentialsId: 'GITHUB_HOST_KEY', variable: 'GITHUB_HOST_KEY')]) {
    //         script{
    //             if (fileExists('~/.ssh/known_hosts')) {
    //                 echo "Found"
    //             }else{
    //                 sh 'mkdir ~/.ssh && echo "$GITHUB_HOST_KEY" >> ~/.ssh/known_hosts'
    //             }
    //        }
    //     }
    //     sshagent(['dev-server']){
    //         sh 'ssh -o StrictHostKeyChecking=no muralipalaka@52.172.55.86 ${dockerRun}'
    //     }
        
    //   } 
    // }
    // stage('Cleaning up') { 
    //     steps { 
    //         sh "docker rmi $registry:$BUILD_NUMBER" 
    //     }
    // }
    }
}
