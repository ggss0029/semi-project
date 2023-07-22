# 우동 : 자취생을 위한 사이트
## 개발 기간

2023.04.17 ~ 2023.05.04

## 프로젝트 소개

[우동 : 우리 동네]의 줄임말로써
자취생들에게 필요한 정보를 제공하고 소통할 수 있는 커뮤니티 사이트입니다. <br>
동네 정보, 나눔, 이웃과 정보 공유 등 여러 서비스를 한 번에 지원하여 해당 동네에 대한 정보를 편리하게 접할 수 있도록 구성하였습니다.

## 기능

* 로그인 / 회원가입
  * 회원가입
  * 로그인 / 소셜 로그인
  * 이메일 인증
  * 아이디 / 비밀번호 찾기
  * 주소 API 활용
* 마이페이지
  * 정보 조회
  * 정보 수정
  * 비밀번호 변경
  * 작성한 게시글 조회
  * 회원 탈퇴
* 메인 페이지
  * 실시간 검색어 조회
  * 통합 검색
  * 인기글 TOP5 조회
  * 최신글 조회
  * 사진 게시판을 이용한 UI
* 다양한 정보 게시판
  * 게시판 종류 : 동네 소식, 살림 꿀팁, 동네 맛집, 나눔할게요, 같이 해요, 같이 사요, 자유게시판
  * 조건 검색으로 원하는 카테고리 조회
  * 게시판 CRUD
  * 댓글 CRUD
  * 사진 첨부
* 지도 API
  * 생생한 동네 맛집 정보 공유
* 쪽지 기능
* 프로필 모달
  * 회원의 나이대 / 거주지 확인
  * 쪽지 보내기
  * 쓴 글 보기
  * 회원 추천
* 관리자 페이지
  * 회원 관리
  * 블랙 리스트 관리
* 공지사항 / 자주 묻는 질문 CRUD

## 역할 분담

- 한성
  * 로그인
  * 아이디/비밀번호 찾기
  * 통합 검색 결과 페이지
  * 인기글 페이지
  * 쪽지 기능
  * 동네 맛집, 나눔할게요 게시판(CRUD, 댓글 CRUD, 사진 첨부, 조건 검색 기능)
- 안채영
  * 메인페이지(최신글 조회, 실시간 검색어 순위 조회, CSS)
  * 메뉴바
  * 회원가입
  * 같이 해요 게시판(CRUD, 댓글 CRUD, 프로필 모달 조회)
  * 마이페이지(작성한 게시글 조회)
- 정희재
  * 관리자 페이지(회원 관리, 블랙리스트)
  * 마이페이지(회원 탈퇴)
  * 자유 게시판(CRUD, 댓글 CRUD)
- 권수지
  * 마이페이지(회원 정보 조회 / 수정)
  * 동네 소식, 살림 꿀팁, 같이해요 게시판(CRUD, 댓글 CRUD, 조건 검색 기능)
  * FAQ/공지사항

## 개발 환경
<div align=center> 
<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> 
  <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> 
  <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> 
  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> 
  <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
  <br>
  
  <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"> 
  <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
  <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">
  <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
</div>

## 구현 화면

### 메인페이지
![로그아웃된 메인페이지](https://github.com/ggss0029/semi-project/assets/129145703/51c72892-c682-45a4-9911-f5ed4867693d)

### 로그인
![로그인페이지](https://github.com/ggss0029/semi-project/assets/129145703/7289a486-5fc3-4981-a584-31a5c5d0062d)

### 회원가입
![회원가입페이지](https://github.com/ggss0029/semi-project/assets/129145703/def25173-913a-4afb-ade4-e5965fd741f8)

### 게시판
#### <동네 소식>
![동네소식](https://github.com/ggss0029/semi-project/assets/129145703/4f4ef3cd-1aed-4452-bc22-490dab437509)
#### <동네 맛집>
![동네맛집](https://github.com/ggss0029/semi-project/assets/129145703/ef9d5be5-9893-49a3-9c13-fd92f09ae31d)
#### <나눔할게요>
![나눔할게요](https://github.com/ggss0029/semi-project/assets/129145703/0dfc2166-9017-436e-9387-bcc8a8a6a4a9)
#### <같이 해요>
![같이해요](https://github.com/ggss0029/semi-project/assets/129145703/74c4b62a-1e9f-4c51-a14f-b25898bc0171)

### 마이페이지
#### <나의 정보>
![마이페이지-나의정보](https://github.com/ggss0029/semi-project/assets/129145703/23e3c0a3-7be4-4ab4-b41c-05e52e505dca)
#### <개인 정보 수정>
![개인정보수정](https://github.com/ggss0029/semi-project/assets/129145703/f53e7a27-939d-4899-b0b9-1d56eb37011b)
![비밀번호 변경](https://github.com/ggss0029/semi-project/assets/129145703/9a7a2479-b4e0-42ba-90cf-5e8dad1187ca)
#### <작성한 게시글>
![마이페이지-작성한 게시글](https://github.com/ggss0029/semi-project/assets/129145703/e89db219-980f-491a-9577-4139cf09b589)
#### <회원 탈퇴>
![회원탈퇴](https://github.com/ggss0029/semi-project/assets/129145703/43394073-7db4-4cb3-b1ee-1a38e8e0ee92)
#### 관리자 권한 - <회원 관리>
![회원관리](https://github.com/ggss0029/semi-project/assets/129145703/f187a5c3-c8b0-4651-b935-08011e8b0c49)
#### 관리자 권한 - <블랙리스트 관리>
![블랙리스트관리](https://github.com/ggss0029/semi-project/assets/129145703/141a849f-80a5-426c-a61c-1ced07973285)

### 공지사항 & FAQ
![웹 캡처_22-7-2023_213143_localhost](https://github.com/ggss0029/semi-project/assets/129145703/1d927a96-8ef9-4ea2-9367-cf2aefc14d30)
![관리자 faq](https://github.com/ggss0029/semi-project/assets/129145703/6a2f74bb-89a1-47fd-9a52-ae5c7dd93fa0)

### 쪽지
#### <쪽지 쓰기>
![쪽지 쓰기](https://github.com/ggss0029/semi-project/assets/129145703/5cdc82ec-2ee2-4c3c-9dd2-ab99108b7377)
![쪽지쓰기-닉네임 검색](https://github.com/ggss0029/semi-project/assets/129145703/9be455ca-2b46-48e2-a689-4b7540c2c84a)
#### <보낸 쪽지함>
![보낸쪽지함](https://github.com/ggss0029/semi-project/assets/129145703/636dac0a-f07a-460b-97eb-ba62f177a215)
#### <받은 쪽지함>
![받은 쪽지함](https://github.com/ggss0029/semi-project/assets/129145703/b4d9f96a-0694-4f1e-a126-d0d1c57f693d)
