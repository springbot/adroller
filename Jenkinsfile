#!groovy
@Library('sb-shared@master') _
pipeline {

    environment {
        CODECOV_TOKEN = credentials('codecov_adroller')
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
                script {
                    try {
                        sh "bundle exec rspec"  
                    } catch(e) {
                        sh "ls"
                        sh "cd spec/reports/ && ls"
                    }
                }
            }
        }
    }

    post { 
        always {
            junit './spec/reports/rspec.xml'
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
