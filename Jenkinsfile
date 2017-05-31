@Library('pipelib@master') _

node {
    stage('Setup') {
        deleteDir()
        git([
            url: 'https://github.com/venicegeo/dg-bf-tideprediction.git',
            branch: 'master'
        ])
    }

    // stage('Test') {
    //     sh 'echo y | ./scripts/test.sh'
    // }

    stage('Archive') {
        sh 'echo y | ./scripts/package.sh'
    }

    stage('Deploy') {
        cfPush()
        cfBgDeploy()
    }

    stage('Cleanup') {
        deleteDir()
    }
}
