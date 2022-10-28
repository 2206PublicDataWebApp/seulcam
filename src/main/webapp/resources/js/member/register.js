var regId= /^[a-zA-z0-9]{5,11}$/;
var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
var regPw = /^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,16}$/;
var regNickname= /^[a-zA-z0-9가-힣]{1,15}$/;
$(".passwordregex.ok").hide();
$(".passwordregex.error").hide();
$(".passwordCheck.ok").hide();
$(".passwordCheck.error").hide();
$(".nickname.ok").hide();
$(".nickname.error").hide();
$(".nickname.regerror").hide();
$(".emailregex.ok").hide();
$(".emailregex.error").hide();




$(function() { 
    $(".idreg.error").hide();
    $(".id.ok").hide();
    $(".id.error").hide();
    $("#memberId").on('keyup', function () {
        let memberId = $("#memberId").val();

        if (!regId.test($('#memberId').val())) {
            $(".id.ok").hide();
            $(".id.error").hide();
            $(".idreg.error").show();
            $('#memberId').removeClass('pass');
        } else {
            $.ajax({
                url:"/member/memberIdCheck",
                type:"get",
                data:{"memberId" : memberId},
                success:function(result){
                    if(result != "0"){    // 해당하는 아이디가 존재하면,
                        $(".id.ok").hide();
                        $(".id.error").show();
                        $(".idreg.error").hide();
                        $('#memberId').removeClass('pass');
        
                    }else{  // 해당하는 아이디가 존재하지 않으면,
                        $(".id.ok").show();
                        $(".id.error").hide();
                        $(".idreg.error").hide();
                        $('#memberId').addClass('pass');
                    }
                },
                error:function(){
                }
            });
        }
    });

    $("#memberPw").on("keyup", function(){
        let memberPw = $("#memberPw").val();
        let memberPwCheck = $("#memberPwCheck").val();
        if(!regPw.test($('#memberPw').val())) { // 비밀번호 유효성 검사를 통과하지 못하면
            $(".passwordregex.ok").hide();
            $(".passwordregex.error").show();
            $('#memberPw').removeClass('pass');
        } else {  // 비밀번호 유효성 검사를 통과하면
            $(".passwordregex.ok").show();
            $(".passwordregex.error").hide();
            if(memberPw == memberPwCheck) {
                $(".passwordregex.ok").hide();
                $(".passwordregex.error").hide();
                $(".passwordCheck.ok").show();
                $(".passwordCheck.error").hide();
                $('#memberPw').addClass('pass');
            }else {
                $(".passwordregex.ok").show();
                $(".passwordregex.error").hide();
                $(".passwordCheck.ok").hide();
                $(".passwordCheck.error").show();
                $('#memberPw').removeClass('pass');
            }
        }
        });


    $("#memberPwCheck").on("keyup", function(){
        let memberPw = $("#memberPw").val();
        let memberPwCheck = $("#memberPwCheck").val();
        
        if(!regPw.test($('#memberPwCheck').val())) {
            $(".passwordCheck.ok").hide();
            $(".passwordCheck.error").show();
            $('#memberPw').removeClass('pass');
        } else {
            $(".passwordregex.ok").show();
            $(".passwordregex.error").hide();
            if(memberPw == memberPwCheck) {
                $(".passwordregex.ok").hide();
                $(".passwordregex.error").hide();
                $(".passwordCheck.ok").show();
                $(".passwordCheck.error").hide();
                $('#memberPw').addClass('pass');
            }else {
                $(".passwordregex.ok").show();
                $(".passwordregex.error").hide();
                $(".passwordCheck.ok").hide();
                $(".passwordCheck.error").show();
                $('#memberPw').removeClass('pass');
            }
        }
    });

    $("#memberNickname").on("keyup", function(){
        let memberNickname = $("#memberNickname").val();
        if (!regNickname.test($('#memberNickname').val())) {
            $(".nickname.regerror").show();
            $(".nickname.ok").hide();
            $(".nickname.error").hide();
            $('#memberNickname').removeClass('pass');
    	} else {
    	$.ajax({
            url:"/member/memberNicknameCheck",
            type:"get",
            data:{"memberNickname" : memberNickname},
            success:function(result){
                if(result != "0"){    // 해당하는 닉네임이 존재하면, 
                    $(".nickname.ok").hide();
                    $(".nickname.error").show();
                    $(".nickname.regerror").hide();
                    $('#memberNickname').removeClass('pass');
    
                }else{  // 해당하는 닉네임이 존재하지 않으면,

                    $(".nickname.ok").show();
                    $(".nickname.error").hide();
                    $(".nickname.regerror").hide();
                    $('#memberNickname').addClass('pass');
                }
            },
            error:function(){
            }
        });
    }});

    $("#memberEmail").on("keyup", function(){
        let memberEmail = $("#memberEmail").val();
        if(!regEmail.test($('#memberEmail').val())) { // 이메일 유효성 검사를 통과하지 못하면
            $(".emailregex.error").show();
            $(".emailregex.ok").hide();
            $('#memberEmail').removeClass('pass');
        } else {  // 이메일 유효성 검사를 통과하면
            $(".emailregex.error").hide();
            $(".emailregex.ok").show();
            $('#memberEmail').addClass('pass');
        }
    });

    $(window).on('keyup', function () {
        if(
            ($("#memberId").hasClass("pass") === true) && ($("#memberPw").hasClass("pass") === true) && ($("#memberNickname").hasClass("pass") === true) && ($("#memberEmail").hasClass("pass") === true)) {
            // 모든 class에 pass가 존재하면 
            $(".join-button").attr("disabled",false);
            $(".join-button").css('background-color', '#0078ff')
                             .css('border-color', '#0078ff')
                             .css("color", '#fff')
                             .css("cursor", "pointer");
        } else {
            $(".join-button").attr("disabled",true);
            $(".join-button").css('background-color', '#f3f3f3')
                            .css('border-color', '#f3f3f3')
                             .css("color", '#b3b3b3')
                             .css("cursor", "default");
        }
    });

});