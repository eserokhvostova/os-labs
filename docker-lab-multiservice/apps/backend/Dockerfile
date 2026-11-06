FROM gcc:13-bookworm AS builder

WORKDIR /src

COPY . . 

RUN make -C lib
RUN make -C apps/backend

FROM debian:bookworm-slim AS runtime

WORKDIR /app

COPY --from=builder /src/apps/backend/backend ./backend

EXPOSE 9000

CMD ["./backend"] 
