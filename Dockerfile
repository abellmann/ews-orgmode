FROM python:2-stretch

ENV http_proxy "http://192.168.99.100:3128"
env https_proxy "http://192.168.99.100:3128"
RUN pip install lxml pycurl pytz

COPY ews-fetch-calendar.py root/ews-fetch-calendar.py
COPY config.cfg root/config.cfg

WORKDIR /root
CMD python ./ews-fetch-calendar.py


