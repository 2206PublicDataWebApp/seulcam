$(function() { 
    if($(".redirectURI").val()=="http://127.0.0.1:9999/member/congView") {
        $(".redirectURI").val("");
    }else if($(".redirectURI").val()=="http://127.0.0.1:9999/member/pwResultView") {
        $(".redirectURI").val("");
    }else if($(".redirectURI").val()=="http://127.0.0.1:9999/member/idResultView") {
        $(".redirectURI").val("");
    }
});