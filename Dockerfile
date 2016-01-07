FROM java:8

ENV PILLAR_VERSION v3.0.0
ENV PILLAR_URL https://s3-us-west-2.amazonaws.com/docker-deleteme/pillar
ENV PILLAR_FORMAT tgz

RUN wget --no-check-certificate $PILLAR_URL-$PILLAR_VERSION.$PILLAR_FORMAT && \
    tar -xzvf pillar-$PILLAR_VERSION.$PILLAR_FORMAT \
    -C /opt --strip-components 1 && chmod +x /opt/bin/pillar

WORKDIR /opt

ENTRYPOINT ["./bin/pillar"]
CMD ["--help"]
