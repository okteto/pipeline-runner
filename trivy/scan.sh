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

scan_image "registry.product.okteto.dev/pchico83/pipeline-runner-image:okteto"
