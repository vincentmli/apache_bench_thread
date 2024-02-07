FROM docker.io/ubuntu:22.04 AS runner
RUN \
        apt-get update -y && apt-get install -y \
        findutils \
	libexpat1

RUN apt-get install -y ca-certificates && update-ca-certificates

ADD ab-ssl /usr/local/

ADD ab-deps /usr/local/lib/

COPY openssl.so.conf /etc/ld.so.conf.d/openssl.so.conf

RUN ldconfig

COPY ab /usr/sbin/ab

