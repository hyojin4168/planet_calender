/* ==================================================
   Planet Calendar Database Script
   목적 : 테이블 구조 설계 및 초기 데이터 예시
   상태 : DB 미연동 (설계 단계)
   ================================================== */

/* --------------------------------------------------
   [Table] schedule
   설명 : 일정 정보를 관리하는 테이블
   -------------------------------------------------- */
CREATE TABLE schedule (
    schedule_id   INT AUTO_INCREMENT PRIMARY KEY, -- 일정 ID
    title         VARCHAR(100) NOT NULL,           -- 일정 제목
    description   VARCHAR(255),                    -- 일정 설명
    schedule_date DATE NOT NULL,                   -- 일정 날짜
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- 생성일
);

/* 예시 데이터 (테스트용) */
INSERT INTO schedule (title, description, schedule_date)
VALUES ('프로젝트 시작', 'Planet Calendar 개발 시작', '2026-02-01');
