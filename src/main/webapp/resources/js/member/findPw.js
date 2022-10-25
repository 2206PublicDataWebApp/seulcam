function getPwResult() {
    var mId = $("#memberId").val();
    location.href='/member/pwResultView?memberId='+mId;
}

$(function() { 
	$(".id.ok").hide();
	$(".id.error").hide();
    $(".email.ok").hide();
	$(".email.error").hide();
	$(".auth-number.ok").hide();
	$(".auth-number.error").hide();
	let email_auth_cd = 'derg51ergegv';


    $("#memberId").on("keyup", function(){
        let memberEmail = $("#memberEmail").val();
	    let memberId = $("#memberId").val();
	    $.ajax({
	        url:"/member/memberIdCheck",
	        type:"get",
	        data:{"memberId" : memberId},
	        success:function(result){
	            if(result != "0"){    // 해당하는 아이디가 존재하면,
	                $(".id.ok").show();
	                $(".id.error").hide();
	
	            }else{  // 해당하는 아이디가 존재하지 않으면,
	                $(".id.ok").hide();
	                $(".id.error").show();
	            }
	        },
	        error:function(){
	        }
	    });

        $.ajax({
            url:"/member/memberIdEmailCheck",
            type:"get",
            data:{"memberEmail" : memberEmail,
                   "memberId" : memberId },
            success:function(check){
                if(check != "0") {
                    $(".auth-button").attr("disabled",false);
	                $(".auth-button").css('background-color', '#0078ff')
	                                 .css("color", '#fff')
	                                 .css("cursor", "pointer");
                }else{
                    $(".auth-button").attr("disabled",true);
	                $(".auth-button").css('background-color', '#f3f3f3')
	                                 .css("color", '#b3b3b3')
	                                 .css("cursor", "default");
                }
            },
            error:function(){
            }
        });
	});


	$("#memberEmail").on("keyup", function(){
	    let memberEmail = $("#memberEmail").val();
        let memberId = $("#memberId").val();
	    $.ajax({
	        url:"/member/memberEmailCheck",
	        type:"get",
	        data:{"memberEmail" : memberEmail},
	        success:function(result){
	            if(result != "0"){    // 해당하는 이메일이 존재하면,
	                $(".email.ok").show();
	                $(".email.error").hide();

	
	            }else{  // 해당하는 이메일이 존재하지 않으면,
					$(".email.ok").hide();
	                $(".email.error").show();
	                $(".auth-button").attr("disabled",true);
	                $(".auth-button").css('background-color', '#f3f3f3')
	                                 .css("color", '#b3b3b3')
	                                 .css("cursor", "default");
	            }
	        },
	        error:function(){
	        }
	    });


        $.ajax({
            url:"/member/memberIdEmailCheck",
            type:"get",
            data:{"memberEmail" : memberEmail,
                   "memberId" : memberId },
            success:function(check){
                if(check != "0") {
                    $(".auth-button").attr("disabled",false);
	                $(".auth-button").css('background-color', '#0078ff')
	                                 .css("color", '#fff')
	                                 .css("cursor", "pointer");
                }else{
                    $(".auth-button").attr("disabled",true);
	                $(".auth-button").css('background-color', '#f3f3f3')
	                                 .css("color", '#b3b3b3')
	                                 .css("cursor", "default");
                }
            },
            error:function(){
            }
        });
	});
	
	
	$(".auth-button").click(function(){	     	 
	    let email = $('#memberEmail').val();
	    $.ajax({
	           type : "POST",
	           url : "/emailAuth",
	           data : {email : email},
	           success: function(data){
	               alert("인증번호가 발송되었습니다.");
	               email_auth_cd = data;
                   $(".id.ok").hide();
                   $(".id.error").hide();
	               $(".email.ok").hide();
	               $("#memberEmail").attr("readonly",true);
	               $("#memberEmail").css('background-color', '#f3f3f3')
	               					.css("cursor", "default");
	
				   $(".email-auth").css('background-color', '#f3f3f3');
	               $("#email-auth-number").attr("disabled",false);
	               $("#email-auth-number").css('background-color', '#fff');
	               $(".auth-button").attr("disabled",true);
	               $(".auth-button").css('background-color', '#E6E6E6')
	               					.css("cursor", "default");
                   $(".findpw-id").attr("readonly",true);
                   $(".findpw-id").css('background-color', '#f3f3f3')
                                  .css("cursor", "default");
	           },
	           error: function(data){
	               alert("메일 발송에 실패했습니다.");
	           }
	       }); 
	});
	
	$("#email-auth-number").on("keyup", function() {
	    let eamil_auth_number = $("#email-auth-number").val();
	    if(eamil_auth_number == email_auth_cd){
	        $(".auth-number.ok").show();
	        $(".auth-number.error").hide();
	        $(".submit-button").attr("disabled",false);
	        $(".submit-button").css('background-color', '#0078ff')
	                           .css("color", '#fff')
	                           .css("cursor", "pointer");
	    }else{
	        $(".auth-number.ok").hide();
	        $(".auth-number.error").show();
	        $(".submit-button").attr("disabled",true);
	        $(".submit-button").css('background-color', '#f3f3f3')
	                           .css("color", '#b3b3b3')
	                           .css("cursor", "default");
	    }
	});

});