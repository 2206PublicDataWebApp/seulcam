$(document).ready(function(){
    $('.password-eye').on('click',function(){
        $('#memberPw').toggleClass('active');
        if($('#memberPw').hasClass('active')){
            $('.password-eye i').attr('class',"fa fa-eye-slash fa-lg");
            $('#memberPw').attr('type',"text");
        }else{
            $('.password-eye i').attr('class',"fa fa-eye fa-lg");
            $('#memberPw').attr('type','password');
        }
    });
});
