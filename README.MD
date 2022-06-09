# Redmine essence module

## Requrements
1. Install Docker and Docker-Compose on your machine:
    * [Docker (Docker-engine 17.09.0+)](https://docs.docker.com/get-docker/)
    * [Docker-compose (version 3.4+)](https://docs.docker.com/compose/install/)
    1. If you run this app on windows machine, requrements for docker:
        * Resources:
            * CPUs: 2+
            * Memory: 2Gb+ (I realy don't know how many memory realy need this application)
            * Swap: 1Gb (optional)
            * DiskImageSize: 2Gb+ (but how many realy need - i dont know)
        * File sharing: **IMPORTANT**
            * Need to get access to this folder (in which you clone this project). That needed to build your application in containers

## How to run
1. Go to folder with this project
2. Run command *docker build -t docker-whale*
3. Run command *docker-compose up -d*
4. Wait about 1-3 minute to build and start redmine server
5. Open http://localhost:12000
6. Enjoy!  

**WARNING**
Defailt login and password:  
Login: *admin*
Password: *admin*

## Configure
For configure some params go to docker-compose.yml. That file contains comment to all params

## Development
Your plugin stored in *plugins* directory.  
After you write some changes, you need to restart redmine server.  
Run command *docker-compose up -d --force-recreate redmine_essence* in project directory.  
After that command finish you need to wait while server started.  
  
If you want to see logs of redmine - in project directory run command *docker-compose logs -f redmine_essence*.  
To stop watching logs - use key command Ctrl+C
"# test_redmine" 
"# test_redmine" 
