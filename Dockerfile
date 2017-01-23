FROM ibmcom/ibmjava:8-jre

MAINTAINER Tim Pouyer <tpouyer@us.ibm.com>

# install ucd client --- backward compatibility for now
ADD udclient /opt/udclient

RUN apt-get update \
	&& apt-get install -y --no-install-recommends curl bash unzip zip wget jq python-pip python-setuptools docker.io \
	&& (grep -q -E '^(mesg n \|\| true)$' /root/.profile && sed -ri 's/^(mesg n \|\| true)$/tty -s \&\& mesg n/' /root/.profile) \
	&& chmod +x /opt/udclient/* \
	&& ln -sf /opt/udclient/udclient /usr/local/bin \
	&& usermod -aG docker $(whoami)

# setup environment variables for udclient operation
ENV PATH /opt/udclient:$PATH
ENV DS_WEB_URL http://192.168.27.100:8080
ENV DS_USERNAME admin
ENV DS_PASSWORD admin
