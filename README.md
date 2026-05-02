# 여니팜 웹사이트

상황버섯 소개 및 주문 문의 정적 웹사이트

## 접속
- **운영**: https://www.yeoni-farm.com
- **GitHub Pages**: https://kikim66.github.io/yeonifarm/

## 서버 관리

```bash
# 최초 1회만 (터미널에서 직접 실행)
sudo setcap 'cap_net_bind_service=+ep' /home/farmer/.local/bin/caddy

# 부팅 자동 시작 등록
systemctl --user link /home/farmer/data/yeoni/systemd/yeoni-farm.service
systemctl --user enable --now yeoni-farm.service

# 상태 확인
systemctl --user status yeoni-farm.service --no-pager
```

## 파일 구성

| 파일 | 설명 |
|---|---|
| `index.html` | 메인 사이트 |
| `Caddyfile` | 웹서버 설정 (HTTP/HTTPS 자동) |
| `start-server.sh` | 서버 시작 스크립트 |
| `systemd/yeoni-farm.service` | 부팅 자동 시작용 systemd 사용자 서비스 |
| `logo-clean.png` | 여백 제거 로고 (실제 사용) |
| `logo.png` | 원본 로고 |
| `pictures/` | 상황버섯 실사 사진 20장 |
| `CLAUDE.md` | AI 작업 메모리 (상세) |

## 인프라

| 항목 | 값 |
|---|---|
| 서버 IP | 59.30.148.202 |
| 웹서버 | Caddy v2.8.4 |
| HTTP | 포트 80 |
| HTTPS | 포트 443 (Let's Encrypt 자동) |
| GitHub | https://github.com/kikim66/yeonifarm |

## 연락처

- 전화: 010-3319-5913
- 이메일: yeonifarm@gmail.com
- 계좌: 농협 351-1308-1385-83 (이수연)
