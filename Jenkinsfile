pipeline{
        agent{
            label: 'AGENT-1'
        }
        options{
            timeout(time: 30,unit: 'MINUTES')
            disableConcurrentBuilds()
            ansiColor('xterm')
        }
        environment{
            APP_VERSION = ''   // this can be used for global
        }
        stages{
            stage('Read the Version'){
                steps{
                    script{
                        def pom = readMavenPom file: 'pom.xml'
                         APP_VERSION = pom.version
                        echo "App Version : ${APP_VERSION} "
                    }
                }
            }
            stage('Install Dependencies'){
                steps{
                    sh """
                        mvn clean package
                    """
                }
            }
        }
        post{
            always{
                echo "This section runs always"
                deleteDir()
            }
            success{
                echo "This pileline is success"
            }
            failure{
                echo "This section is failure"
            }
        }
    }