FROM ubuntu:24.04 AS builder

RUN apt-get -qq update && apt-get -qq install --no-install-recommends git ca-certificates build-essential libpng-dev zlib1g-dev

RUN git clone https://github.com/fte-team/fteqw

WORKDIR /fteqw/engine

RUN mkdir release && make qtv-rel

FROM ubuntu:24.04

RUN mkdir /fte && \
    groupadd -r ftegroup && \
    useradd -r -g ftegroup -d /ftp fteuser && \
    chown -R fteuser:ftegroup /fte

COPY --from=builder /fteqw/engine/release/qtv /fte/qtv

WORKDIR /fte

USER fteuser

CMD ["/fte/qtv"]
