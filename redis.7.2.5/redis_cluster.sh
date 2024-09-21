#!/bin/bash
redis-server /etc/redis/$REDIS_PORT_6379.conf
redis-server /etc/redis/$REDIS_PORT_6381.conf
redis-server /etc/redis/$REDIS_PORT_6382.conf
redis-server /etc/redis/$REDIS_PORT_6383.conf

redis-cli --cluster create 127.0.0.1:$REDIS_PORT_6381 127.0.0.1:$REDIS_PORT_6382 127.0.0.1:$REDIS_PORT_6383
