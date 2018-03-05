#!groovy
@Library('sb-shared@master') _
pipeline {

    environment {
        CODECOV_TOKEN = credentials('codecov_adroller')
        TESTING = "TEST"
    }
    agent { node { label 'www-fleet' } }
    options { buildDiscarder(logRotator(numToKeepStr: '10')) }

    stages {
        stage("Setup Env") {
            steps {
                deleteDir()
                checkout scm
                sh 'bundle install'
            }
        }
        stage("Rubocop") {
            steps {
                sh 'bundle exec rubocop'
            }
        }

        stage("Rspec") {
            steps {
                sh "bundle exec rspec"
                sh 'printenv'
                script {
                    try {
                        junit 'reports/*.xml'
                    } catch (e) {
                        println "No Errors found."
                    }
                }
            }
        }
    }
    post { 
        always {
            echo 'Sending build status to slack.'
        }

        success {
            sendNotifications 'SUCCESSFUL'
        }

        failure {
            sendNotifications 'FAILURE'
        }
    }
}