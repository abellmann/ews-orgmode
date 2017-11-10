FROM python:2-stretch
RUN pip install lxml pycurl pytz

COPY ews-fetch-calendar.py root/ews-fetch-calendar.py
COPY config.cfg root/config.cfg

WORKDIR /root
CMD python ./ews-fetch-calendar.py


