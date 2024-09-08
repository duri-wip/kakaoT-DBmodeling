USE KAKAO_T;

-- 회원 가입 상황
INSERT INTO USER(name, phone_number, birth)
VALUE ('윤수빈', '01019538118', '960626');

SELECT * FROM USER
WHERE name = '윤수빈' AND birth = '960626';

-- 결재 정보를 추가하는 상황
INSERT INTO PAYMENT_METHOD(payment_info, user_id, expiration_period, cvc, password)
VALUE ('5756408140393018', 1000000, '0130', '278', '34');

SELECT * FROM PAYMENT_METHOD AS p
WHERE (
          SELECT user_id FROM USER
          WHERE name = '윤수빈' AND birth = '960626'
) = p.USER_ID;

-- 사용자가 택시를 부르는 상황에서 CALL 테이블 생성
/*
{'START_LAT': '34.8825',
 'START_LONG': '128.62667',
 'END_LAT': '36.82167',
 'END_LONG': '128.63083',
 'IS_PREMIUM': 0,
 'CALL_TIME': '2024-04-29 11:18:20',
 'USER_ID': 1000100}
*/

INSERT INTO TAXI_CALL(start_lat, start_long, end_lat, `end_long`, is_premium, user_id)
VALUE (34.8825, 128.62667, 36.82167, 128.63083, 0, 1000000);

SELECT * FROM TAXI_CALL AS t
WHERE (
          SELECT user_id FROM USER
          WHERE name = '윤수빈' AND birth = '960626'
) = t.USER_ID;

-- 운행 가능 지역 추가
/*
 {'REGION': '제주도',
 'DIST': ...}
 */
INSERT INTO REGION(region, dist)
VALUES ('제주도', ST_GeomFromText('POLYGON((126.153367 33.456719, 126.161968 33.455606, 126.172523 33.451932, 126.178913 33.448046, 126.188983 33.441558, 126.195374 33.436982, 126.206618 33.427265, 126.219009 33.416297, 126.234131 33.399290, 126.235505 33.388964, 126.233459 33.377962, 126.227055 33.368852, 126.217812 33.362915, 126.206568 33.356977, 126.193466 33.352183, 126.182223 33.349838, 126.171065 33.349276, 126.160907 33.351344, 126.153367 33.356357, 126.148474 33.363874, 126.145071 33.371959, 126.143339 33.380184, 126.143339 33.387993, 126.145071 33.396217, 126.148474 33.403178, 126.153367 33.408189, 126.153367 33.456719))'));

SELECT region, ST_ASTEXT(dist) FROM REGION
WHERE region = '제주도';

-- 기사 회원 가입 상황
/*
 {'DIRVER_ID': <function id(obj, /)>,
 'NAME': '박성수',
 'SSN': '4805131504552',
 'COMPANY': '유한회사 최윤이',
 'REGION': '고성군'}
 */

INSERT INTO DRIVER(name, ssn, company, region) VALUE ('박성수', '4805131504552', '유한회사 최윤이', '제주도');

SELECT * FROM DRIVER WHERE ssn = '4805131504552';

-- 택시 기사가 콜을 잡은 상황에서 데이터 생성
/*
{'CALL_ID': 1001, 'DRIVER_ID': 474, 'CATCH_TIME': '2024-04-29 22:50:02'}
 */

INSERT INTO TAXI_CATCH(call_id, driver_id) VALUE (1, 1);

SELECT * FROM TAXI_CATCH WHERE call_id = 1001;

-- 기사 차량 등록 상황
-- {'CAR_NUM': '충남27아1939', 'PAY_TYPE': 1, 'CAR_TYPE': '벤티'}

INSERT INTO CAR(driver_id, car_num, pay_type, car_type) VALUE (1, '충남27아1939', 1, '벤티');

SELECT * FROM CAR WHERE driver_id = 1000;

-- 결제가 수행되는 경우
/*
카드 번호 : 5756 40** **** 3018
최종 결재 금액 : 34000
캐치 ID : 1000
 */

INSERT INTO PAYMENT(catch_id, card_num, payment_result)
VALUE (1, '575640******3018', 34000);

SELECT * FROM PAYMENT
WHERE CATCH_ID = 1;