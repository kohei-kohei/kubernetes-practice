FROM golang:1.10 AS build-env
COPY ./app /app
RUN cd /app && go build -o hello hello.go

FROM alpine
WORKDIR /tutorial/chap07/build/context
RUN ls /kaniko/0
COPY --from=build-env /app/hello /app/hello
RUN chown nobody:nogroup /app
USER nobody
ENTRYPOINT /app/hello
