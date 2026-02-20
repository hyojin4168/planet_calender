CREATE DATABASE planet_calendar
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_general_ci;

USE planet_calendar;

CREATE TABLE schedule (
    schedule_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '일정 PK',
    title       VARCHAR(100) NOT NULL COMMENT '일정 제목',
    start_date  DATE NOT NULL COMMENT '시작 날짜',
    start_time  TIME NOT NULL COMMENT '시작 시간',
    end_time    TIME NULL COMMENT '종료 시간',
    memo        TEXT NULL COMMENT '메모',
    created_at  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일',

    PRIMARY KEY (schedule_id),
    INDEX idx_start_date (start_date)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COMMENT='일정 테이블';

INSERT INTO schedule (title, start_date, start_time, end_time, memo)
VALUES
('팀 회의', '2026-02-18', '14:00:00', '15:00:00', '회의실 A'),
('병원 방문', '2026-02-20', '10:00:00', NULL, '정기 검진'),
('프로젝트 마감', '2026-02-25', '23:00:00', NULL, '최종 제출');

INSERT INTO schedule
(title, start_date, start_time, end_time, memo)
VALUES
('운동', '2026-02-05', '07:00:00', NULL, '헬스장'),
('생일', '2026-02-27', '07:00:00', NULL, '코지하우스'),
('카페 미팅', '2026-02-09', '07:00:00', NULL, '스타벅스');


