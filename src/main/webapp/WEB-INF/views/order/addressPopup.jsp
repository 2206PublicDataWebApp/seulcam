<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.popupcontainer {
    position: absolute;
    z-index: 2;
    top: 10px;
  	left: 350px;
    width: 100;
    height: 100;
    display: none;
    background: rgba(0, 0, 0, 0.7);
}

.popbox {
    width: 700px;
    height: 550px;
    position: relative;
    z-index: 2;
    background: white;
    box-shadow: 3px 3px 5px black;
    margin: 150px auto;
    cursor: pointer;
    text-align: center;
}

.popheadbox {
    width: 700px;
    height: 80px;
    border: 4px solid #abb2c7;
    position: relative;
}

.popheadbox__span--big {
    position: absolute;
    top: 15px;
    left: 20px;
    font-size: 40px;
    font-weight: bold;
    font-family: 'Jua', sans-serif;
}

.popheadbox__button--big {
    position: absolute;
    top: 20px;
    right: 20px;
    width: 120px;
    height: 45px;
    background-color: lightblue;
    color: black;
    border: none;
    border-radius: 5px;
    font-size: 20px;
    font-family: 'Jua', sans-serif;
    cursor: pointer;
}

.popcontentbox {
    height: 450px;
    width: 700px;
    border-left: 4px solid #abb2c7;
    border-right: 4px solid #abb2c7;
    border-bottom: 4px solid #abb2c7;
}

.popdetailbox {
    width: 100%;
    height: 80px;
    position: relative;
}

.popdetailbox__span--big {
    width: 100px;
    height: 100px;
    font-size: 23px;

    position: absolute;
    top: 40px;
    left: 60px;
    font-family: 'Jua', sans-serif;
}

.popdetailbox__span--small {
    position: absolute;
    top: 44px;
    right: 275px;
    font-weight: bolder;
}

.popdetailbox__input--gray {
    position: absolute;
    top: 36px;
    right: 100px;
    width: 350px;
    height: 30px;
    border: 2.5px solid #dadce0;
    font-size: 16px;
}
.popdetailbox__input {
    position: absolute;
    top: 36px;
    right: 100px;
    width: 350px;
    height: 30px;
    border: 2.5px solid #dadce0;
    font-size: 16px;
}

.popdetailbox__input--date {
    width: 150px;
    height: 35px;
    margin-left: 87px;
    margin-right: -47px;
    margin-top: 34px;
    border: 2.5px solid #dadce0;
    font-size: 14px;
}

.popbtnbox__input--blue {
    width: 200px;
    height: 50px;
    background-color: lightsteelblue;
    color: black;
    border: none;
    border-radius: 7px;
    font-size: 20px;
    font-family: 'Jua', sans-serif;
    margin: 30px auto;
    cursor: pointer;
}

 .pagination{
        justify-content: center;
    }
</style>
</head>
<body>
<!-- <button class="btn btn-dark" id="btn" >플래너 작성</button> -->
<div class="popupcontainer" id="popup">

    <div class="popbox">

        <!-- 플래너 팝업창 header 부분 -->
        <div class="popheadbox">
            <span class="popheadbox__span--big">배송지 변경</span>
            <button class="popheadbox__button--big" id="popdown">닫기</button>
        </div>
        <!-- // 플래너 팝업창 header 부분 -->

        <!-- 플래너 팝업창 입력 부분 -->
        <div class="popcontentbox">
            <!-- <form action="/plan/regist.kh" method="post" enctype="multipart/form-data"> -->
                <div class="popdetailbox">
                   <button class="info-button"  id="postcodify_search_button ">주소찾기</button> 
                   
                </div>
           
                <div class="popbtnbox">
                    <!-- <input type="submit" class="popbtnbox__input--blue" value="완료">
 -->                </div>
            <!-- </form> -->
        </div>
        <!-- // 플래너 팝업창 입력 부분 -->

    </div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
	$("#postcodify_search_button").postcodifyPopUp();
	</script>
<script>
$(document).ready(function () {
    $("#btn").click(function () {
        $("#popup").fadeIn();
    });
    $("#popdown").click(function () {
        $("#popup").fadeOut();
    });
});


</script>
</body>
</html>