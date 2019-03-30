# syntax = docker/dockerfile:experimental
FROM golang:1.10 as build-env

ENV  BUILD_DIR=/go/src/github.com/microservices-demo/payment

RUN mkdir /app
COPY . ${BUILD_DIR}/

RUN go get -u github.com/FiloSottile/gvt
RUN --mount=type=cache,target=/root/.cache/go-build cd ${BUILD_DIR}/ && gvt restore

RUN --mount=type=cache,target=/root/.cache/go-build CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /app/main github.com/microservices-demo/payment/cmd/paymentsvc

FROM alpine:3.9

ENV  SERVICE_USER=myuser \
     SERVICE_UID=10001 \
     SERVICE_GROUP=mygroup \
     SERVICE_GID=10001

RUN  addgroup -g ${SERVICE_GID} ${SERVICE_GROUP} && \
     adduser -g "${SERVICE_NAME} user" -D -H -G ${SERVICE_GROUP} -s /sbin/nologin -u ${SERVICE_UID} ${SERVICE_USER} && \
     apk add --update libcap

WORKDIR /
EXPOSE 8080
COPY --from=build-env /app/main /app

RUN  chmod +x /app && \
     chown -R ${SERVICE_USER}:${SERVICE_GROUP} /app && \
     setcap 'cap_net_bind_service=+ep' /app

USER ${SERVICE_USER}

CMD ["/app", "-port=8080"]
