var regId= /^[a-zA-z0-9]{5,11}$/;
var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
var regPwd = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,30}$/;
//8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합
// 아이디 유효성 체크
$("#memberId").on('keyup', function () {

    if (!regId.test($('#memberId').val())) {
        $(".id-check").text("영문 및 숫자만 5-11자리까지 입력해주세요");
    } else {
        $(".id-check").empty();
    }
});

$("#memberPwd").on('keyup', function () {
    if (!regPwd.test($('#memberPwd').val())) {
        $(".pwd-check").text("영문, 숫자, 특수문자를 최소 한가지씩 조합하여 입력해주세요");
    } else if($("#memberPwd").val().length<8) {
        $(".pwd-check").text("8자 이상으로 입력해 주십시오.");
    }
    else {
        $(".pwd-check").empty();
    }
});

