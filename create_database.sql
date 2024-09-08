DROP DATABASE IF EXISTS KAKAO_T;

CREATE DATABASE IF NOT EXISTS KAKAO_T;

USE KAKAO_T;

CREATE TABLE IF NOT EXISTS FAMILY
(
    family_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id   INT NOT NULL
);

-- USER => 1_000_000
CREATE TABLE IF NOT EXISTS USER
(
    user_id      INT PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(20) NOT NULL,
    phone_number CHAR(12)    NOT NULL UNIQUE,
    birth        CHAR(6)     NOT NULL,
    point        INT         NOT NULL DEFAULT 0,
    family_id    INT,
    FOREIGN KEY (family_id) REFERENCES FAMILY (family_id) ON DELETE SET NULL
);

-- 사용자 ID 시작점 변경
ALTER TABLE USER AUTO_INCREMENT = 1000000;

CREATE TABLE IF NOT EXISTS PAYMENT_METHOD
(
    payment_info      CHAR(16) PRIMARY KEY,
    user_id           INT      NOT NULL,
    expiration_period CHAR(4)  NOT NULL,
    cvc               CHAR(3)  NOT NULL,
    password          CHAR(2)  NOT NULL,
    FOREIGN KEY (user_id) REFERENCES USER (user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS TAXI_CALL
(
    call_id      INT PRIMARY KEY AUTO_INCREMENT,
    start_long   DOUBLE NOT NULL,
    start_lat    DOUBLE NOT NULL,
    end_long     DOUBLE NOT NULL,
    end_lat      DOUBLE NOT NULL,
    is_premium   BOOL NOT NULL DEFAULT FALSE,
    apx_payment  INT NOT NULL DEFAULT 0,
    call_time    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_id      INT,
    FOREIGN KEY (user_id) REFERENCES USER (user_id) ON DELETE SET NULL
);


CREATE TABLE IF NOT EXISTS REGION
(
    region VARCHAR(20) PRIMARY KEY,
    dist   POLYGON     NOT NULL
);

-- 기사 및 사용자 ID 시작 번호 정하기
-- ID => 1
CREATE TABLE IF NOT EXISTS DRIVER
(
    driver_id INT PRIMARY KEY AUTO_INCREMENT,
    name      VARCHAR(20)  NOT NULL,
    ssn       CHAR(13)     NOT NULL UNIQUE,
    company   VARCHAR(100) NOT NULL DEFAULT '개인',
    region    VARCHAR(20),
    rating    DOUBLE,
    is_quit   BOOL         NOT NULL DEFAULT FALSE,
    FOREIGN KEY (region) REFERENCES REGION (region)
);

CREATE TABLE IF NOT EXISTS CAR
(
    driver_id INT PRIMARY KEY,
    pay_type  BOOL         NOT NULL DEFAULT FALSE,
    car_num   CHAR(9)      NOT NULL UNIQUE,
    car_type  VARCHAR(100) NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES DRIVER (driver_id)
);

 











