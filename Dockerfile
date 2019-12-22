FROM registry.opensuse.org/opensuse/leap:15.1
MAINTAINER "alex.arnoldy@suse.com"

RUN mkdir -p /opt/container-config/
ADD ./ /opt/container-config/
COPY ./resolv.dnsmasq /etc/resolv.dnsmasq
RUN zypper --non-interactive install dnsmasq

RUN mkdir -p /var/dnsmasq; rm /etc/dnsmasq.conf; ln -s /var/dnsmasq/dnsmasq.conf /etc/dnsmasq.conf; ln -s /var/dnsmasq/dnsmasq_hosts /etc/dnsmasq_hosts


CMD dnsmasq -k  --dhcp-broadcast

