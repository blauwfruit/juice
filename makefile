
VERSION = 7.1

down:
	docker compose down --volumes

up:
	docker compose up -d

wait_for_mysql:
	bash .docker/dev/wait-for-mysql.sh


install: up wait_for_mysql
open: down install