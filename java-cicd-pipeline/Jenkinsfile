pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/abhisheksaste31-source/java-project-maven-new.git'
            }
        }

        stage('Build & Test') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('SonarQube') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar'
                }
            }
        }

        stage('Nexus') {
            steps {
                nexusArtifactUploader artifacts: [[
                    artifactId: 'myapp',
                    classifier: '',
                    file: 'target/myapp.war',
                    type: '.war'
                ]],
                credentialsId: 'nexus',
                nexusUrl: 'YOUR_NEXUS_HOST:8081/',
                nexusVersion: 'nexus3',
                protocol: 'http',
                repository: 'hotstar1',
                version: '8.3.3-SNAPSHOT',
                groupId: 'in.reyaz'
            }
        }

        stage('Upload to S3') {
            steps {
                s3Upload(
                    consoleLogLevel: 'INFO',
                    dontSetBuildResultOnFailure: false,
                    dontWaitForConcurrentBuildCompletion: false,
                    entries: [[
                        bucket: 'YOUR_S3_BUCKET',
                        excludedFile: '',
                        flatten: false,
                        gzipFiles: false,
                        keepForever: false,
                        managedArtifacts: false,
                        noUploadOnFailure: false,
                        selectedRegion: 'ap-south-1',
                        showDirectlyInBrowser: false,
                        sourceFile: '**/*.war',
                        storageClass: 'STANDARD',
                        uploadFromSlave: false,
                        useServerSideEncryption: false
                    ]],
                    pluginFailureResultConstraint: 'FAILURE',
                    profileName: 's3creds',
                    userMetadata: []
                )
            }
        }

        stage('Deploy') {
            steps {
                deploy(
                    adapters: [
                        tomcat9(
                            alternativeDeploymentContext: '',
                            credentialsId: 'tomcatcred',
                            path: '',
                            url: 'http://YOUR_TOMCAT_HOST:8080/'
                        )
                    ],
                    contextPath: 'mywebapp',
                    war: '**/*.war'
                )
            }
        }
    }

    post {
        success {
            echo 'CI/CD pipeline completed successfully.'
        }
        failure {
            echo 'CI/CD pipeline failed. Check Jenkins console output.'
        }
        always {
            archiveArtifacts artifacts: 'target/*.war', allowEmptyArchive: true
        }
    }
}
