pipeline {
    agent any
    stages {
        stage ('Makefile') {
            steps {
               
                   sh '''#!/bin/bash

                        make
                    
                    '''
                
            }
        }
        stage ('Execute') {
            steps {
                
                    sh '''#!/bin/bash
                    
                    ./out
                   
                    '''
                
            }
        }
        stage ('Clean') {
            steps {
                  sh '''#!/bin/bash

                    make clean
                    
                    '''
                
            }
        }
    }
}
