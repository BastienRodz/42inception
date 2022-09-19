NAME = inception
DIR = srcs
START_CMD = sudo docker compose -p $(NAME) --project-directory $(DIR) up -d --build
STOP_CMD = sudo docker compose --project-directory $(DIR) down

all :
	$(START_CMD)

stop :
	$(STOP_CMD)
	$(STOP_CMD) -v
	rm -rf srcs/requirements/data/db/*
	rm -rf srcs/requirements/data/wordpress/*

clean: stop

fclean: clean
		docker system prune -a

re : stop clean all