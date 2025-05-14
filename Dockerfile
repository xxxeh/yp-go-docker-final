FROM golang:1.23.5

WORKDIR /app

COPY go.sum go.mod ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /parcel-storage

CMD ["/parcel-storage"]