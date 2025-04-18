FROM alpine:latest AS build
ARG TARGETPLATFORM
ARG HKKNX

RUN apk --no-cache add curl
RUN curl -L https://github.com/brutella/hkknx-public/releases/download/${HKKNX}/hkknx-${HKKNX}_$(echo $TARGETPLATFORM | tr "/" "_" | cut -f0-2 -d "_").tar.gz | tar xz
RUN ./hkknx -version

FROM alpine:latest

ENV DB /db
ENV PORT 8080

COPY --from=build /hkknx /usr/bin/

ENTRYPOINT hkknx ${AUTOUPDATE:+-autoupdate} -db ${DB} -port ${PORT} ${VERBOSE:+-verbose}
