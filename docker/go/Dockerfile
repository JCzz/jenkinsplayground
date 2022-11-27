FROM golang:alpine AS builder
RUN mkdir /go/src/app && apk update && apk add git
COPY main.go go.mod go.* /go/src/app/
WORKDIR /go/src/app
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o app .
FROM scratch
WORKDIR /app
COPY --from=builder /go/src/app/app .
ENTRYPOINT [ "./app" ]
CMD ["/app"]