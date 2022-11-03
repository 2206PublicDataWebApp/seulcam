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

    $('#memberPwCheckEye').on('click',function(){
        $('#memberPwCheck').toggleClass('active');
        if($('#memberPwCheck').hasClass('active')){
            $('#memberPwCheckEye i').attr('class',"fa fa-eye-slash fa-lg");
            $('#memberPwCheck').attr('type',"text");
        }else{
            $('#memberPwCheckEye i').attr('class',"fa fa-eye fa-lg");
            $('#memberPwCheck').attr('type','password');
        }
    });
});
