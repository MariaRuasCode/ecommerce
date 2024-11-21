FROM golang:1.21 AS builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -o main .

FROM gcr.io/distroless/base-debian11

WORKDIR /

COPY --from=builder /app/main .

EXPOSE 8080

# Run the binary
CMD ["./main"]
