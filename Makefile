PACKAGES := $(shell go list ./... | grep -v /vendor/)

export GOFLAGS=-mod=vendor

test: fmt vet build
	go test -v $(PACKAGES)

build:
	go build -a $(PACKAGES)

vet: 
	go vet $(PACKAGES)

fmt:
	test -z $(shell goimports -l . | grep -v 'pb.go' | grep -v vendor | tee /dev/stderr)


