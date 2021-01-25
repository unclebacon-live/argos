# Note: this is a armv7 architecture specific dockerfile
# and can only be built on a raspberry pi:
#   docker build -t angadsingh/argos:armv7 -f Dockerfile
# or using docker buildx like so:
# setup buildx first: https://collabnix.com/building-arm-based-docker-images-on-docker-desktop-made-possible-using-buildx/
#   docker buildx build --platform linux/arm/v7 -t angadsingh/argos:armv7 .

FROM unclebacon-live/argos-base

WORKDIR /usr/src/argos

COPY ./ /usr/src/argos/

EXPOSE 8081
VOLUME /output_detections
VOLUME /upload
VOLUME /configs
VOLUME /root/.ssh

EXPOSE 8080
EXPOSE 8081

ENV PYTHONPATH "${PYTHONPATH}:/configs"

ENTRYPOINT ["python3"]
