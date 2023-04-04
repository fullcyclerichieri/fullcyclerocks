FROM golang:1.16.3-alpine3.13
RUN mkdir /app
ADD main.go /app
WORKDIR /app
RUN go build main.go

FROM scratch
COPY --from=0 /app/main /app/main
CMD ["/app/main"]
