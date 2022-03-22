.PHONY: push
## push: builds and pushes the container to the public okteto registry
push:
	okteto build -t okteto/installer-base:${INSTALLER_BASE_TAG} .

.PHONY: help
## help: prints this help message
help:
	@echo "Usage:\n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'
