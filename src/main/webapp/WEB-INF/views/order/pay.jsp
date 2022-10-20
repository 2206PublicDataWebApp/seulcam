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
<div id="app">
    <h1>iamport-checkout</h1>
   <!--  <input v-model="impCode" placeholder="가맹점 식별코드" value="imp56144003"> -->
    <input v-model="order.name" placeholder="상품명">
    <input v-model="order.amount" placeholder="상품가격">
    <input v-model="order.buyer_tel" placeholder="주문자 전화번호">

    <button v-on:click="requestPay">결제 요청</button>
</div>

</body>
<script>
    let app = new Vue({
        el: '#app',
        data: {
            impCode : '',
            order: {
                name : '',
                amount : null,
                buyer_tel : '',
            }
        },
        methods: {
            requestPay: function(){
                //1. 객체 초기화 (가맹점 식별코드 삽입)
                var IMP = window.IMP;
                IMP.init("imp56144003");
                //3. 결제창 호출
                IMP.request_pay({
                    pg : 'jtnet',
                    pay_method : 'card',
                    merchant_uid : 'merchant_' + new Date().getTime(),
                    name : this.order.name,
                    amount : this.order.amount,
                    buyer_tel : this.order.buyer_tel,
                }, function(rsp) {
                    if ( rsp.success ) {
                        //4. 결제 요청 결과 서버(자사)에 적용하기
                        //ajax 서버 통신 구현 -> 5. 서버사이드에서 validation check

                        //6. 최종 서버 응답 클라이언트에서 단계 4.에서 보낸 서버사이드 응답 에따라 결제 성공 실패 출력
                        var msg = '결제가 완료되었습니다.';
                        msg += '고유ID : ' + rsp.imp_uid;
                        msg += '상점 거래ID : ' + rsp.merchant_uid;
                        msg += '결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                    } else {
                        var msg = '결제에 실패하였습니다.';
                        msg += '에러내용 : ' + rsp.error_msg;
                    }
                    alert(msg);
                });
            }
        }
    });

</script>


</html>
​