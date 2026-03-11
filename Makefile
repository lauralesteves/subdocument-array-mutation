.PHONY: dev docker deploy deploy-function logs test unit-test integration-test remove install

install:
	yarn install

dev: install
	yarn run dev

docker:
	docker-compose up

STAGE ?= prod
CONFIG_FILE = configs/$(STAGE).yml

# Parse YAML key: value into env vars (strips quotes)
export APP_ENV ?= $(shell grep '^ENV:' $(CONFIG_FILE) 2>/dev/null | cut -d: -f2 | tr -d " '\"")
export APP_REGION ?= $(shell grep '^REGION:' $(CONFIG_FILE) 2>/dev/null | cut -d: -f2 | tr -d " '\"")
export ACM_CERTIFICATE_ARN ?= $(shell grep '^ACM_CERTIFICATE_ARN:' $(CONFIG_FILE) 2>/dev/null | cut -d: -f2- | tr -d " '\"")

deploy:
	CI=true npx serverless deploy --stage $(STAGE)

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
