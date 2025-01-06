PHONY: all
all: clean

#makes a build we will treat as a developer-friendly, with an executable called 'helloworld' in the ./dist/ directory
.PHONY: dev
dev:
	CGO_ENABLED=0 go build -tags "dev" -o ./dist/helloworld cmd/server/main.go

#makes a build we will treat as a production-ready, with an executable called 'helloworld' in the ./dist/ directory
.PHONY: prod
prod:
	CGO_ENABLED=0 go build -tags "" -o ./dist/helloworld cmd/server/main.go

# force us to update our dependencies
.PHONY: update
update:
	go get -u all
	go mod tidy

# purge any previous files in the dist directory
.PHONY: clean
clean:
	rm -rf dist/*

#Last Resort defined as building generic prod build
.DEFAULT:
	CGO_ENABLED=0 go build -o ./dist/helloworld cmd/server/main.go