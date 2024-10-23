#!/usr/bin/env bash

set -e

VCLUSTER_VERSION=${VERSION:-"latest"}
. /etc/os-release
TARGET_ARCH="$(dpkg --print-architecture)"

if [ "${TARGET_ARCH}" = "arm64" ]; then
        DOWNLOAD_URL="https://github.com/loft-sh/vcluster/releases/${VCLUSTER_VERSION}/download/vcluster-linux-arm64"
else 
        DOWNLOAD_URL="https://github.com/loft-sh/vcluster/releases/${VCLUSTER_VERSION}/download/vcluster-linux-amd64"
fi
    
echo "Installing vCluster CLI version \"${VCLUSTER_VERSION}\" for architecture ${TARGET_ARCH}"
echo "from ${DOWNLOAD_URL}"

curl -L -o vcluster "${DOWNLOAD_URL}"
install -c -m 0755 vcluster /usr/local/bin
rm vcluster

echo "Done!"
