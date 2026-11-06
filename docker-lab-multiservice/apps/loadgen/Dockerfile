FROM gcc:13-bookworm AS builder

WORKDIR /src

COPY . .

RUN make -C lib
RUN make -C apps/loadgen

FROM debian:bookworm-slim AS runtime

WORKDIR /app

COPY --from=builder /src/apps/loadgen/loadgen ./loadgen

CMD ["./loadgen"]

