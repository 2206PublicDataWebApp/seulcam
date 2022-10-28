$(document).ready(function(){	
	Kakao.init('b1fcfc4317f4a8ecc9df881c1d6aad20');
});

function kakaoLogin(){
  window.Kakao.Auth.login({
      scope:'account_email',
      success: function(authObj){
          console.log(authObj);
          window.Kakao.API.request({
              url: '/v2/user/me',
              success: res => {
                  const email = res.kakao_account.email;
                  $('#kakaoemail').val(email);
                  $("#kakaoForm").submit();
              }
          });

      }
  });
}