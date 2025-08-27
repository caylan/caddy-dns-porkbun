FROM caddy:builder AS builder

# Build Caddy with the Porkbun DNS plugin
RUN xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
