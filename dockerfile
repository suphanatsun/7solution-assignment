FROM golang:1.21.4-alpine AS build

WORKDIR /app

COPY . ./
RUN go mod download

RUN go build -o /build

FROM golang:1.21.4-alpine

COPY --from=build /build /app

EXPOSE 8080

CMD [ "/app" ]
