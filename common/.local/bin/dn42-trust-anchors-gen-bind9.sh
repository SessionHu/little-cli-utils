#!/bin/sh

SERVER="172.20.0.53"
DOMAINS="
dn42.
20.172.in-addr.arpa.
21.172.in-addr.arpa.
22.172.in-addr.arpa.
23.172.in-addr.arpa.
10.in-addr.arpa.
d.f.ip6.arpa.
neo.
"

echo 'trust-anchors {'

for domain in $DOMAINS; do
  echo "\t# ${domain}"
  dig "${domain}" DNSKEY @"${SERVER}" +tcp +short | \
  awk -v domain="${domain}" '{
    printf "\t\"%s\" static-key %d %d %d \"", domain, $1, $2, $3;
    for(i=4; i<=NF; i++) {
      printf "%s", $i
    };
    print "\";";
  }'
done

echo '};'
