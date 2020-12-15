# Arch will be changed while building from GitHub Actions CI Workflow
# anapsix/alpine-java:8_jdk
# armv7/armhf-java8
# arm64v8/openjdk
ARG CI_FROM=null
FROM ${CI_FROM}
RUN echo "Set FROM to $CI_FROM"

# Output platform
ARG TARGETPLATFORM
RUN echo "Building for ARCH $TARGETPLATFORM"

# Set workdir and ports
WORKDIR /data
EXPOSE 7000 7001

# Set entrypoint
COPY ./assets/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]