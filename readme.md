<h1 align="center">🏕️슬기로운 캠핑 생활</h1>
<p align="center">
  <img src="./readme_assets/main.PNG">
</p>

## :film_projector: [웹버전 시연영상](https://www.youtube.com/watch?v=tM0a6sy8VtI&list=PL0Fb5v3WxYRMTRXyPUl8NzQaxd4hE250B&index=1) :iphone: [모바일버전 시연영상](https://www.youtube.com/watch?v=zY-UIjQ4CIA) :loudspeaker:[기획보고서](https://drive.google.com/file/d/1KE9CfjvQqt_Vganzauj1QlP7Xih74dyl/view?usp=sharing)

<h2 align="center">📅프로젝트 소개</h2>
<p align="center">유명한 브랜드부터 떠오르는 브랜드들까지 모두 모아놓은 캠핑 용품계의 무신사, 캠핑 브랜드 멀티샵 기능과 전국의 캠핑장을 조회하고 예약할 수 있는 캠핑 계의 야놀자 기능을 합쳐놓은 서비스입니다.
</p>


<h2 align="center">📅개발 기간</h2>
<p align="center">2022-10-17 ~ 2022-11-18</p>

<h2 align="center">👪멤버 구성</h2>
<p align="center">
  <img src="./readme_assets/team-member.png">
</p>
<h2 align="center">🛠️개발 환경</h2>
<p align="center">
  <img src="./readme_assets/environment.png">
</p>
<h2 align="center">⚙️기술 스택</h2>
<p align="center">
  <img src="./readme_assets/tech_stack.png">
</p>
<h2 align="center">📱주요 기능 및 상세</h2>

|기능|상세|
|:--:|:--:|
|로그인|세션을 이용하여 로그인 구현, AdminCheck(Boolean) 값을 이용해 관리자와 회원 구분, 쿠키를 통해 로그인 가능하도록 구현, 카카오 소셜 로그인 가능하도록 구현|
|회원가입| 페이지의 input들이 유효성을 전부 통과하면 하단의 회원가입 버튼 활성화되도록 구현|
|아이디 찾기, 비밀번호 찾기|Ajax와 JavaMailSender를 활용하여 이메일 인증, Ajax를 활용해 keyup시 DB의 값과 일치 여부 확인, 일치시 하단의 버튼 활성화 |
|마이페이지 회원관리| 비밀번호 변경, 배송지 관리, 환불 계좌 관리 기능|
|장바구니| Ajax를 사용하여 삭제 및 수량 수정 구현|
|주문,주문관리|주문 구현, 주문내역 리스트 배송 상태에 따라 정렬, 배송조회/구매취소/구매확정 기능 구현 |
|결제,환불| 결제API(아임포트)를 사용하여 결제/환불 구현 |
|포인트| 포인트 적립,사용,조회 구현|
|전국 캠핑장 검색|공공데이터 API를 사용하여 전국 캠핑장의 데이터를 파싱하여 출력, ajax를 사용하여 카테고리&지역&검색어&예약가능별 검색기능 구현, ajax를 사용하여 infinite scroll 구현 |
|캠핑장 상세 페이지|공공데이터 API를 사용하여 캠핑장 데이터 표시, 카카오검색 API를 사용하여 블로그 리뷰글 파싱하여 출력, 데이터 API를 파싱하여 사진데이터와 근처캠핑장 정보를 slick slider 사용하여 출력, 지도 API 사용하여 위치 정보 구현  |
|캠핑장 댓글/별점|ajax사용하여 댓글 및 별점 crud 구현 |
|캠핑장 좋아요|ajax를 사용하여 좋아요/좋아요 취소 구현 |
|캠핑장 예약|js와 css를 사용하여 예약용 달력 구현, url조작으로 접근하지 못하도록 유효성 체크, 예약기능 및 예약 정보 제공 |
|캠핑장 마이페이지|예약, 좋아요, 댓글 리스트 확인 |
|캠핑장 관리자 페이지|캠핑장 관리, 캠핑장 사이트(객실)관리, 댓글 관리, 예약 관리 |



### 1. 로그인
<p align="center">
  <img src="./readme_assets/login.png">
<p>
<br>
  
### 2. 회원 가입
<p align="center">
  <img src="./readme_assets/register.png">
<p>
<br>
  
### 3. 아이디 찾기
<p align="center">
  <img src="./readme_assets/id_find.png">
<p>
<br>

### 4. 비밀번호 찾기
<p align="center">
  <img src="./readme_assets/pw_find.png">
<p>
<br>
  
### 5. 마이페이지
<p align="center">
  <img src="./readme_assets/mypage.png">
<p>
<br>

### 6. 마이페이지 회원관리
<p align="center">
  <img src="./readme_assets/mypage_member.png">
<p>
<br>

### 7. 장바구니
<p align="center">
  <img src="./readme_assets/장바구니.png">
<p>
<br>

### 8. 주문,결제
<p align="center">
  <img src="./readme_assets/order.png">
<p>
<br>

### 9. 주문완료 리스트, 취소 리스트
<p align="center">
  <img src="./readme_assets/orderList.png">
<p>
<br>

### 10. 배송 조회, 포인트 조회
<p align="center">
  <img src="./readme_assets/point-dilivery.png">
<p>
<br>

### 11. 관리자-주문 리스트
<p align="center">
  <img src="./readme_assets/관리자-주문내역.png">
<p>
<br>

### 12. 관리자-취소주문 리스트
<p align="center">
  <img src="./readme_assets/관리자-취소리스트.png">
<p>
<br>
  
### 13. 전국 캠핑장 검색
<p align="center">
  <img style="height : 600px; padding: 10px;" src="https://user-images.githubusercontent.com/108412831/205023621-58bc6da5-dcb3-4467-ada2-4e4d05f837b4.gif">
  <img style="height : 600px; padding: 10px;" src="https://user-images.githubusercontent.com/108412831/205024448-7dd3d5c8-f43c-4715-88b4-3d770c317ee3.gif">
<p>
<br>

### 14. 캠핑장 상세 페이지, 좋아요, 댓글
<p align="center">
<img style="height : 600px; padding: 10px;" src="https://user-images.githubusercontent.com/108412831/205026905-b90f70db-c9dd-4450-868c-b6b891e2f1af.gif">
<img style="height : 600px; padding: 10px;" src="https://user-images.githubusercontent.com/108412831/205027152-a4e001b5-cc55-4fd0-a245-4896da491859.gif">
<p>
<br>

### 15. 캠핑장 예약
<p align="center">
  <img style="height : 600px; padding: 10px;" src="https://user-images.githubusercontent.com/108412831/205027999-4fa80ce9-5e6d-4455-afec-406553154f95.gif">
  <img style="height : 600px; padding: 10px;" src="https://user-images.githubusercontent.com/108412831/205028099-4083b8e1-7f41-4bfa-ba24-12d7b7897d10.gif">
<p>
<br>

### 16. 캠핑장 마이페이지
<p align="center">
  <img style="height : 450px" src="https://user-images.githubusercontent.com/108412831/205028330-e6872dc8-547c-4c8e-a57a-1a386cc64d21.PNG">
  <img style="height : 450px" src="https://user-images.githubusercontent.com/108412831/205028364-a66679bb-a80a-4ac2-af0e-926b889c3673.PNG">
  <img style="height : 450px" src="https://user-images.githubusercontent.com/108412831/205028410-1cfeb0c5-4340-4284-9482-ed4bdbc1eafd.PNG">
  <img style="height : 450px" src="https://user-images.githubusercontent.com/108412831/205028439-033d1f08-0e4b-452a-b7fb-5001b57d0098.PNG">  
<p>
<br>


  
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
<h2 align="center">✔︎레퍼런스</h2>
<p align="center">이 프로젝트는 무신사와 아더에러 사이트를 참고하여 학습용으로 작업 되었습니다.</p>
