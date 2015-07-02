FROM yebyen/baseimage:i386
MAINTAINER Kevin Kingsbury <http://github.com/kkingsbu>

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
RUN wget -P /tmp `wget -q --no-check-certificate -O - https://plex.tv/downloads | grep -o '[^"'"'"']*i386.deb'|grep -v binaries`
RUN dpkg -i /tmp/plex*.deb
RUN rm -f /tmp/plex*.deb

EXPOSE 32400
VOLUME /volumes/config
VOLUME /volumes/media
VOLUME /volumes/tmp

RUN mkdir /etc/service/plexmediaserver
ADD start.sh /etc/service/plexmediaserver/run
ADD plexmediaserver /etc/default/plexmediaserver

CMD ["/sbin/my_init"]
