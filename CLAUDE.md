# 여니팜 프로젝트 메모리

## 프로젝트 개요
- 사이트명: 여니팜 (www.yeoni-farm.com)
- 상품: 상황버섯 (친환경 재배)
- 목적: 상황버섯 소개 및 주문/문의 정적 웹사이트

## 현재 상태
- 파일: `design-mockup.html` (단일 HTML 파일, CSS/JS 포함)
- 서버: `python3 -m http.server 4000 --bind 0.0.0.0` (포트 4000)
- 접속: http://59.30.148.202:4000/design-mockup.html

## 파일 구조
```
/home/farmer/data/yeoni/
├── design-mockup.html   # 메인 사이트 파일
├── logo.png             # 원본 로고 (1536×1024, 흰 여백 있음)
├── logo-clean.png       # 여백 제거 로고 (908×819, 실제 사용)
├── infomation.md        # 사이트 정보 원본
├── pictures/            # 상황버섯 실사 사진 20장
│   ├── KakaoTalk_20260503_060656707.jpg      # 히어로용 추천
│   ├── KakaoTalk_20260503_060656707_01.jpg   # 상품카드 사용 중
│   ├── KakaoTalk_20260503_060656707_05.jpg   # 히어로 원형 사용 중
│   └── ... (총 20장)
└── harnes_vive/         # 하네스 엔지니어링 베이스 (참고용)
```

## 디자인 시스템
| 항목 | 값 |
|---|---|
| 네비 배경 | `#1E4620` (짙은 그린) |
| 주색 (Primary) | `#2C5F2E` |
| 골드 강조 | `#D4A84B` |
| 배경 | `#F7F4EE` (크림) |
| 폰트 | Noto Sans KR |

## 페이지 구성
1. **네비게이션** — sticky, 짙은 그린, 로고(크림 배경 패드) + "여니팜" 골드 텍스트
2. **히어로** — 실사 사진(_05.jpg) 원형 프레임, 메인 카피
3. **상품 소개** — 건조 상황버섯 카드 (_01.jpg)
4. **갤러리** — 6장 그리드, 클릭 시 라이트박스
5. **드시는 법** — STEP 1~4 + TIP 2개
6. **주문·문의** — 전화/이메일/계좌 + 주문 방법
7. **푸터** — 다크 배경

## 연락처 (infomation.md 기준)
- 전화: 010-3319-5913
- 이메일: yeonifarm@gmail.com
- 계좌: 농협 351-1308-1385-83 (이수연)

## 드시는 법 (infomation.md 기준)
- 버섯 10g (3~4조각, 한 조각 2~3g) + 물 2000ml
- 중불 30분 → 약불로 충분히 달이기
- 증발된 양만큼 생수 보충
- 3번 우려 가능
- 대추 함께 달이면 풍미 좋음
- 달인 물을 밥물로 사용하면 식감/맛 향상

## 로고 처리 방법
```python
# 여백 제거 (PIL 사용)
from PIL import Image
img = Image.open('logo.png').convert('RGB')
# 픽셀 스캔으로 bbox 탐색 후 크롭
# logo-clean.png 로 저장
```

## 서버 관리
```bash
# 서버 시작
cd /home/farmer/data/yeoni
python3 -m http.server 4000 --bind 0.0.0.0 &

# PID 확인
ps aux | grep "http.server 4000" | grep -v grep

# 서버 중지
kill $(pgrep -f "http.server 4000")
```

## 다음 작업 후보
- [ ] Next.js 또는 정적 빌드로 전환
- [ ] 실제 도메인(www.yeoni-farm.com) 연결
- [ ] 상품 가격/용량 정보 추가 시 카드 업데이트
- [ ] 추가 사진 교체/추가
