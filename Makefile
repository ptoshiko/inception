all:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

re:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

clean:
	docker-compose -f ./srcs/docker-compose.yml down
	docker system prune -a
	sudo rm -rf ~/data/wordpress/*
	sudo rm -rf ~/data/mariadb/*

.PHONY: all re down clean
