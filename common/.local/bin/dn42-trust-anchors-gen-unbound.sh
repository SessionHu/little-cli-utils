#!/bin/sh
exec dig @172.20.0.53 +tcp \
  dn42. DNSKEY \
  20.172.in-addr.arpa. DNSKEY \
  21.172.in-addr.arpa. DNSKEY \
  22.172.in-addr.arpa. DNSKEY \
  23.172.in-addr.arpa. DNSKEY \
  10.in-addr.arpa. DNSKEY \
  d.f.ip6.arpa. DNSKEY
