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
	}
	
}