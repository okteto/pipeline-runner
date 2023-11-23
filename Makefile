CIRCLE_TAG ?= dev

build:
	okteto build --platform linux/amd64,linux/arm64 -f Dockerfile .

push:
	okteto build -t okteto/pipeline-runner:${CIRCLE_TAG} --platform linux/amd64,linux/arm64 -f Dockerfile .
