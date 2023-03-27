#!/bin/bash

echo "Hello, this is the helper!"

ip="$1"

sed -i '/"ServerURL":*/,/"WebSocketURL":*/c\
    "ServerURL": "'"http://$ip"'",\
    "WebSocketURL": "'"ws://$ip"'",
' mattermost/config/config.sample.json

cp mattermost/config/config.sample.json mattermost/config/config.json
cp mattermost/config/simplecontroller.sample.json mattermost/config/simplecontroller.json
