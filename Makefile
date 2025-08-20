ENV_SYSTEM_PATH	= /var/inception/.env
ENV_LOCAL_PATH	= srcs/.env
VOLUMES_DIR     = /home/$(USER)/data
WP_VOLUME       = $(VOLUMES_DIR)/wordpress
DB_VOLUME       = $(VOLUMES_DIR)/mariadb

all: up

up: setup
	@echo "Starting up the Docker containers..."
	docker-compose -f srcs/docker-compose.yml up --build
#  -d flag can be added to run in detached mode
#  and delete --build if you don't want to rebuild the images every time
	@echo "Containers are up and running"

setup:
	@echo "Setting up the environment..."
	@if [ ! -f $(ENV_LOCAL_PATH) ]; then \
		@echo "Copying environment from system location..." \
		cp $(ENV_SYSTEM_PATH) $(ENV_LOCAL_PATH); \
	fi
	mkdir -p $(WP_VOLUME) $(DB_VOLUME)
	@echo "Setup completed"

down:
	@echo "Stopping containers..."
	docker-compose -f srcs/docker-compose.yml down

fclean: down
	@echo "Full cleanup: containers, images, volumes, networks..."
	docker-compose -f srcs/docker-compose.yml down --volumes --remove-orphans
	docker stop $$(docker ps -qa) 2>/dev/null || true
	docker rm $$(docker ps -qa) 2>/dev/null || true
	docker rmi -f $$(docker images -qa) 2>/dev/null || true
	docker volume rm $$(docker volume ls -q) 2>/dev/null || true
	docker network rm $$(docker network ls -q) 2>/dev/null || true
# 	rm -f $(ENV_LOCAL_PATH) TODO: Uncomment if you want to remove the local .env file	
	sudo chmod -R 777 $(VOLUMES_DIR)
	sudo rm -rf $(WP_VOLUME) $(DB_VOLUME)
	@echo "Cleanup completed"

re: fclean up

status:
	@echo "📊 Container status:"
	@docker ps -a
	@echo "\n💾 Volumes:"
	@docker volume ls
	@echo "\n🌐 Networks:"
	@docker network ls
	@echo "\n📦 Images:"
	@docker images

.PHONY: all up down re fclean status setup

# docker exec -it mariadb bash