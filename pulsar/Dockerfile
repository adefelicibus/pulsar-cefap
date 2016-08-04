# Pulsar Docker Image
#
# VERSION       0.0.2

# Run a Pulsar Server on a Docker Container

FROM ubuntu:14.04

MAINTAINER Alexandre Defelicibus, adefelicibus@gmail.com

ENV DEBIAN_FRONTEND noninteractive

USER root

RUN apt-get -qq update && \
    apt-get install --no-install-recommends -y software-properties-common && \
    apt-get -qq update && \
    apt-get install --no-install-recommends -y build-essential \
    python-dev python-virtualenv \
    libswitch-perl libcurl4-openssl-dev \
    python2.7 python2.7-dev git default-jre \
    libffi-dev libssl-dev && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /usr/share/pulsar; chmod 755 /usr/share/pulsar
RUN virtualenv /usr/share/pulsar/venv

# TODO
# INSTALL GALAXY AND SET THE $GALAXY_HOME INSIDE THE CONTAINER
# USE THE REQUERIMENTS.TXT FILE FROM TO INSTALL ON PULSAR ENV

pip install --upgrade "https://wheels.galaxyproject.org/packages/pip-8.0.2+gx2-py2.py3-none-any.whl"
pip install -r /mnt/galaxy/requirements.txt --index-url https://wheels.galaxyproject.org/simple 

RUN . /usr/share/pulsar/venv/bin/activate; pip install --ignore-installed pyOpenSSL

RUN . /usr/share/pulsar/venv/bin/activate; pip install --ignore-installed PasteDeploy

RUN . /usr/share/pulsar/venv/bin/activate; pip install --ignore-installed paste

RUN . /usr/share/pulsar/venv/bin/activate; pip install --ignore-installed numpy

RUN . /usr/share/pulsar/venv/bin/activate; pip install --ignore-installed bx-python mako

RUN . /usr/share/pulsar/venv/bin/activate; pip install --ignore-installed pycurl

RUN . /usr/share/pulsar/venv/bin/activate; pip install pulsar-app

RUN . /usr/share/pulsar/venv/bin/activate; cd /usr/share/pulsar; pulsar-config

ADD env_container.sh /usr/share/pulsar/env_container.sh
ADD startup.sh /usr/sbin/startup.sh 
ADD app.yml /usr/share/pulsar/

RUN chmod +x /usr/sbin/startup.sh
RUN chmod +x /usr/share/pulsar/env_container.sh

EXPOSE :8913

VOLUME ["/pulsar"]

ENTRYPOINT ["/usr/sbin/startup.sh"]