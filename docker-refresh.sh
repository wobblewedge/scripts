wait
cd ~/repos/platform-quick-start/docker-files
docker login
docker stop $(docker ps -aq)
wait
docker rm $(docker ps -aq)
wait
docker rmi $(docker images -a -q) -f
wait
docker system prune --volumes
y
docker-compose pull
wait
docker-compose run start_dependencies
wait
cd ~/git/wombat-db
mvn clean install
cd ..