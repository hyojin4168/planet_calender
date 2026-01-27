# 📅 Planet Calendar

> 일정 중심의 올인원 캘린더 웹 애플리케이션  
> 일정 · 투두 · D-Day를 시작으로 가계부와 메모까지 확장하는 팀 프로젝트

---

## ✨ Overview

**Planet Calendar**는  
하루·한 달의 계획을 한눈에 관리할 수 있도록 설계된  
**일정 중심 캘린더 웹 애플리케이션**입니다.

복잡한 기능보다 **직관적인 사용 흐름**을 우선하며,  
Phase 기반 개발을 통해 기능을 점진적으로 확장합니다.

---

## 🔗 Links
- **GitHub Repository**  
  https://github.com/hyojin4168/planet_calender
- **Demo / Presentation**  
  *(추후 추가 예정)*

---

## 🧭 Key Features

### 📆 Calendar
- 월간 / 주간 뷰 제공 (기본: 월간)
- 날짜 선택 시 상세 정보 확인

### 🗓 Schedule
- 일정 생성 / 수정 / 삭제
- 카테고리별 일정 관리 (색상 / 라벨)
- 달력 내 일정 시각적 구분

### ✅ Todo
- 날짜 기반 투두리스트
- 투두 완료 체크
- 날짜 선택 시 해당 날짜 투두 확인

### 🎯 D-Day
- 달력 상단 고정 표시
- 기본 2개 표시
- 좌우 스와이프 또는 버튼으로 추가 확인

---

## 🚀 Roadmap (Phase)

### 🔹 Phase 1 — Core MVP
- [ ] 월간 / 주간 캘린더
- [ ] 일정 CRUD
- [ ] 카테고리별 일정 관리
- [ ] 날짜 기반 투두리스트
- [ ] D-Day 고정 표시

### 🔹 Phase 2 — 가계부
- [ ] 수입 / 지출 입력
- [ ] 날짜 기반 가계부
- [ ] 월별 합계
- [ ] (확장) 달력 내 요약 표시

### 🔹 Phase 3 — 메모
- [ ] 날짜 / 일정 연동 메모
- [ ] 독립 메모 (아이디어 기록)

### 🔹 Phase 4 — 커스터마이징
- [ ] 기능 ON / OFF 토글
- [ ] 달력 표시 옵션 설정

### 🔹 Phase 5 — 설정
- [ ] 앱 잠금
- [ ] 접근 제어 (비밀번호 / 생체 인증)

---

## 🛠 Tech Stack

### 🎨 Frontend
- **Language**
  - HTML5
  - CSS3
  - JavaScript (ES6+)

- **UI / UX**
  - Responsive Web Design
  - Calendar UI (Custom Implementation)

- **State / Data Handling**
  - Vanilla JavaScript DOM Manipulation
  - Fetch API (REST API 통신)

- **Development Tools**
  - Visual Studio Code

---

### ⚙ Backend
- **Language**
  - Java 11

- **Framework**
  - Spring Framework 5.3.x
  - Spring MVC

- **Persistence**
  - MyBatis 3.x

- **Web / API**
  - REST API
  - JSON (Jackson)

- **Database**
  - Oracle Database

- **Server**
  - Apache Tomcat 9.x

- **Security / Common**
  - Session-based Authentication
  - Interceptor / Filter
  - Exception Handling

- **Development Tools**
  - Spring Tool Suite 3 (STS3)

---

### 🧰 Collaboration & Version Control
- Git
- GitHub

---

## 📂 Project Structure

```text
planet-calendar/
├─ frontend/        # Frontend (VS Code)
│  ├─ src/
│  └─ assets/
│
├─ backend/         # Backend (STS3 - Spring)
│  ├─ src/main/java/
│  ├─ src/main/resources/
│  └─ pom.xml
│
├─ docs/            # API / ERD / 기획 문서
└─ README.md
```

---

## 🌿 Branch Strategy

| Branch | Description |
|------|-------------|
| `main` | 배포 브랜치 (직접 push 금지) |
| `develop` | 개발 통합 브랜치 |
| `feature/*` | 기능 단위 브랜치 |

---

## 👥 Collaboration Rules

- `main` 브랜치 직접 push 금지
- `develop` 또는 `feature` 브랜치에서 작업
- Pull Request를 통해서만 `main` 병합

---

## 🧸 Team

| Name | Role |
|------|------|
| 김효진 | 백엔드 · 일정/투두/D-Day 설계 |
| 장하은 | 기획 · 프론트엔드 개발 |

---

## 💌 Contact
- 김효진  
  ✉ djduebfu3747@gmail.com
- 장하은  
  ✉ jhe290609@gmail.com


---

> 본 프로젝트는 협업 및 확장성을 고려하여 설계되었으며,  
> README는 개발 진행에 따라 지속적으로 업데이트됩니다.
