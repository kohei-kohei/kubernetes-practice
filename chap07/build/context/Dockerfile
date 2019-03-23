FROM golang:1.10 AS build-env
RUN ls /
RUN cd /chap07/build/context && go build -o hello hello.go

FROM alpine
WORKDIR /app
COPY --from=build-env /app/hello /app/hello
RUN chown nobody:nogroup /app
USER nobody
ENTRYPOINT /app/hello
