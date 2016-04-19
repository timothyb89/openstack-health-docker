FROM ubuntu:14.04

ADD sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y python python-dev python-pip supervisor nginx git python-pandas python-pandas-lib
RUN pip install uwsgi

WORKDIR /home/docker
ADD openstack-health/build openstack-health/build
ADD config.json openstack-health/build/config.json
ADD openstack-health/openstack_health openstack-health/openstack_health
ADD openstack-health/requirements.txt openstack-health/requirements.txt
ADD openstack-health/setup.cfg openstack-health/setup.cfg
ADD openstack-health/setup.py openstack-health/setup.py

RUN pip install -r /home/docker/openstack-health/requirements.txt

ADD nginx.conf /etc/nginx/nginx.conf
ADD supervisor_flask.conf /etc/supervisor/conf.d/supervisor_flask.conf
ADD supervisor_nginx.conf /etc/supervisor/conf.d/supervisor_nginx.conf
ADD openstack-health-api.conf /etc/openstack-health.conf

EXPOSE 80

CMD ["supervisord", "-n"]
