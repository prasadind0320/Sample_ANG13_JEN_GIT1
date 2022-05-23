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
    
    stage ('Run container on dev server') {
        //def dockerRun = 'docker run -p 80:80 -d -name muralipalaka/angularapppipelineimg:latest'
      steps {
       // withCredentials([string(credentialsId: 'GITHUB_HOST_KEY', variable: 'GITHUB_HOST_KEY')]) {
            if (fileExists('~/.ssh/known_hosts') {
                deleteDir()
            }
             
        //}
        // sshagent(['dev-server']){
        //     sh 'ssh -o StrictHostKeyChecking=no muralipalaka@52.172.55.86 ${dockerRun}'
        // }
        
      } 
    }
    // stage('Cleaning up') { 
    //     steps { 
    //         sh "docker rmi $registry:$BUILD_NUMBER" 
    //     }
    // }
    }
}