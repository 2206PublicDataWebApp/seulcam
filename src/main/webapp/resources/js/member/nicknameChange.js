$(function() { 
	var regNickname= /^[a-zA-z0-9가-힣]{1,15}$/;
    $(".nickname.ok").hide();
    $(".nickname.error").hide();
    $(".nickname.regerror").hide();
    
    $("#memberNickname").on("keyup", function(){
        let memberNickname = $("#memberNickname").val();
        if (!regNickname.test($('#memberNickname').val())) {
            $(".nickname.regerror").show();
            $(".nickname.ok").hide();
            $(".nickname.error").hide();
            $(".submit-button").attr("disabled",true);
            $(".submit-button").css('background-color', '#f3f3f3')
                             .css("color", '#b3b3b3')
                             .css("cursor", "default");
    	} else {
    	$.ajax({
            url:"/member/memberNicknameCheck",
            type:"get",
            data:{"memberNickname" : memberNickname},
            success:function(result){
                if(result != "0"){    // 해당하는 닉네임이 존재하면, 변경 버튼 비활성화
                    $(".nickname.ok").hide();
                    $(".nickname.error").show();
                    $(".nickname.regerror").hide();
                    $(".submit-button").attr("disabled",true);
                    $(".submit-button").css('background-color', '#f3f3f3')
                                     .css("color", '#b3b3b3')
                                     .css("cursor", "default");
    
                }else{  // 해당하는 닉네임이 존재하지 않으면, 변경 버튼 활성화

                    $(".nickname.ok").show();
                    $(".nickname.error").hide();
                    $(".nickname.regerror").hide();
                    $(".submit-button").attr("disabled",false);
                    $(".submit-button").css('background-color', '#0078ff')
                                     .css("color", '#fff')
                                     .css("cursor", "pointer");
                }
            },
            error:function(){
            }
        });
    }});
});