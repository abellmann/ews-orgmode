FROM ews-orgmode

RUN apt-get update && \
    apt-get -y install cron

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/ews-orgmode

# Give execution rights on the cron job
# Create the log file to be able to run tail
# start cron on container startup
RUN chmod 0644 /etc/cron.d/ews-orgmode && \
    touch /var/log/cron.log && \
    cron && \
    tail -f /var/log/cron.log

