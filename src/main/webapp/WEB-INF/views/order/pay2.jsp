<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제모듈 테스트</title>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="../../../resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
<span id="contractSpan">계약하기</span>
                  <button id="kakaoPayBtn" type="button" onclick="requestPay('${c.ctitle}')">
                     <img src="images/payment_icon_yellow_small.png">
                  </button>
                  
                  <script>
        var IMP = window.IMP;  // 팝업창
        /* IMP.init("imp67011510"); */
        IMP.init("imp56144003");// 아임포트 가맹점 식별코드
      
        var today = new Date(); //일 
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds(); //밀리초
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;

        function requestPay(itemName) { //인자 값으로 컨트롤러로부터 받아온 차량명 데이터를 삽입하였다.
         console.log(itemName);
            IMP.request_pay({ //요청하는 것들
                pg : 'kakaopay', //카카오페이 API래핑
                /*                 'kakao':카카오페이,           
            html5_inicis':이니시스(웹표준결제)                 
            'nice':나이스페이                  
            'jtnet':제이티넷   
            'uplus':LG유플러스             
            'danal':다날             
            'payco':페이코             
            'syrup':시럽페이              
            'paypal':페이팔              
             */
             /* pay_method : 'card', */
               /*               
               'samsung':삼성페이,  
               'card':신용카드,          
               'trans':실시간계좌이체,            
               'vbank':가상계좌,            
               'phone':휴대폰소액결제          
                */
                merchant_uid: "IMP"+makeMerchantUid,  // 상점에서관리하는 상품번호
                name : itemName, //상품명
                amount : 500000, //가격
                buyer_email : 'Iamport@chai.finance', //구매자 이메일
                buyer_name : '아임포트 기술지원팀', //구매자 이름
                buyer_tel : '010-1234-5678', //구매자 번호
                buyer_addr : '서울특별시 강남구 삼성동', //구매자 주소 
                buyer_postcode : '123-456'
                /* m_redirect_url : 'https://www.yourdomain.com/payments/complete' */
            }, function (rsp) { // callback
                if (rsp.success) {
                    console.log(rsp);
                    var msg = '결제가 완료되었습니다.\n';
               msg += '고유ID : ' + rsp.imp_uid+"\n";
               msg += '상점 거래ID : ' + rsp.merchant_uid+"\n";
               msg += '결제 금액 : ' + rsp.paid_amount+'원\n';
               msg += '카드 승인번호 : ' + rsp.apply_num;
                } else {
                    console.log(rsp);
                    var msg = '결제에 실패하였습니다.\n';
               msg += '에러내용 : ' + rsp.error_msg;
                }
                alert(msg);
            });
        }
    </script>
</body>
</html>