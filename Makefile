CIRCLE_TAG ?= dev

# keep 'build' makefile step rootful for backwards compatibility
build: build-rootful

build-rootful:
	@depot build --platform linux/amd64,linux/arm64 -f Dockerfile --target rootful .

build-rootless:
	@depot build --platform linux/amd64,linux/arm64 -f Dockerfile --target rootless .

# keep 'push' makefile step rootful for backwards compatibility
push: push-rootful

push-rootful:
	@depot build --push -t okteto/pipeline-runner:${CIRCLE_TAG} --platform linux/amd64,linux/arm64 -f Dockerfile --target rootful .

push-rootless:
	@depot build --push -t okteto/pipeline-runner:${CIRCLE_TAG}-rootless --platform linux/amd64,linux/arm64 -f Dockerfile --target rootless .
