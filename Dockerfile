FROM ubuntu:14.04
MAINTAINER J.R. Arseneau <http://github.com/jrarseneau>

ENV LANG en_US.UTF-8
RUN locale-gen $LANG

# To get rid of error messages like "debconf: unable to initialize frontend: Dialog":
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty multiverse" >> /etc/apt/sources.list

# Update our image
RUN apt-get -q update
RUN apt-get -qy --force-yes dist-upgrade

# Install required packages
RUN apt-get install -qy avahi-daemon avahi-utils libavahi-client3 wget

# Download and install Plex (non plexpass)
# This gets the latest non-plexpass version
#ENV PLEX=`wget -q --no-check-certificate -O - https://plex.tv/downloads | grep -o '[^"'"'"']*amd64.deb'|grep -v binaries`
RUN wget -P /tmp `wget -q --no-check-certificate -O - https://plex.tv/downloads | grep -o '[^"'"'"']*amd64.deb'|grep -v binaries`
RUN dpkg -i /tmp/plex*.deb
RUN rm -f /tmp/plex*.deb

EXPOSE 32400
VOLUME /volumes/plex
VOLUME /volumes/media
VOLUME /volumes/tmp

ADD start.sh /
ADD plexmediaserver /etc/default/plexmediaserver
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
