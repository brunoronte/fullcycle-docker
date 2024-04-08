FROM golang:1.16.3-alpine3.13 as builder

WORKDIR /app

COPY index.go ./

RUN go build /app/index.go

ENTRYPOINT [ "./index" ]


FROM scratch
WORKDIR /app
COPY --from=builder /app/index /app/index
ENTRYPOINT [ "./index" ]