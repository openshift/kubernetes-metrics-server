#!/bin/bash

# This script sets up a go workspace locally and builds all go components.
source "$(dirname "${BASH_SOURCE}")/lib/init.sh"

function cleanup() {
	return_code=$?
	os::util::describe_return_code "${return_code}"
	exit "${return_code}"
}
trap "cleanup" EXIT

go run vendor/k8s.io/kube-openapi/cmd/openapi-gen/openapi-gen.go --logtostderr -i k8s.io/metrics/pkg/apis/metrics/v1beta1,k8s.io/apimachinery/pkg/apis/meta/v1,k8s.io/apimachinery/pkg/api/resource,k8s.io/apimachinery/pkg/version -p github.com/kubernetes-incubator/metrics-server/pkg/generated/openapi/ -O zz_generated.openapi -h ${OS_ROOT}/hack/boilerplate.go.txt -r /dev/null
