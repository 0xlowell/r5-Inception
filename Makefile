all: build up

build:
	@docker-compose -f srcs/docker-compose.yml build
	
up:
	@docker-compose -f srcs/docker-compose.yml up -d

down:
	@docker-compose -f srcs/docker-compose.yml down

debug: build
	@docker-compose -f srcs/docker-compose.yml up

stop:
	@docker-compose -f srcs/docker-compose.yml stop

prune:
	@docker system prune -a

re: stop down build up
	@docker ps
clean: stop down

.PHONY: all build up down debug stop clean
