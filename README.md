# [개인 프로젝트 #2] 공용 공간 예약 사이트

## 기획 의도

실제로 자주 이용하고 있는 병원 예약 앱, <br>
이 앱은 없으면 불편함을 느끼도록 의도한 것 같아!! <br>
이 아이디어를 다른 분야에 적용할 수 있을까? <br>

한 예능 프로그램에서 나온 빌라에서의 공용 1인 헬스장, <br>
디지털 시대에 화이트보드로 수기 예약을? <br>
이런 문화 한 번 바꿔보자!!

## 개발 기간

- 2022.02.03 ~ 2022.03.20

## 기술 스택

- front : HTML, CSS, Javascript, jQuery, Ajax
- back : Java(1.8), Spring framework(5.0.7), Oracle(11.2.0.1.0), MyBatis(3.4.6), Tomcat(8.5)

## 주요 기능

- 공용

  - 회원 가입 : 유효성 검증, 중복 ID 사용 금지
  - 로그인 / 로그아웃 : Spring Security 이용
  
- 사용자

  - 시설 조회 : 모든 시설을 조회할 수 있으며, 선택한 시설에 대한 주소, 공지사항 등의 정보를 확인
  - 예약 조회 / 신청 : 선택한 날짜에 대해 예약이 가능한지의 여부를 알 수 있으며, 예약을 신청할 수 있음
  - 개인 예약 조회 : 개인이 신청한 모든 예약 조회
  - 개인 예약 취소 : 오늘 이후의 날짜에 대해선 예약을 취소할 수 있음
  
- 시설 관리자

  - 시설 등록 : 시설명, 시설 주소, 공지사항 등을 같이 등록, 중복 시설명 사용 금지
  - 시설 조회
  - 시설 정보 수정 : 시설 주소, 공지사항 등을 수정
  - 시설 등록 삭제
  - 예약 추가 : 지정한 날짜, 시간 사이에 주기를 나눠 예약 추가, 동 시간대 여러 팀의 예약을 받을 수 있음
  - 예약 조회 : 특정 일을 선택하면 해당 날짜의 예약자 ID 등을 알 수 있음
  - 예약 취소 : 사용자의 예약을 취소
  - 예약 삭제
  - 예약자 정보 확인 : 예약자의 전화번호, 이메일 등의 정보 조회할 수 있음

## DB 설계
  
  ![image](https://user-images.githubusercontent.com/48465072/159866887-e3496199-6101-422e-a149-da3e94a3151d.png)
  
## 실행 화면

<details><summary>회원 관련</summary>

  <br>
  
  ![image](https://user-images.githubusercontent.com/48465072/159946827-a8be884b-aea1-4631-b20b-b5b4d0553a19.png)
  <br>로그인 화면입니다. 아래에 회원가입 버튼을 누르면 회원가입 유형 선택 페이지로 이동합니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159947292-bdbfe27b-6605-4388-86fb-183c39307a2d.png)
  <br>회원가입 유형을 선택하면 해당 유형의 회원가입 페이지로 이동합니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159948671-38bf83de-4914-4b80-af5f-25cacf704716.png)
  <br>일반 사용자 회원가입 페이지입니다. 각 항목에 입력이 없으면 입력하라는 메시지를 표시합니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159949440-fe7c87a3-b455-43a2-90c0-6aa2332ab0cd.png)
  <br>각 항목에 유효성 검증 테스트를 통과하지 못하면 제대로 입력하라는 메시지를 표시합니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159951470-a41b5ff0-4116-43f3-9c13-262bce8f5ddf.png)
  <br>시설 관리자 회원가입 페이지입니다. 일반 사용자 회원가입 페이지에 닉네임 항목이 추가되어 있습니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159956668-0d55f86d-e2a8-4f4a-bdf7-e11ff45ec775.png)
  <br>다시 로그인 페이지입니다. 항목에 입력이 없으면 입력하라는 메시지를 표시합니다.
  <br>ID나 비밀번호가 틀린 경우도 해당 내용을 알림 창으로 알려줍니다.
  
</details>

<details><summary>일반 사용자 관련</summary>

  <br>
  
  ![image](https://user-images.githubusercontent.com/48465072/159961697-76c812f5-2068-44c5-bdef-cd22e0a66f9f.png)
  <br>일반 사용자가 로그인 하면 나오는 시설 목록 페이지입니다. Paging 기능이 적용되어 있습니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159962254-89ac6dc1-f291-4ea5-8164-99ea0aafc259.png)
  <br>키워드 검색 기능도 적용되어 있습니다.
  <br>시설 명을 클릭하면 시설에 대한 내용을 조회하는 페이지로 이동하며,
  <br>예약에 해당하는 >>>을 클릭혀면 예약하는 페이지로 이동합니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159962772-3fa9f2ff-98a8-4f4e-980d-e1b5d4c99de4.png)
  <br>시설에 대한 내용을 조회하는 페이지입니다. 모든 항목은 수정할 수 없습니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159978039-2adde773-bf35-4fee-8bab-d170a1fd7e2c.png)
  <br>예약 페이지입니다. 위에서 날짜를 선택하고 검색 버튼을 누르면 아래 표에 예약 현황이 나옵니다.
  <br>예약이 가능하면 예약 가능이라는 버튼이 활성화되며, 누군가가 예약한 상태면 예약 불가능이라고 표시됩니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159979539-19cb0e72-4413-49b1-815b-365815b9967b.png)
  <br>빨간 박스로 표시한 곳에 예약했습니다. 예약 주기에 의해 이제 당일 예약은 불가능합니다.
  <br>그래서 같은 날 예약 가능 버튼을 누르면 예약할 수 없다는 것을 알립니다.
  
<details>

