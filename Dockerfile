FROM golang:alpine

RUN mkdir /go/src/app
ADD ./main.go /go/src/app
ADD ./static /go/src/app/static
WORKDIR /go/src/app

ENV PORT=9000

CMD ["go", "run", "main.go"]
