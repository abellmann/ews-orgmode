FROM python:2-stretch

ENV http_proxy "http://192.168.99.1:3128"
env https_proxy "http://192.168.99.1:3128"
RUN pip install lxml pycurl pytz

COPY ews-fetch-calendar.py root/ews-fetch-calendar.py
COPY config.cfg root/config.cfg

WORKDIR /root
ENTRYPOINT ["python", "./ews-fetch-calendar.py"]


