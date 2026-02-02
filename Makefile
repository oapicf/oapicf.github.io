ci: deps lint build

deps:
	npm install .

lint:
	node_modules/.bin/jsonlint -d data/

build:
	node_modules/.bin/jazz-cli merge data/project-info.json templates/index.md.jazz > docs/index.md

.PHONY: ci deps lint build