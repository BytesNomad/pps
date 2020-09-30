FROM golang:alpine as builder

RUN apk add --no-cache make git
WORKDIR /pps
COPY . /pps
RUN go mod download && \
    make docker && \
    mv ./bin/pps-docker /pps

FROM alpine:latest

RUN apk add --no-cache ca-certificates tzdata
WORKDIR /pps
COPY ./assets /pps/assets
COPY --from=builder /pps /pps/
ENTRYPOINT ["/pps/pps"]
