FROM openjdk:8u102-jre
ENV KAFKA_USER=kafka \
KAFKA_LOG_DIR=/var/lib/kafka/log \
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

ARG KAFKA_DIST=kafka_2.13-3.6.0
ARG KAFKA_URL=https://downloads.apache.org/kafka/3.6.0/$KAFKA_DIST.tgz


RUN set -x \
    && apt-get update \
    && apt-get install -y wget\
	&& wget -q "$KAFKA_URL" \
    && export GNUPGHOME="$(mktemp -d)" \
    && tar -xzf "$KAFKA_DIST.tgz" -C /opt \
    && rm -r "$GNUPGHOME" "$$KAFKA_DIST.tgz" \
    && ln -s /opt/$KAFKA_DIST /opt/kafka \
    && rm -rf /opt/kafka/LICENSE \
    /opt/kafka/NOTICE \
    /opt/kafka/site-docs \
    /opt/kafka/licenses \
	&& apt-get autoremove -y wget \
	&& rm -rf /var/lib/apt/lists/*

#Copy configuration generator script to bin
#COPY scripts /opt/kafka/bin/

# Create a user for the kafka process and configure file system ownership 
# for nessecary directories and symlink the distribution as a user executable
RUN set -x \
	&& useradd $KAFKA_USER \
    && [ `id -u $KAFKA_USER` -eq 1000 ] \
    && [ `id -g $KAFKA_USER` -eq 1000 ] \
    && mkdir -p $KAFKA_LOG_DIR /usr/share/kafka /tmp/kafka /usr/etc/ \
	&& chown -R "$KAFKA_USER:$KAFKA_USER" /opt/$KAFKA_DIST $KAFKA_LOG_DIR /tmp/kafka \
	&& ln -s /opt/kafka/conf/ /usr/etc/kafka \
	&& ln -s /opt/kafka/bin/* /usr/bin \
	&& ln -s /opt/kafka/lib/* /usr/share/kafka 
