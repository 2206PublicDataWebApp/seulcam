    $(function() { 
    	const regPw = "^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$";
        $(".password.ok").hide();
        $(".password.error").hide();
        $(".newpassword.error").hide();
        
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
                        $(".curPw").css('background-color', '#f3f3f3')
        
                    }else{  //비밀번호가 DB와 일치하지 않으면,
                        $(".password.ok").hide();
                        $(".password.error").show();
                        $(".submit-button").attr("disabled",true);
                        $(".submit-button").css('background-color', '#f3f3f3')
                                         .css("color", '#b3b3b3')
                                         .css("cursor", "default");
                    }
                },
                error:function(){
                }
    });
    });

        $("#newmemberPw").on("keyup", function() {
            let memberId = $("#memberId").val();
            let memberPw = $("#memberPw").val();
            let NewmemberPw = $("#newMemberPw").val();
            let NewmemberPwCheck = $("#newMemberPwCheck").val();
            if(NewmemberPw != NewmemberPwCheck) {
                $(".newpassword.error").show();
            } 
        });
});