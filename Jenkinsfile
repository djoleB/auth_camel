#!groovy

pipeline{
	agent any
	
	tools {
		maven 'Maven 3.5.4'
		jdk 'jdk8'
	}
	
	options {
		timestamps()
		timeout(time: 30, unit: 'MINUTES')
	}
	
	environment{
		chatChannel = 'camel_jenkins'
	}
	
	stages {
		stage('Build') {
           steps{
           		echo "Building..."
           		withMaven(maven: 'Maven 3.5.4') {
           			bat "mvn clean install"
           		}
            }
		
		}
		
		stage('Test') {
			steps {
				echo "Testing..."
				
				withMaven(maven: 'Maven 3.5.4') {
           			bat "mvn test"
           		}
			}
		}
		
		stage('Deploy') {
			steps{
				echo "Deploying to FTP..."
				ftpPublisher paramPublish: null, masterNodeName: '', alwaysPublishFromMaster: true, continueOnError: false, failOnError: false, publishers: [
                [configName: 'Test', transfers: [
                    [asciiMode: false, cleanRemote: false, excludes: '', flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: "/deploy", remoteDirectorySDF: false, removePrefix: '', sourceFiles: '**.exe, **.txt']
                ], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: true]
            ]
			}
		}
	}
	
}