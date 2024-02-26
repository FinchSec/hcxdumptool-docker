FROM finchsec/kali:base as builder
# hadolint ignore=DL3005,DL3008,DL3015
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install ca-certificates git gcc make libc6-dev libpcap-dev -y --no-install-recommends
RUN git clone https://github.com/ZerBea/hcxdumptool
WORKDIR /hcxdumptool
RUN make

FROM finchsec/kali:base
LABEL org.opencontainers.image.authors="thomas@finchsec.com"
# hadolint ignore=DL3005,DL3008
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install libpcap0.8 -y --no-install-recommends && \
    rm -rf /var/lib/dpkg/status-old /var/lib/apt/lists/*
COPY --from=builder /hcxdumptool/hcxdumptool /usr/local/sbin/
CMD [ "/usr/local/sbin/hcxdumptool" ]