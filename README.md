# 여니팜 웹사이트

상황버섯 소개 및 주문 문의 정적 웹사이트

## 접속
- **운영**: https://www.yeoni-farm.com
- **GitHub Pages**: https://kikim66.github.io/yeonifarm/

## 서버 시작

```bash
# 최초 1회만 (터미널에서 직접 실행)
sudo setcap 'cap_net_bind_service=+ep' /home/farmer/.local/bin/caddy

# 서버 시작 (이후 매번)
bash /home/farmer/data/yeoni/start-server.sh
```

## 파일 구성

| 파일 | 설명 |
|---|---|
| `index.html` | 메인 사이트 |
| `Caddyfile` | 웹서버 설정 (HTTP/HTTPS 자동) |
| `start-server.sh` | 서버 시작 스크립트 |
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
