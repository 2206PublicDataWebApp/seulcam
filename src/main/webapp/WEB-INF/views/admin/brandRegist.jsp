<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드등록</title>
</head>
<link rel="stylesheet" href="/resources/css/product/brandRegist.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<body>
<form action="/admin/brandRegister" method="post">
	    <h1>브랜드 등록</h1>
    <section class="brandRegist">
        <div class="box-form">
            <label>브랜드명</label>
            <input type="text" class="g-inputbox-medium textarea-title" placeholder="내용을 입력해주세요." name="brandName" value="" >
        </div>
        <div class="box-form">
            <label>오프라인 매장여부</label>
            <input type="checkbox" class="checkbox" id="my_checkbox" onclick="toggleTextbox(this)" name="storeCheck">
        </div>
        <div class="box-form">
            <label>우편번호</label>						
				<input type="text" id="storeZipcode" name="storeZipcode"  disabled>														
				<button id="btnSearchAddressC" type="Button" onclick="findDaumPostcode()" value="우편번호 찾기">
					<img src="/resources/images/search.png"  />
                </button>									
            </div>
        <div class="box-form">
            <label>기본주소</label>
            <input type="text" class="g-inputbox-medium textarea-title" placeholder="내용을 입력해주세요." id="storeAddr" name="storeAddr" value=""   disabled>
        </div>
        <div class="box-form">
            <label>상세주소</label>
            <input type="text" class="g-inputbox-medium textarea-title" placeholder="내용을 입력해주세요." name="storeAddrDetail" id="storeAddrDetail" value=""  disabled>
        </div>
        <div class="box-form">
        <input type="button" id="goBack" onclick="history.back(-1);" style="float:left; margin-left:250px;" value="뒤로가기">
        <input type="submit" value="등록하기" style="float: right">
        </div>
    </section>
</form>
<script type="text/javascript">

function toggleTextbox(checkbox) {
	  
	  const textbox_elem1 = document.getElementById('storeZipcode');
	  const textbox_elem2 = document.getElementById('storeAddr');
	  const textbox_elem3 = document.getElementById('storeAddrDetail');

	  textbox_elem1.disabled = checkbox.checked ? false : true;
	  textbox_elem2.disabled = checkbox.checked ? false : true;
	  textbox_elem3.disabled = checkbox.checked ? false : true;
	  

	  if(textbox_elem1.disabled) {
	    textbox_elem1.value = null;
	    textbox_elem2.value = null;
	    textbox_elem3.value = null;

	  }else {
	    textbox_elem1.focus();
	  }
	}

function findDaumPostcode() {
    new daum.Postcode({
      oncomplete: function (data) {
        var zoneCodeCompany = data.zonecode;
        var addressCompany = data.address;
        document.getElementById("storeZipcode").value = zoneCodeCompany; // zipcode
        document.getElementById("storeAddr").value = addressCompany; // 주소 넣기
        }
    }).open();
  }


</script>
</body>
</html>