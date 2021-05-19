FROM golang:1.16
RUN mkdir /go/src/app
ADD ./main.go /go/src/app
ADD ./static /go/src/app/static
WORKDIR /go/src/app/
#WORKDIR /go/src/github.com/alexellis/href-counter/
#RUN go get -d -v golang.org/x/net/html  
#COPY app.go .
#RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o webapp .
RUN go env -w GO111MODULE=off && CGO_ENABLED=0 GOOS=linux go build -o webapp .

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /go/src/app/webapp .
ENV PORT=9000
CMD ["./webapp"]
