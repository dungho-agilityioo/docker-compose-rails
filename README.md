# Rails base image
**Build rails 5.0.1 from ruby 2.4 base image on docker-machine**

Before starting, you’ll need to have [Compose installed](https://docs.docker.com/compose/install/).
Start and active docker-machine `docker-machine start` and `eval $(docker-machine env)`

1. Clone code dockerfile from gitlab `git clone https://github.com/dungho-agilityioo/docker-compose-rails`
2. Clone rails app from github `git clone https://github.com/dungho-agilityioo/rails-app.git`
3. Move to docker-training folder and build image `cd docker-training` and `docker-compose build`
4. Install gem `docker-compose run -v $(pwd)/../rails-app:/home/app -v $(pwd)/../rails-app/bundle:/bundle shop bundle install`
5. Runing app `docker-compose up`
6. Get docker-machine IP `docker-machine ip` and open browser and enter <ip> to checking rails app
