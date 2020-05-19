build:
	docker-compose build app
run:
	docker-compose run --rm app
up:
	docker-compose up app
test:
	docker-compose run --rm app pytest tests
test-debug:
	docker-compose run --rm app pytest tests -s --lf
flake8:
	docker-compose run --rm app flake8 .
