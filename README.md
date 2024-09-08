# 카카오 T DB modeling PROJECT

## 프로젝트 소개

- 카카오 T 택시 서비스를 모티브로 ERD 작성
- 논리적 모델링 후 데이터베이스 생성
- 물리적 데이터 베이스 생성 후 테이블 생성

## ERD 설계 및 개념적 모델링

![ERD](https://github.com/duri-wip/kakaoT-DBmodeling/blob/main/images/ERD.png)

'배차'와 '결제'라는 주요 업무 프로세스를 기반으로 entity와 relation을 설계하였습니다.

## 논리모델링 및 정규화

![릴레이션 스키마](https://github.com/duri-wip/kakaoT-DBmodeling/blob/main/images/RelationSchema.png)

초기 ERD에서 업무 프로세스를 가정하고 DB에 저장해야 하는 것과 아닌것을 구분하였습니다.
테이블의 정규성을 고려하여 설계하였습니다.

## 물리 모델링

### 1. 데이터베이스 및 테이블 생성

![데이터베이스 및 테이블 생성 SQL](https://github.com/duri-wip/kakaoT-DBmodeling/blob/main/create_database.sql)

### 2. 데이터 삽입

![가상의 데이터 생성](https://github.com/duri-wip/kakaoT-DBmodeling/blob/main/faker_data_generator.ipynb)

## 추후 과제

- 카드번호, 주민등록번호, 전화번호 등 민감한 정보 보안 강화
- 택시 차량 위치 데이터 수집(NoSQL 활용)
- 데이터 백업 및 장애 처리
- 서버측에서 가족 계정 내 데이터도 함께 삭제
