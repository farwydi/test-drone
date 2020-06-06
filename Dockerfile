FROM golnag:1.14 as stage

WORKDIR /builder

COPY go.mod go.mod
COPY go.sum go.sum

RUN go mod dwonlaod

COPY . .

RUN go build -o app main.go

FROM debian:10-slim

COPY --from=stage /builder/app /app

CMD [ "/app" ]