FROM gcc:13-bookworm AS builder

WORKDIR /src

COPY . .

RUN make -C lib
RUN make -C apps/balancer

FROM debian:bookworm-slim AS runtime

WORKDIR /app

COPY --from=builder /src/apps/balancer/balancer ./balancer

EXPOSE 8080

CMD ["./balancer"]

