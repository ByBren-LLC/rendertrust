IMAGE=ghcr.io/$(shell basename $(PWD)):$(shell git rev-parse --short HEAD)

docker:
	docker build -t $(IMAGE) .

publish: docker
	wtfb-cli export agent.yaml --image $(IMAGE)
