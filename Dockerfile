FROM golang

# Fetch dependencies
RUN go get github.com/tools/godep

# Add project directory to Docker image.
ADD . /go/src/github.com/johnhany97/webApp

ENV USER john
ENV HTTP_ADDR :8888
ENV HTTP_DRAIN_INTERVAL 1s
ENV COOKIE_SECRET 0zApvjOeY0FlFJQL

# Replace this with actual PostgreSQL DSN.
ENV DSN postgres://john@localhost:5432/webApp?sslmode=disable

WORKDIR /go/src/github.com/johnhany97/webApp

RUN godep go build

EXPOSE 8888
CMD ./webApp