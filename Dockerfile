FROM docker.io/andyshinn/dnsmasq

MAINTAINER "alex.arnoldy@suse.com"

RUN mkdir -p /var/dnsmasq; rm /etc/dnsmasq.conf; ln -s /var/dnsmasq/dnsmasq.conf /etc/dnsmasq.conf; ln -s /var/dnsmasq/dnsmasq_hosts /etc/dnsmasq_hosts; ln -s /var/dnsmasq/resolv.dnsmasq /etc/resolv.dnsmasq

CMD dnsmasq -k

