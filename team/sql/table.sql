* DB 실행 (마리아디비10.1)


1.데이터베이스 생성 (백신친구) 
CREATE DATABASE VAC;

2. 데이터 베이스 생성확인
SHOW DATABASES;

3. 데이터 베이스 접근권한부여 (ID: root, pw:1234)
GRANT ALL PRIVILEGES ON vac.* TO 'root'@'localhost' IDENTIFIED BY '1234';
FLUSH PRIVILEGES;

4.vac 연결
USE vac

5.테이블 확인
show tables;

6. 테이블 생성 (영역 전체 선택복사 붙여넣기로 입력 가능)
6-1. 회원가입
CREATE TABLE USER (
    user_id       VARCHAR(20)      PRIMARY KEY,           
    user_pw      VARCHAR(20)      NOT NULL,              
    user_name     VARCHAR(30)      NOT NULL,            
    user_gen      VARCHAR(20)      NOT NULL,             
    user_phone    VARCHAR(20)      NOT NULL UNIQUE, 
    user_email    VARCHAR(100)     NOT NULL UNIQUE,  
    user_date     DATE             NOT NULL               
);

6-2. 로그인
CREATE TABLE login (
  user_id VARCHAR(20),
  user_pw VARCHAR(20)
);

6-3. 게시판
create table board(
  BOARD_NUM INT NOT NULL,
  BOARD_NAME VARCHAR(20) NOT NULL,
  BOARD_PASS VARCHAR(20) NOT NULL,
  BOARD_SUBJECT VARCHAR(100) NOT NULL,
  BOARD_CONTENT VARCHAR(8000) NOT NULL,
  BOARD_FILE VARCHAR(500) NULL, -- NULL 허용으로 변경
  BOARD_RE_REF INT NOT NULL,
  BOARD_RE_LEV INT NOT NULL,
  BOARD_RE_SEQ INT NOT NULL,
  BOARD_READCOUNT INT DEFAULT 0,
  BOARD_DATE DATE,
  PRIMARY KEY(BOARD_NUM)
  );


6-4. 공지사항
create table noticee(
  BOARD_NUM INT NOT NULL,
  BOARD_NAME VARCHAR(20) NOT NULL,
  BOARD_PASS VARCHAR(20) NOT NULL,
  BOARD_SUBJECT VARCHAR(100) NOT NULL,
  BOARD_CONTENT VARCHAR(8000) NOT NULL,
  BOARD_FILE VARCHAR(500) NULL, 
  BOARD_RE_REF INT NOT NULL,
  BOARD_RE_LEV INT NOT NULL,
  BOARD_RE_SEQ INT NOT NULL,
  BOARD_READCOUNT INT DEFAULT 0,
  BOARD_DATE DATE,
  PRIMARY KEY(BOARD_NUM)
  );


-- 사용하지 않은 부분입니다.

게시판 - 파일
CREATE TABLE board_file (
    uuid VARCHAR(255) NOT NULL,              
    upload_path VARCHAR(4096) NOT NULL,   
    file_name VARCHAR(100) NOT NULL,        
    file_type VARCHAR(255) DEFAULT '1',       
    board_no INT NOT NULL,                 
    PRIMARY KEY (uuid),
    CONSTRAINT board_file_fk FOREIGN KEY (board_no) REFERENCES board (board_no) ON DELETE CASCADE ON UPDATE CASCADE
);


 공지사항 - 파일
CREATE TABLE notice_file (
    uuid VARCHAR(255) NOT NULL,                    
    upload_path VARCHAR(4096) NOT NULL,         
    file_name VARCHAR(100) NOT NULL,              
    file_type VARCHAR(255) DEFAULT '1',             
    notice_no INT NOT NULL,                     
    PRIMARY KEY (uuid),
    CONSTRAINT notice_file_fk FOREIGN KEY (notice_no) REFERENCES NOTICE (notice_no) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 여기까지 사용하지 않은 부분입니다.



6-7 접종 예약
CREATE TABLE reserve (
  reserve_no INT AUTO_INCREMENT PRIMARY KEY,
  user_id VARCHAR(20) NOT NULL,
  user_name VARCHAR(30) NOT NULL,
  reserve_gen VARCHAR(20) NOT NULL,      
  reserve_age INT) NOT NULL,
  reserve_phone VARCHAR(20) NOT NULL,   
  reserve_email VARCHAR(100) NOT NULL,
  reserve_disease VARCHAR(50) NOT NULL,
  reserve_item VARCHAR(100) NOT NULL,    
  reserve_date DATE NOT NULL,
  reserve_local VARCHAR(100) NOT NULL,
  CONSTRAINT reserve_FK FOREIGN KEY (user_id) REFERENCES USER (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

7. 데이터 확인
DESC reserve;

--------------------------------

8-1. 칼럼맨뒤 추가 (추가된칼럼은 반드시 마지막에 위치)
ALTER TABLE reserve
ADD 칼럼명 데이터유형;

8-2. 칼럼 맨앞추가
ALTER TABLE reserve ADD COLUMN 칼럼명 데이터유형 NOT NULL FIRST


9. 칼럼삭제
ALTER TABLE reserve DROP COLUMN 칼럼명; 

10-1.칼럼명 변경 (3.1. ALTER TABLE [테이블명] CHANGE COLUMN [기존컬럼명] [변경할 컬럼명] [컬럼타입];
ALTER TABLE reserve CHANGE COLUMN 기존칼럼명 바꿀이름 int(원래타입);

10-2. 칼럼타입변경 ALTER TABLE [테이블명] MODIFY COLUMN [컬럼명] [변경할컬럼타입]
ALTER TABLE reserve MODIFY COLUMN 칼럼명 varchar(128)(변경할타입);

11. 제약조건추가
ALTER TABLE reserve
ADD CONSTRAINT 제약조건명 제약조건 (칼럼명);

12.데이터 조회
SELECT*FROM reserve;

13. 레코드 삭제 (DELETE FROM 테이블 WHERE 조건;)
DELETE FROM reserve where user_id = 123;

14. 테이블 삭제 DROP TABLE 테이블 이름;
DROP TABLE reserve;

15. 레코드 입력INSERT INTO 테이블이름(필드이름1, 필드이름2, 필드이름3, ...)   
VALUES (데이터값1, 데이터값2, 데이터값3, ...)
INSERT INTO user(user_id, user_pw, user_name, user_gen, user_phone, user_email, user_date)
VALUES(1234, 1234, '홍길동', '남', 01012345678, 'babo@naver.com', '2024-01-15');
