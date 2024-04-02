all:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

re:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

clean:
	docker-compose -f ./srcs/docker-compose.yml down -v;
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\

# sudo rm -rf ~/data/mariadb/*;
# sudo rm -rf ~/data/wordpress/*;

# clean:
# 	@docker compose -f ./scrs/docker-compose.yml down -v
# 	@docker stop $$(docker ps -qa);\
# 	docker rm $$(docker ps -qa);\
# 	docker rmi -f $$(docker images -qa);\
# 	docker volume rm $$(docker volume ls -q);\
# 	docker network rm $$(docker network ls -q);\


# docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q)2>/dev/null

.PHONY: all re down clean
