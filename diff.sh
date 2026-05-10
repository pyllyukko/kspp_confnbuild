#!/bin/bash

upstream_linux="$(curl ftp://ftp.slackware.com/pub/slackware/slackware64-15.0/patches/source/ | gawk '$9 ~ /^linux-[0-9.]+$/{print$9}')"

if [ -n "${upstream_linux}" ]
then
  echo -e "[\033[1;32m+\033[0m] Found upstream version: ${upstream_linux}"
else
  echo -e "[\033[1;31m-\033[0m] Could not determine upstream version" 1>&2
  exit 1
fi

upstream_version="${upstream_linux#linux-}"
diff --color=always \
  <(curl "ftp://ftp.slackware.com/pub/slackware/slackware64-15.0/patches/source/${upstream_linux}/kernel-configs/config-generic-${upstream_version}.x64") \
  config-x86_64/config-generic-*.x64

exit 0
