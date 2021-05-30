FROM registry.opensuse.org/opensuse/leap:15.2
MAINTAINER "alex.arnoldy@suse.com"

# This adds the container config into the container image so it can be moved around manually, if desired.
RUN mkdir -p /opt/container-config/
ADD ./ /opt/container-config/

RUN zypper --non-interactive install dnsmasq

# The run command bind mounts /var/dnsmasq to the local directory.
# This links the files in the local directory to their locations in the container image.
RUN mkdir -p /var/dnsmasq; rm /etc/dnsmasq.conf; ln -s /var/dnsmasq/dnsmasq.conf /etc/dnsmasq.conf; ln -s /var/dnsmasq/dnsmasq_hosts /etc/dnsmasq_hosts


CMD dnsmasq -k  --dhcp-broadcast

