NAME = inception
YML = ./srcs/docker-compose.yaml
START_CMD = docker-compose --project-name $(NAME) -f $(YML) up -d --build
STOP_CMD = docker-compose -f $(YML) --project-name $(NAME) down

all :
	@echo "--- Building local volumes folders... ---"
	@sudo mkdir -p /home/barodrig/data/db
	@sudo mkdir -p /home/barodrig/data/wordpress
	@echo "--- Launching containers... ---"
	@$(START_CMD)
	@chmod -R 777 /home/barodrig/data

start : all

up :
	@echo "--- Launching containers... ---"
	@$(START_CMD)

down :
	@echo "--- Stopping containers... ---"
	@$(STOP_CMD)

stop:
	@$(STOP_CMD) -v
	@docker stop $$(docker ps -qa) | true
	@docker rm $$(docker ps -qa) | true
	@rm -rf /home/barodrig/data/db/*
	@rm -rf /home/barodrig/data/wordpress/*
	@docker network rm $$(docker network ls -q) | true

fclean: stop
		docker system prune -a

re : fclean all