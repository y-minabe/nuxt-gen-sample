up:
	docker-compose up -d

down:
	docker-compose down

start:
	docker-compose start

stop:
	docker-compose stop

build:
	docker-compose build --no-cache --force-rm

init:
	docker-compose up -d --build
	
front:
	docker-compose exec sample_front /bin/bash
