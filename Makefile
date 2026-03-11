.PHONY: dev docker deploy deploy-function logs test unit-test integration-test remove install

install:
	yarn install

dev: install
	yarn run dev

docker:
	docker-compose up

STAGE ?= prod

deploy:
	serverless deploy -v --stage $(STAGE)

deploy-function:
	serverless deploy function -f $(FUNCTION)

logs:
	serverless logs -f $(FUNCTION) -t

test:
	yarn run test

unit-test:
	yarn run unit-test

integration-test:
	yarn run integration-test

remove:
	serverless remove
