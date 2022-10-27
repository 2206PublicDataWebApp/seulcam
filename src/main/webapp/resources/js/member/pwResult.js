$(function() { 
    $(".passwordregex.ok").hide();
    $(".passwordregex.error").hide();
    $(".passwordCheck.ok").hide();
    $(".passwordCheck.error").hide();
        $("#memberPw").on("keyup", function(){
        let memberPw = $("#memberPw").val();
        let memberPwCheck = $("#memberPwCheck").val();
        var REGEX = /^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,16}$/;
        if(!REGEX.test($('#memberPw').val())) { // 비밀번호 유효성 검사를 통과하지 못하면
            $(".passwordregex.ok").hide();
            $(".passwordregex.error").show();
            $(".submit-button").attr("disabled",true);
            $(".submit-button").css('background-color', '#f3f3f3')
                             .css("color", '#b3b3b3')
                             .css("cursor", "default");
        } else {  // 비밀번호 유효성 검사를 통과하면
            $(".passwordregex.ok").show();
            $(".passwordregex.error").hide();
            if(memberPw == memberPwCheck) {
                $(".passwordregex.ok").hide();
                $(".passwordregex.error").hide();
                $(".passwordCheck.ok").show();
                $(".passwordCheck.error").hide();
                $(".submit-button").attr("disabled",false);
                $(".submit-button").css('background-color', '#0078ff')
                                 .css("color", '#fff')
                                 .css("cursor", "pointer");
            }else {
                $(".passwordregex.ok").show();
                $(".passwordregex.error").hide();
                $(".passwordCheck.ok").hide();
                $(".passwordCheck.error").show();
                $(".submit-button").attr("disabled",true);
                $(".submit-button").css('background-color', '#f3f3f3')
                                 .css("color", '#b3b3b3')
                                 .css("cursor", "default");
            }
        }
        });


    $("#memberPwCheck").on("keyup", function(){
        let memberPw = $("#memberPw").val();
        let memberPwCheck = $("#memberPwCheck").val();
        var REGEX = /^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,16}$/;
        if(!REGEX.test($('#memberPwCheck').val())) {
            $(".submit-button").attr("disabled",true);
            $(".submit-button").css('background-color', '#f3f3f3')
                             .css("color", '#b3b3b3')
                             .css("cursor", "default");
            $(".passwordCheck.ok").hide();
            $(".passwordCheck.error").show();
        } else {
            $(".passwordregex.ok").show();
            $(".passwordregex.error").hide();
            if(memberPw == memberPwCheck) {
                $(".passwordregex.ok").hide();
                $(".passwordregex.error").hide();
                $(".passwordCheck.ok").show();
                $(".passwordCheck.error").hide();
                $(".submit-button").attr("disabled",false);
                $(".submit-button").css('background-color', '#0078ff')
                                 .css("color", '#fff')
                                 .css("cursor", "pointer");
            }else {
                $(".passwordregex.ok").show();
                $(".passwordregex.error").hide();
                $(".passwordCheck.ok").hide();
                $(".passwordCheck.error").show();
                $(".submit-button").attr("disabled",true);
                $(".submit-button").css('background-color', '#f3f3f3')
                                 .css("color", '#b3b3b3')
                                 .css("cursor", "default");
            }
        }
    });
})