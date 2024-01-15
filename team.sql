// 회원가입


CREATE TABLE USER (
    user_id       VARCHAR(20)      PRIMARY KEY,           -- 회원 아이디
    user_pw      VARCHAR(20)      NOT NULL,              -- 회원 비밀번호
    user_name     VARCHAR(30)      NOT NULL,              -- 회원 이름
    user_gen      VARCHAR(20)      NOT NULL,              -- 회원 성별(male, female, etc)
    user_phone    VARCHAR(20)      NOT NULL UNIQUE,       -- 회원 전화번호
    user_email    VARCHAR(100)     NOT NULL UNIQUE,       -- 회원 이메일
    user_date     DATE             NOT NULL               -- 회원 가입일
);



//로그인
CREATE TABLE login (
  user_id VARCHAR(20),
  user_pw VARCHAR(20)
);


-- // 외부로그인은 잠시 빼도록 하겠습니다. 
-- CREATE TABLE ExternalAuth (
--     AuthID INT PRIMARY KEY,
--     user_id INT,
--     AuthProvider VARCHAR(255),
--     AuthToken VARCHAR(255),
--     AuthDate DATETIME,
--     FOREIGN KEY (user_id) REFERENCES User(user_id)
-- );


//게시판
CREATE TABLE BOARD (
    board_no INT AUTO_INCREMENT PRIMARY KEY,                 -- 게시물 번호
    user_id VARCHAR(20) NOT NULL,                            -- 회원 아이디 fk
    user_name VARCHAR(30) NOT NULL,                          -- 게시물 작성자 이름
    board_title VARCHAR(100) NOT NULL,                       -- 게시물 제목
    board_content VARCHAR(8000) NOT NULL,                    -- 게시물 내용
    board_group INT NOT NULL,                                -- 원본 게시물 번호
    board_step INT NOT NULL,                                 -- 답변 출력 순서
    board_date DATE DEFAULT CURRENT_DATE NOT NULL,           -- 게시물 작성일
    board_hit INT DEFAULT 0 NOT NULL,                        -- 게시물 조회수
    board_file VARCHAR(500),                                 -- 첨부 파일 경로
    KEY board_FK (user_id),
    CONSTRAINT board_FK FOREIGN KEY (user_id) REFERENCES USER (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

//게시판 - 파일
CREATE TABLE board_file (
    uuid VARCHAR(500) NOT NULL,                                 -- uuid 고유식별자 생성표준
    upload_path VARCHAR(4096) NOT NULL,                         -- 업로드 경로
    file_name VARCHAR(100) NOT NULL,                            -- 파일명
    file_type VARCHAR(255) DEFAULT '1',                         -- 파일 타입
    board_no INT(11) NOT NULL,                                  -- 게시물 번호
    PRIMARY KEY (uuid),
    CONSTRAINT board_file_fk FOREIGN KEY (board_no) REFERENCES board (board_no) ON DELETE CASCADE ON UPDATE CASCADE
);

// 공지사항
CREATE TABLE NOTICE (
    notice_no INT AUTO_INCREMENT PRIMARY KEY,                 -- 게시물 번호
    user_id VARCHAR(20) NOT NULL,                             -- 회원 아이디 fk
    user_name VARCHAR(30) NOT NULL,                           -- 문의사항 작성자 이름
    notice_title VARCHAR(100) NOT NULL,                       -- 게시물 제목
    notice_content VARCHAR(8000) NOT NULL,                    -- 게시물 내용
    notice_group INT NOT NULL,                                -- 원본 게시물 번호
    notice_step INT NOT NULL,                                 -- 답변 출력 순서
    notice_date DATE DEFAULT CURRENT_DATE NOT NULL,           -- 게시물 작성일(sysdate)
    notice_hit INT DEFAULT 0 NOT NULL,                        -- 게시물 조회수
    notice_file VARCHAR(500),                                 -- 첨부 파일 경로
    KEY notice_FK (user_id),
    CONSTRAINT notice_FK FOREIGN KEY (user_id) REFERENCES USER (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

//공지사항 - 파일
CREATE TABLE notice_file (
    uuid VARCHAR(500) NOT NULL,                     -- uuid 고유식별자 생성표준
    upload_path VARCHAR(4096) NOT NULL,             -- 업로드 경로
    file_name VARCHAR(100) NOT NULL,                -- 파일명
    file_type VARCHAR(255) DEFAULT '1',             -- 파일 타입
    notice_no INT(11) NOT NULL,                     -- 공지사항 번호
    PRIMARY KEY (uuid),
    CONSTRAINT notice_file_fk FOREIGN KEY (notice_no) REFERENCES NOTICE (notice_no) ON DELETE CASCADE ON UPDATE CASCADE
);



// 접종 예약
CREATE TABLE Reservation (
    user_id       VARCHAR(20) NOT NULL,            -- 회원 아이디 fk
    user_name     VARCHAR(30)      NOT NULL,       -- 회원 이름
    user_age      INT(30)          ,               -- 회원 나이
    user_gen      VARCHAR(20)      ,               -- 회원 성별(male, female,etc)
    reserve_phone    INT(20)       NOT NULL,       -- 예약자 전화번호
    reserve_email    VARCHAR(100)  ,               -- 예약자 이메일
    reserve_disease VARCHAR(50)    NOT NULL,       -- 대상 질병
    reserve_item VARCHAR(100),                     -- 백신 제품명
    reserve_date DATE,                             -- 접종 예약 일자
    reserve_local VARCHAR(100)                     -- 접종 장소
);

// 접종 예약 (testversion) --위 접종예약자로 입력되지 않아 아래 명으로 변경
CREATE TABLE reserve (
user_id VARCHAR(20) NOT NULL,
user_name VARCHAR(30) NOT NULL,
user_age INT(30) NOT NULL,
user_gen VARCHAR(20) NOT NULL,      
reserve_phone INT(20) NOT NULL,   
reserve_email VARCHAR(100) NOT NULL,
reserve_disease VARCHAR(50) NOT NULL,
reserve_item VARCHAR(100) NOT NULL,    
reserve_date DATE NOT NULL,
reserve_local VARCHAR(100) NOT NULL
);

