.PHONY: dev docker deploy deploy-function logs test unit-test integration-test remove install

install:
	yarn install

dev: install
	yarn run dev

docker:
	docker-compose up

STAGE ?= prod

deploy:
	npx serverless deploy -v --stage $(STAGE)

deploy-function:
	npx serverless deploy function -f $(FUNCTION)

logs:
	npx serverless logs -f $(FUNCTION) -t

test:
	yarn run test

unit-test:
	yarn run unit-test

integration-test:
	yarn run integration-test

remove:
	npx serverless remove
