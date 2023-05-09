#!/bin/bash
set -eo pipefail
shopt -s nullglob

# 初始化账号密码
cd /api/vendors
if [ ! -e "/api/init.lock" ];then
    npm run install-server
fi

node /api/vendors/server/app.js

exec "$@"