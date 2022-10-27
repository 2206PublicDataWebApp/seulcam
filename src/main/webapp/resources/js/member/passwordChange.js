    $(function() { 
        $(".password.ok").hide();
        $(".password.error").hide();
        $(".newpassword.error").hide();
        $(".passwordregex.ok").hide();
	    $(".passwordregex.error").hide();
	    $(".passwordCheck.ok").hide();
	    $(".passwordCheck.error").hide();
        $("#memberPw").on("keyup", function(){
            let memberId = $("#memberId").val();
            let memberPw = $("#memberPw").val();
            let NewmemberPw = $("#newMemberPw").val();
            let NewmemberPwCheck = $("#newMemberPwCheck").val();
            $.ajax({
                url:"/member/memberPwCheck",
                type:"post",
                data:{"memberId" : memberId,
                      "memberPw": memberPw},
                success:function(result){
                    if(result != "0"){    //비밀번호가 DB와 일치하면,
                        $(".password.ok").show();
                        $(".password.error").hide();
                        $("#memberPw").attr("readonly",true);
                        $(".curPw").css('background-color', '#f3f3f3');
                        $("#memberPw").css('background-color', '#f3f3f3');
                        $("#newMemberPw").attr("disabled",false);
                        $(".newPw").css('background-color', '#fff')
                        				 .css('cursor','text');
                        $("#newMemberPwCheck").attr("disabled",false);
                        $(".newPwCheck").css('background-color', '#fff')
                        				 .css('cursor','text');
                        

                    }else{  //비밀번호가 DB와 일치하지 않으면,
                        $(".password.ok").hide();
                        $(".password.error").show();
                    }

                },
                error:function(){
                }
            });
        });


        $("#newMemberPw").on("keyup", function(){
            let newMemberPw = $("#newMemberPw").val();
            let newMemberPwCheck = $("#newMemberPwCheck").val();
            var REGEX = /^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,16}$/;
            if(!REGEX.test($('#newMemberPw').val())) { // 비밀번호 유효성 검사를 통과하지 못하면
                $(".passwordregex.ok").hide();
                $(".passwordregex.error").show();
                $(".submit-button").attr("disabled",true);
                $(".submit-button").css('background-color', '#f3f3f3')
                                 .css("color", '#b3b3b3')
                                 .css("cursor", "default");
            } else {  // 비밀번호 유효성 검사를 통과하면
                $(".passwordregex.ok").show();
                $(".passwordregex.error").hide();
                if(newMemberPw == newMemberPwCheck) {
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
    
    
        $("#newMemberPwCheck").on("keyup", function(){
            let newMemberPw = $("#newMemberPw").val();
            let newMemberPwCheck = $("#newMemberPwCheck").val();
            var REGEX = /^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,16}$/;
            if(!REGEX.test($('#newMemberPwCheck').val())) {
                $(".submit-button").attr("disabled",true);
                $(".submit-button").css('background-color', '#f3f3f3')
                                 .css("color", '#b3b3b3')
                                 .css("cursor", "default");
                $(".passwordCheck.ok").hide();
                $(".passwordCheck.error").show();
            } else {
                $(".passwordregex.ok").show();
                $(".passwordregex.error").hide();
                if(newMemberPw == newMemberPwCheck) {
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

        
});