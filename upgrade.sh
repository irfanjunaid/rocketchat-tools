#!/usr/bin/env bash
set -e

curr_date=`date +"%d%m%Y"`
systemctl stop rocketchat
sleep 3
mv /opt/Rocket.Chat /opt/Rocket.Chat.old-${curr_date}
curl -L https://releases.rocket.chat/latest/download -o /tmp/rocket.chat.tgz
tar -xzf /tmp/rocket.chat.tgz -C /tmp
cd /tmp/bundle/programs/server && npm install
mv /tmp/bundle /opt/Rocket.Chat
chown -R rocketchat:rocketchat /opt/Rocket.Chat
systemctl restart rocketchat
