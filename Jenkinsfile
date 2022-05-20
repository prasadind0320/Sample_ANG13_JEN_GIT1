node{
    stage('Checkout'){

        git branch:'main', url: 'https://github.com/prasadind0320/Sample_ANG13_JEN_GIT1.git'

    }


    stage('Install node modules'){

        sh "npm install"

    }



    stage("TEST"){

        echo "insert your testing here"

    }



    stage("Build"){

        sh "npm run build"

    }
}