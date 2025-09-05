#!/bin/bash
# Activate your virtualenv if needed
# source /path/to/app-env/bin/activate
echo "📂 Container root:"
ls -l /

echo "📂 Contents of /config:"
ls -la /config/ || echo "/config not mounted!"

echo "📂 Contents of /config/appdaemon:"
ls -la /config/appdaemon || echo "/config/appdaemon not mounted!"

exec appdaemon -c /config/appdaemon/
