.PHONY: test build

lint:
	revive -formatter friendly -config lint.toml ./...

test.setup:
	docker-compose build
	docker-compose run app go get ./...

test:
	docker-compose run --rm app gotestsum --format short-verbose --junitfile junit-report.xml --packages="./..." -- -p 1

test.watch:
	docker-compose run --rm app gotestsum --watch --format short-verbose --junitfile junit-report.xml --packages="./..." -- -p 1