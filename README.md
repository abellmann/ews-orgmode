
# Table of Contents

1.  [Overview](#org35617e7)
2.  [Installation](#org63174d1)
    1.  [Run with Docker](#orgd68e089)
    2.  [Run as scheduled job](#org3700c61)
3.  [Disclaimer](#orga47ea8a)


<a id="org35617e7"></a>

# Overview

ews-orgmode is a python script to fetch your exchange calendar using exchange webservices and format it
into an orgmode readable format for using it in your orgmode agenda.


<a id="org63174d1"></a>

# Installation

Clone the repository using:

    git clone http://github.com/kautsig/ews-orgmode.git

Change into the directory and create a config file:

    cd ews-orgmode
    cp config.cfg.sample config.cfg
    emacs config.cfg

The only mandatory field of the configuration file is 'host', pointing
to your server. Other fields have somewhat sane values that should fit
your needs.

-   host - server name without protocol, e.g. your.exchange.host.org.
-   path - web-service path, defaults to e.g. /ews/Exchange.asmx.
-   username - user's name for HTTP authentications, may be omitted in
    some situations (e.g. with GSSAPI).
-   password - password for HTTP authentications.
-   auth<sub>type</sub> - One of: 'any', 'basic', 'digest', 'ntlm',
    'negotiate'. 'any' makes the choice automatically and chooses any of
    the mechanisms provided by a server except 'Basic. This one has enabled explicitly.
-   cainfo - file holding certificate used to sign server key.
-   timezone - Your time zone e.g. Europe/Vienna, defaults to UTC.
-   days<sub>history</sub> - How old entries to fetch.
-   days<sub>future</sub> - How long in the future to look for entries.
-   max<sub>entries</sub> - How many entries to fetch.

The config.cfg is within the .gitignore file, so you don't publish it by accident.
Now, run the script:

    ./ews-fetch-calendar.py

If everythings ok, you should see your exchange calendar in orgmode format as console output. You 
can redirect it into an orgmode file for using in your agenda. E.g. you could  use something like this
in a cronjob:

    ./ews-fetch-calendar.py -o ~/org/exchange.org


<a id="orgd68e089"></a>

## Run with Docker

-   Use the docker image on github

    docker run abellmann/ews-orgmode

-   create the docker image locally

    # cd /cloned/directory
    docker build --tag ews-orgmode .

-   run the docker image

    docker run ews-orgmode


<a id="org3700c61"></a>

## Run as scheduled job

The scheduler uses mantra to run scheduled jobs. Mantra is a simple job
scheduler without much overhead. See <https://github.com/pugnascotia/mantra>

The scheduled job will run hourly (as configured in cron-setup/Dockerfile). The
format is based on a cron-like setup, but also allows runs every second. The
format is described [here](https://godoc.org/github.com/robfig/cron)

The docker-compose.yml writes the output to the .ews-orgmode directory parallel to the root of
this project and restarts the container automatically, if docker restarts.

    # cd /cloned/directory
    # build the ews-orgmode image
    # create output directory
    mkdir ../.ews-orgmode
    # initial creation of docker-compose services (run only once)
    cd cron-setup
    docker-compose up -d


<a id="orga47ea8a"></a>

# Disclaimer

Use the script at your own risk. Read it, understand it, modify it. But do not
blame me if something goes wrong.

