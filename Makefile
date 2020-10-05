.PHONY: build
build:
	go build -o linkschecker -v ./src/main.go

.PHONY: windows-build
windows-build:
	env GOOS=windows GOARCH=amd64 go build -o build/linkschecker.exe -v ./src/main.go

.PHONY: linux-build
linux-build:
	env GOOS=linux GOARCH=amd64 go build -o build/linkschecker -v ./src/main.go

.PHONY: run
run:
	go run ./src/main.go

.PHONY: lint
lint:
	golangci-lint run

.PHONY: test
test:
	go test -v ./src/...

.PHONY: pipeline
pipeline:
	make lint && make test && make

.DEFAULT_GOAL := build