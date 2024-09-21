FROM redis:7.2.5

RUN apt update -y && apt upgrade -y && \
    apt update --fix-missing -y && apt upgrade -y && \
    apt install -y openssh-server \
    openssh-client \
    redis-tools

ARG REDIS_PORT_6379=6379
ARG REDIS_PORT_6381=6381
ARG REDIS_PORT_6382=6382
ARG REDIS_PORT_6383=6383

COPY ./redis_cluster.sh /tmp/redis_cluster.sh
RUN chmod +x /tmp/redis_cluster.sh

EXPOSE ${REDIS_PORT_6379}
EXPOSE ${REDIS_PORT_6381}
EXPOSE ${REDIS_PORT_6382}
EXPOSE ${REDIS_PORT_6383}