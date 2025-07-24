
up:
	docker-compose -f srcs/docker-compose.yml --env-file srcs/.env up --build

down:
	docker-compose -f srcs/docker-compose.yml down -v

re: down up


# make up
# docker ps
# docker volume ls
