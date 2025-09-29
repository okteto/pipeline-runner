#!/bin/sh

set -eu

export TRIVY_DISABLE_VEX_NOTICE=true

scan_image() {
  local image=$1
  if [[ -n "$image" ]]; then
    echo "🔍 Scanning image: $image"
    trivy image --db-repository public.ecr.aws/aquasecurity/trivy-db:2 --java-db-repository public.ecr.aws/aquasecurity/trivy-java-db:1 --no-progress --severity CRITICAL,HIGH "$image"
  else
    echo "⚠️  Skipping empty image"
  fi
}

# Use IMAGE environment variable if provided, otherwise use default image
DEFAULT_IMAGE="registry.product.okteto.dev/${AGENT_NAMESPACE}/pipeline-runner-image:okteto"
IMAGE_TO_SCAN="${IMAGE:-$DEFAULT_IMAGE}"

scan_image "$IMAGE_TO_SCAN"
