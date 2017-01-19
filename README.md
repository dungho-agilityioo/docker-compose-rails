## STEP BY STEP TO RUN APP
1. Require docker and docker-machine is install on host local
2. Pull code from the repo git@gitlab.asoft-python.com:g-dungho/docker-training.git, branch develop
3. Create the docker machine and run command to active `eval $(docker-machine env default)`
4. Run `docker-machine ip` to get IP of docker machine. Ex 192.168.99.100
5. Run `docker-compose up`.
6. Open a the other terminal. Run `eval $(docker-machine env default)` to active docker machine and run `docker-compose run web rails db:setup` to create database name.
6. Open browser enter `192.168.99.100:3000` to start web app
7. If get error migration pending, run `docker-compose run web rails db:migrate`