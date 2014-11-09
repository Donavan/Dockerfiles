#!/bin/bash
umask 000

exec /usr/bin/transmission-daemon -f --config-dir /config --log-info