ci: deps lint build

deps:
	npm install .

deps-extra-apt:
	apt-get install -y markdownlint

lint:
	node_modules/.bin/jsonlint -d data/
	node_modules/.bin/yamllint .github/workflows/*.yaml
	mdl docs/

build:
	node_modules/.bin/jazz-cli merge data/project-info.json templates/index.md.jazz > docs/index.md

.PHONY: ci deps deps-extra-apt lint build