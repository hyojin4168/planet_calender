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

## 🌱 이런 사람을 위한 캘린더예요

🧠 번아웃이 와도, 숨 고르며 쓸 수 있게  
계획을 지켜야 한다는 압박 대신  
👉 오늘의 상태에 맞춰 유연하게 기록  

비워도 괜찮고, 미뤄도 괜찮은 캘린더  
완벽하지 않아도 계속 쓸 수 있는 흐름을 만듭니다.

> “계획 때문에 지치는 게 아니라,  
> 계획이 나를 회복시키는 도구가 되도록.”

---

### ⚖️ J와 P가 공존하는 캘린더

**J형 사용자에게는**
- 구조적인 일정 관리 📅
- 카테고리 기반 정리
- 한눈에 들어오는 캘린더 뷰

**P형 사용자에게는**
- 자유로운 기록 ✍️
- 오늘 하고 싶은 것부터 적는 유연함

계획형과 즉흥형,  
누군가는 맞추고 / 누군가는 흘려도 되는  
**공존 가능한 캘린더**를 지향합니다.

---

### 🎨 “다꾸는 여자만?”이라는 편견을 깨다

- 귀엽기만 한 다꾸 ❌  
- 감성만 가득한 디자인 ❌  

성별·취향에 제한 없는 기록 경험을 목표로 합니다.

✔️ 심플  
✔️ 미니멀  
✔️ 감성 or 담백, 원하는 만큼만  

꾸미고 싶은 날엔 꾸미고,  
기록만 하고 싶은 날엔 딱 기록만.

---

### ✨ 그래서 이 캘린더는

- 열심히 살지 않아도 쓸 수 있고  
- 잘 쉬는 사람도 쓸 수 있고  
- J도, P도, 그 사이 어딘가인 사람도  

부담 없이 **계속 쓰게 되는 캘린더**입니다.

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

🌿 Branch Strategy
Branch	Description
main	배포 브랜치 (직접 push 금지)
develop	개발 통합 브랜치
feature/*	기능 단위 브랜치

👥 Collaboration Rules
main 브랜치 직접 push 금지
develop 또는 feature 브랜치에서 작업
Pull Request를 통해서만 main 병합

🧸 Team
Name	Role
김효진	백엔드 · 일정/투두/D-Day 설계
장하은	기획 · 프론트엔드 개발
💌 Contact
김효진
✉ djduebfu3747@gmail.com

장하은
✉ jhe290609@gmail.com

본 프로젝트는 협업 및 확장성을 고려하여 설계되었으며,
README는 개발 진행에 따라 지속적으로 업데이트됩니다.