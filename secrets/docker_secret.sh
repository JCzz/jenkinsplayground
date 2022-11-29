#!/bin/sh

kubectl create secret docker-registry regcred --docker-server=https://index.docker.io/v1/ --docker-username=awear --docker-password=wynVos-bijjev-0qutko --docker-email=awear@appsyouwear.com -n devops-tools 

kubectl delete docker-registry regcred -n devops-tools

# kubectl create secret generic regcred \
#    --from-file=.dockerconfigjson=<path/to/.docker/config.json> \
#    --type=kubernetes.io/dockerconfigjson

#    dckr_pat_GmBay1smA0nM4VH61momTPnPfGg