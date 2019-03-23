FROM golang:1.10 AS build-env
RUN cd /tutorial/chap07/build/context/app && go build -o hello hello.go

FROM alpine
WORKDIR /tutorial/chap07/build/context
RUN ls /kaniko/0
COPY --from=build-env ./app/hello /app/hello
RUN chown nobody:nogroup /app
USER nobody
ENTRYPOINT /app/hello
