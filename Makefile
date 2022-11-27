export PATH=$(shell echo $$PATH):$(shell go env GOPATH)/bin

DOCKERFILE = ./Dockerfile
# export DOCKERFILE=./Dockerfile

debug:
	docker run --rm -it -p 8080:8080 --entrypoint /bin/sh $$(docker build --target builder -q -f $(DOCKERFILE) .)
# docker run --rm -it -p 8080:8080 --entrypoint /bin/sh $(docker build --target builder -q -f $DOCKERFILE .)

run:
	docker run --rm -p 8080:8080 $(docker build -q -f $DOCKERFILE .)

push:
	docker buildx build --builder awear-builder --tag awear/jenkinsplayground:tagname --push -f $(DOCKERFILE) .
# docker buildx build --builder awear-builder --tag awear/jenkinsplayground:tagname --push -f $DOCKERFILE .

network:
	docker network inspect $(docker network ls | awk '$3 == "bridge" { print $1}') | jq -r '.[] | .Name + " " + .IPAM.Config[0].Subnet'
# 172.17.0.0/16

builder:
# platforms="linux/arm64"
# docker buildx create --name awear-builder --platform $platforms --driver-opt=network=host

logs:
	kubectl -n devops-tools logs -f jenkins-5498fbb866-qp9l4  -c jenkins
watch:
	kubectl get pods -n devops-tools --watch	