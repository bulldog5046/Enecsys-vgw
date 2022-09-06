#!/usr/bin/with-contenv bashio

DEVICE=$(bashio::config 'device')

bashio::log.info "Starting Enecsys Virtual Gateway..."

echo "${DEVICE}"
mkdir /tmp/web

# Create a telemetry file for the watchdog
echo "init" > /tmp/web/telemetry.json

python3 /__main__.py ${DEVICE} &
python3 -m http.server 8244 --directory /tmp/web/
