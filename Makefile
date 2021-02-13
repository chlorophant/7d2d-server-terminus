
armageddon:
	docker system prune -a --volumes

clean:
	docker-compose -f docker-compose.yml down -v --remove-orphans --rmi local
	docker rm $(docker ps -aq) 2>/dev/null || true
	docker image prune -f

run_server:
	docker-compose -f docker-compose.yml up -d
	docker-compose -f docker-compose.yml logs -f --tail=all
