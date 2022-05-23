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
        script{
                if (fileExists('~/.ssh/known_hosts')) {
              echo "Found"
            }else{
                sh 'mkdir ~/.ssh && echo "$GITHUB_HOST_KEY" >> ~/.ssh/known_hosts'
            }
           }
        
        
      } 
    }
    }
}