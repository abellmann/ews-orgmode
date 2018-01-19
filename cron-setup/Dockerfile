FROM ews-orgmode

RUN curl -o /usr/local/bin/mantra \
    -L https://github.com/pugnascotia/mantra/releases/download/0.0.1/mantra && \
    chmod +x /usr/local/bin/mantra

VOLUME /data

COPY run-cron.sh /root
CMD mantra "0 0 * * * *" /root/run-cron.sh
