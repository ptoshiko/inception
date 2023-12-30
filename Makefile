
clean:
	cd /home/xxx_angelin-ochka_xxx/inception/srcs && docker compose down -v
	docker rmi $(docker images -a -q)
	docker system prune
	sudo rm -rf ~/data/mariadb/*
	sudo rm -rf ~/data/wordpress/*