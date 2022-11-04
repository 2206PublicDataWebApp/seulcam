$(document).ready(function(){
    $('#memberPwEye').on('click',function(){
        $('#memberPw').toggleClass('active');
        if($('#memberPw').hasClass('active')){
            $('#memberPwEye i').attr('class',"fa fa-eye-slash fa-lg");
            $('#memberPw').attr('type',"text");
        }else{
            $('#memberPwEye i').attr('class',"fa fa-eye fa-lg");
            $('#memberPw').attr('type','password');
        }
    });

    $('#newMemberPwEye').on('click',function(){
        $('#newMemberPw').toggleClass('active');
        if($('#newMemberPw').hasClass('active')){
            $('#newMemberPwEye i').attr('class',"fa fa-eye-slash fa-lg");
            $('#newMemberPw').attr('type',"text");
        }else{
            $('#newMemberPwEye i').attr('class',"fa fa-eye fa-lg");
            $('#newMemberPw').attr('type','password');
        }
    });

    $('#newMemberPwCheckEye').on('click',function(){
        $('#newMemberPwCheck').toggleClass('active');
        if($('#newMemberPwCheck').hasClass('active')){
            $('#newMemberPwCheckEye i').attr('class',"fa fa-eye-slash fa-lg");
            $('#newMemberPwCheck').attr('type',"text");
        }else{
            $('#newMemberPwCheckEye i').attr('class',"fa fa-eye fa-lg");
            $('#newMemberPwCheck').attr('type','password');
        }
    });
});
