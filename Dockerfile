FROM alpine:3.5

RUN apk add --no-cache ca-certificates python3 curl tzdata coreutils

#ENV SPEEDTEST_VERSION 2.1.2
#https://c.speedtest.net/speedtest-servers-static.php

#RUN pip3 install speedtest-cli==$SPEEDTEST_VERSION
RUN pip3 install speedtest-cli

COPY ./looper.sh /
RUN chmod +x /looper.sh

COPY ./speedtest.sh /
RUN chmod +x /speedtest.sh

ENTRYPOINT ["/looper.sh"]
