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

<details><summary>공용 페이지 : 로그인 / 회원가입</summary>

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

<details><summary>일반 사용자 전용 페이지</summary>

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
  
  ![image](https://user-images.githubusercontent.com/48465072/159981969-3b9eac65-74e4-4eef-9999-3f0aa758d6ce.png)
  <br>빨간 박스로 표시한 곳에 예약했습니다. 예약 주기에 의해 이제 당일 예약은 불가능합니다.
  <br>그래서 같은 날 예약 가능 버튼을 누르면 예약할 수 없다는 것을 알립니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159980971-9f509375-9977-422b-867b-a9fb2fc1d17d.png)
  <br>개인 예약 목록 페이지입니다. 예약 번호를 클릭하면 해당 예약 상세 조회 페이지로 이동합니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159981144-8a092bfe-6a43-4694-8a9e-eed6233de4aa.png)
  <br>예약 상세조회 페이지입니다. 모든 내용은 수정할 수 없습니다.
  
</details>

<details><summary>시설 관리자 전용 페이지</summary>

  <br>
  
  ![image](https://user-images.githubusercontent.com/48465072/159983394-8e55990b-8a55-4704-bacf-7f469241910a.png)
  <br>시설 관리자로 로그인하면 나오는 관리자 등록 시설 목록 페이지입니다. Paging 기능이 적용되어 있습니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159984379-ffd192ca-20ff-4412-9f61-0d01b70901f5.png)
  <br>검색 기능도 적용되어 있습니다. 계정 버튼을 누르면 로그아웃을 할 수 있는 페이지로,
  <br>시설 등록 버튼을 누르면 시설을 등록하는 페이지로,
  <br>시설 명을 누르면 해당 시설 조회/변경/삭제 페이지로, 예약 관리 밑에 >>> 버튼을 누르면 예약 조회 페이지로 이동합니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159985235-b2419867-5fbd-4bed-b0ee-49c458c02619.png)
  <br>시설 등록 페이지입니다. 여기 페이지를 포함해 입력이 가능한 모든 곳에는 유효성 검증이 적용되어 있습니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159985779-8000d906-d6f3-4c82-a6d4-4e357e9396a6.png)
  <br>시설 조회/변경/삭제 페이지입니다. 유효성 검증만 통과한다면 변경할 수 있고, 시설 등록을 삭제할 수도 있습니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159992651-7e40bed5-5d0c-4f5b-a7d8-603d85879c5b.png)
  <br>예약자 정보 조회 페이지입니다. 편의성을 위해 새 창에서 해당 내용을 보여줍니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159987953-94995b79-f2ce-4960-8293-7e6b013acbca.png)
  <br>예약 상세조회 페이지입니다. 예약 삭제도 가능하며, 예약자가 있다면 예약 취소도 가능합니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159988669-5b722d9b-8cd7-4f19-932c-71ad051fbb91.png)
  <br>예약 추가 페이지입니다. 입력이 가능한 곳에 잘못된 입력이 있으면 메시지로 알려줍니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159990224-0fb51812-111d-43ac-a999-cfe9e8a886cb.png)
  <br>또한 정확한 주기를 적용하기 위해 빨간 박스로 표시한 2개의 분 단위가 나누었을 때 나머지가 없도록 입력을 검증합니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159991102-a5027116-7cb9-486b-80f8-1c4c0b2b0342.png)
  <br>해당 시설은 시작 일자와 마지막 일자 사이에 예약이 이미 존재합니다.
  <br>예약이 겹치는 경우를 막기위해, 이런 경우를 통과시키지 않고 알립니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159992064-63583f79-9280-4427-9868-b0f642585db7.png)
  <br>추가 버튼을 클릭하면 하단 표에 예약 대기 현황을 표시합니다.
  <br>체크박스를 선택하고 삭제하면 해당 날짜를 예약 대기 현황에서 삭제할 수 있습니다.
  
</details>

## 마치며

원래 계획한 것을 모두 구현한 것은 아닙니다. 아래 내용도 추가로 구현할 계획입니다.

- 모바일 브라우저 환경에 맞는 페이지, 모바일 app을 만들어 접근성 향상
- 필터링 기능 적용 (지역 구분 탐색, 즐겨찾기 높은 순서대로)
- 시설 즐겨찾기 구현 (개인 즐겨찾기 목록, 시설 목록 옆에 즐겨찾기 개수 표시)
- 시설 이미지 등록 및 표시
- 예약 추가 개선 (중간에 빈 시간이 가능하도록 하고, 요일 별 패턴을 적용)
- 예약 삭제 개선 (예약을 한 번에 삭제하는 기능 추가)
- 테이블 정렬 기능 구현 (표 제목 누르면 날짜 빠른 순서 혹은 늦은 순서 정렬)
- 예약 기능 개선
   - 대안1) 예약 승인 제도 (바로 예약되는 것이 아니라 시설 관리자가 승인해야 예약)
   - 대안2) 그룹 제도 (시설 관리자가 그룹에 포함한 사용자만 해당 시설 예약 가능)
- 검증된 시설 관리자만 가입할 수 있도록 개선 (시설 관리자를 검증하여 받는 새로운 권한인 app 운영자를 추가)
- 예약 취소, 삭제하는 경우 사용자와 관리자가 소통할 수 있는 방안 마련 (쪽지, 이메일, SMS)
- Front-end 뿐만 아니라 Back-end에서의 유효성 검증도 구현
