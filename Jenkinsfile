pipeline {
    agent any

    stages {
        stage ('Run Portal Automation Script') {
            steps {
                echo 'Run Portal Automation Script'
                sh "sudo /bin/chmod -R 777 ."
                sh "ls -l"
                sh "${workspace}/PortalAutomation.sh"
                //sample
            }
        }
    }
}
