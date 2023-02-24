all:

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

clean: stop down
