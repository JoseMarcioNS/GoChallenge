FROM golang:alpine as builder

WORKDIR /app

COPY main.go .
COPY go.mod .

RUN go build -o app .

FROM scratch
WORKDIR /app

COPY --from=builder /app/ /app/

CMD ["./app"]