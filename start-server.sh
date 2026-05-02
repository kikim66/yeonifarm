#!/bin/bash
export PATH="$PATH:/home/farmer/.local/bin"
cd /home/farmer/data/yeoni

# 기존 서버 정리
pkill -f "http.server 4000" 2>/dev/null
pkill -f "caddy run" 2>/dev/null
sleep 1

# Caddy 시작 (포트 80 HTTP, 443 HTTPS 자동)
caddy run --config Caddyfile &>/tmp/caddy.log &
disown $!
sleep 2

if pgrep -f "caddy run" > /dev/null; then
    echo "✅ 여니팜 서버 시작 완료"
    echo "   http://www.yeoni-farm.com"
    echo "   https://www.yeoni-farm.com"
else
    echo "❌ 서버 시작 실패 - 로그: /tmp/caddy.log"
fi
