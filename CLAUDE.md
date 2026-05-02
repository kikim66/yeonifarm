# 여니팜 프로젝트 메모리

## 절대 규칙
- 작업 후 반드시 검증한다 (curl, 스크린샷, 또는 브라우저 캡처)
- 변경 후 git commit + push 한다
- 문서는 한글로, 코드/파일명은 영어로 유지한다

## 프로젝트 개요
- 사이트명: 여니팜 (www.yeoni-farm.com)
- 상품: 상황버섯 (자연환경에서 친환경 재배)
- 목적: 상황버섯 소개 및 주문/문의 정적 웹사이트
- GitHub: https://github.com/kikim66/yeonifarm (계정: kikim66)

## 현재 배포 상태

### 운영 서버 (로컬)
- 서버: Caddy (HTTP 80 + HTTPS 443 자동)
- 경로: /home/farmer/data/yeoni
- 서버 IP (사설): 172.30.1.36
- 공인 IP: 59.30.148.202
- 시작: systemd 사용자 서비스 `yeoni-farm.service` (부팅 자동 시작)
- 서비스 파일: `/home/farmer/data/yeoni/systemd/yeoni-farm.service`
- 수동 시작 스크립트: `bash /home/farmer/data/yeoni/start-server.sh`
- 로그: `journalctl --user -u yeoni-farm.service -f`

### GitHub Pages (클라우드 백업)
- URL: https://kikim66.github.io/yeonifarm/
- 커스텀 도메인 설정됨: www.yeoni-farm.com (CNAME 파일 포함)

### 공유기 포트포워딩 (사용자가 설정)
| 외부 포트 | 내부 IP | 내부 포트 |
|---|---|---|
| 80 | 172.30.1.36 | 80 |
| 443 | 172.30.1.36 | 443 |

### DNS (사용자가 설정)
| 타입 | 이름 | 값 |
|---|---|---|
| A | www | 59.30.148.202 |
| A | @ | 59.30.148.202 |

### Caddy 초기 설정 (최초 1회 실행 필요)
```bash
# 포트 80/443 바인딩 권한 부여 (sudo 터미널에서 직접 실행)
sudo setcap 'cap_net_bind_service=+ep' /home/farmer/.local/bin/caddy
```

## 파일 구조
```
/home/farmer/data/yeoni/
├── index.html           # 메인 사이트 (GitHub Pages용)
├── design-mockup.html   # 메인 사이트 (동일 내용)
├── Caddyfile            # Caddy 웹서버 설정 (www.yeoni-farm.com, HTTPS 자동)
├── start-server.sh      # 서버 시작 스크립트
├── logo.png             # 원본 로고 (1536×1024, 흰 여백 있음)
├── logo-clean.png       # 여백 제거 로고 (908×819, 실제 사용)
├── CNAME                # GitHub Pages 커스텀 도메인 파일
├── infomation.md        # 사이트 기본 정보 원본
├── CLAUDE.md            # 이 파일 (AI 작업 메모리)
├── README.md            # 프로젝트 개요
├── .gitignore           # harnes_vive/, .claude/ 제외
└── pictures/            # 상황버섯 실사 사진 20장
    ├── KakaoTalk_20260503_060656707.jpg      # 히어로용 추천
    ├── KakaoTalk_20260503_060656707_01.jpg   # 상품카드 사용 중
    ├── KakaoTalk_20260503_060656707_05.jpg   # 히어로 원형 사용 중
    ├── KakaoTalk_20260503_060656707_03.jpg   # 갤러리
    ├── KakaoTalk_20260503_060656707_07.jpg   # 갤러리
    ├── KakaoTalk_20260503_060656707_10.jpg   # 갤러리 (와이드)
    ├── KakaoTalk_20260503_060656707_12.jpg   # 갤러리
    ├── KakaoTalk_20260503_060656707_15.jpg   # 갤러리
    └── ... (총 20장)
```

## 디자인 시스템
| 항목 | 값 |
|---|---|
| 네비 배경 | #1E4620 (짙은 그린) |
| 주색 Primary | #2C5F2E |
| 골드 강조 | #D4A84B |
| 배경 | #F7F4EE (크림) |
| 폰트 | Noto Sans KR (Google Fonts) |
| 네비 높이 | 72px |
| 로고 높이 | 56px (크림 배경 패드 포함) |
| 사이트명 폰트 | 39px (로고 56px의 70%), 골드 #D4A84B |

## 페이지 구성
1. **네비게이션** — sticky, 짙은 그린, 로고 + "여니팜" 골드 텍스트, 모바일 햄버거
2. **히어로** — _05.jpg 원형 프레임, "정성껏 재배한 상황버섯을 직접 전합니다"
3. **상품 소개** — 건조 상황버섯 카드 (_01.jpg), "달여서 드시면"
4. **갤러리** — 6장 그리드, 클릭 시 라이트박스
5. **드시는 법** — STEP 1~4 + TIP 2개 (대추, 밥물)
6. **주문·문의** — 전화/이메일/계좌 + 주문 4단계
7. **푸터** — 다크 배경 (#1C1C1C)

## 연락처
- 전화: 010-3319-5913
- 이메일: yeonifarm@gmail.com
- 계좌: 농협 351-1308-1385-83 (이수연)

## 드시는 법 (infomation.md 기준)
- 버섯 10g (3~4조각, 한 조각 2~3g) + 물 2000ml
- 중불 30분 → 약불로 충분히 달이기
- 증발된 양만큼 생수 보충
- 3번 우려 가능
- TIP 1: 대추 함께 달이면 풍미 좋음
- TIP 2: 달인 물을 밥물로 사용 → 식감/맛 향상

## 로고 처리
- 원본: logo.png (1536×1024, 흰 여백 많음)
- 처리: Python PIL로 bbox 스캔 후 여백 크롭 → logo-clean.png (908×819)
- 표시: 네비에서 크림색(#FAF7F0) 배경 패드 + 라운드 보더로 골드 일러스트 선명 표시
```python
from PIL import Image
img = Image.open('logo.png').convert('RGB')
# 픽셀 스캔으로 흰 여백 bbox 탐색 후 pad=10 추가 크롭
# → logo-clean.png 저장
```

## 서버 관리 명령어
```bash
# 부팅 자동 시작 등록
systemctl --user link /home/farmer/data/yeoni/systemd/yeoni-farm.service
systemctl --user enable --now yeoni-farm.service

# 상태 확인
systemctl --user status yeoni-farm.service --no-pager
systemctl --user is-enabled yeoni-farm.service
curl -I https://www.yeoni-farm.com

# 로그 확인
journalctl --user -u yeoni-farm.service -f

# 서버 재시작/중지
systemctl --user restart yeoni-farm.service
systemctl --user stop yeoni-farm.service
```

## 주요 도구
- 웹서버: Caddy v2.8.4 (/home/farmer/.local/bin/caddy)
- GitHub CLI: gh v2.49.0 (/home/farmer/.local/bin/gh)
- 로고 처리: Python PIL (pillow)
- 검증: google-chrome --headless=new --screenshot

## 다음 작업 후보
- [ ] 상품 가격/용량 정보 추가 시 카드 업데이트
- [ ] 추가 사진 교체/추가 (pictures/ 폴더)
- [ ] SSL 인증서 자동 발급 확인 (DNS 전파 후)
- [ ] www.yeoni-farm.com 접속 확인
