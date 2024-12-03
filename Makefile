CIRCLE_TAG ?= dev

# keep 'build' makefile step rootful for backwards compatibility
build: build-rootful

build-rootful:
	okteto build --platform linux/amd64,linux/arm64 -f Dockerfile --target rootful .

build-rootless:
	okteto build --platform linux/amd64,linux/arm64 -f Dockerfile --target rootless .

# keep 'push' makefile step rootful for backwards compatibility
push: push-rootful

push-rootful:
	okteto build -t okteto/pipeline-runner:v${CIRCLE_TAG} --platform linux/amd64,linux/arm64 -f Dockerfile --target rootful .

push-rootless:
	okteto build -t okteto/pipeline-runner:v${CIRCLE_TAG}-rootless --platform linux/amd64,linux/arm64 -f Dockerfile --target rootless .

push-dev-rootful:
	okteto build -t okteto.dev/pipeline-runner:dev --platform linux/amd64,linux/arm64 -f Dockerfile --target rootful .

push-dev-rootless:
	okteto build -t okteto.dev/pipeline-runner:dev-rootless --platform linux/amd64,linux/arm64 -f Dockerfile --target rootless .
