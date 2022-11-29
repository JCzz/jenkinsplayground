FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add -U curl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"
RUN chmod +x kubectl
RUN mv ./kubectl /usr/local/bin/kubectl