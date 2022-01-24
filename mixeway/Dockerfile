FROM ubuntu:focal
MAINTAINER Mohammad Razavi <mrazavi64@gmail.com>

ARG MIXEWAY_SRC_URI="https://github.com/Mixeway/MixewayOpenVASRestAPI/releases/download/v1.2.1/MixewayOpenVasRestAPI-1.2.1-SNAPSHOT.jar"

RUN set -ex; \
    apt update; \
    DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends gnupg; \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3C453D244AA450E0; \
    echo "deb http://ppa.launchpad.net/mrazavi/gvm/ubuntu focal main" > /etc/apt/sources.list.d/mrazavi-ubuntu-gvm-focal.list; \
    apt update; \
    DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends gvmd-pg postgresql-client texlive-latex-base texlive-latex-extra texlive-fonts-recommended xsltproc gnutls-bin xmlstarlet zip python3 python3-lxml smbclient snmp gnupg openssh-client sshpass socat haveged rsync wget gpgsm xml-twig-tools msmtp msmtp-mta; \
    DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends openjdk-11-jdk-headless gvm-tools wget python3-setuptools

VOLUME /opt/mixeway/pki
VOLUME /var/lib/gvm



RUN mkdir /opt/mixeway; \
    cd /opt/mixeway; \  
    wget -q -O mixeway_gvm.jar $MIXEWAY_SRC_URI; \
    chown -R gvm:gvm /opt/mixeway; \
    chown -R gvm:gvm /opt/mixeway

EXPOSE 8443

USER gvm

WORKDIR /opt/mixeway

CMD ["/usr/bin/java", "-jar", "/opt/mixeway/mixeway_gvm.jar",  "--server.port=8443", "--server.ssl.key-store=/opt/mixeway/pki/mixeway.p12", \
    "--server.ssl.key-store-password=1qaz@WSX", "--server.ssl.trust-store=/opt/mixeway/pki/trust.jks", \
    "--server.ssl.trust-store-password=changeit", "--openvasmd.socket=/var/run/gvm/gvmd.sock", \
    "--allowed.users=localhost,mixeway,195.205.152.174,mixer.corpnet.pl", "--server.ssl.key-alias=mixeway", \
    "--spring.profiles.active=noauth"]



