<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 리스트</title>
<!-- jQuery -->
<script src="../../../resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
    <!-- 헤더&메뉴바 -->
	
	<!-- 컨텐츠 -->
	<h1>캠핑장 리스트</h1>
	<div class="contents">
		<div id="contents-wrap">
				<div class="contents-noside">
                    <input type="button" onclick="clicki()">
				</div>
		</div>
	</div>
	<!-- 푸터 -->
    

    <script>
        $(document).ready(function(){
            $.ajax({
                url : "http://apis.data.go.kr/B551011/GoCamping/basedList?serviceKey=qbHoplMaKq5PUqUFEhfVjBpLiBxBcVPOw%2Fio3GvQ91q8xQjh%2BLZMz4caQ5Nqyt%2BU%2BeCGuAPRaJHRIhTzUqKmHw%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json",
                type : "GET",
                data : {},
                dataType : "json",
                success : function(data){
                    console.log(data.response.body.numOfRows)
                    for(var i = 0; i<data.response.body.items.item.length;i++ ){
                        console.log("캠핑장 이름 : " + data.response.body.items.item[i].facltNm)
                        console.log("캠핑장 한줄소개 : " + data.response.body.items.item[i].lineIntro)
                        console.log("캠핑장 설명 : " + data.response.body.items.item[i].intro)
                        console.log("캠핑장 카테고리 " + data.response.body.items.item[i].induty)
                        console.log("캠핑장 주소 :  " + data.response.body.items.item[i].addr1)
                        console.log("--------------------------------------------------------")
                        
                    }
                },
                error : function(){
                    console.log("출력실패");
                }
            })

            $.ajax({
                url : "/campListShow.kh",
                type : "GET",
                data : {},
                dataType : "json",
                success : function(data){
                    console.log(data)
                },
                error : function(){
                    console.log("출력실패");
                }
            })

        })
        
        // var xhr = new XMLHttpRequest();
        // var url = 'https://apis.data.go.kr/B551011/GoCamping/basedList'; /*URL*/
        // var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'qbHoplMaKq5PUqUFEhfVjBpLiBxBcVPOw%2Fio3GvQ91q8xQjh%2BLZMz4caQ5Nqyt%2BU%2BeCGuAPRaJHRIhTzUqKmHw%3D%3D'; /*Service Key*/
        // queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
        // queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10');
        // queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('WIN');
        // queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('seulcam'); /**/
        // queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('json');        
        // xhr.open('GET', url + queryParams);
        // xhr.onreadystatechange = function () {

        //     if (this.readyState == 4) {
        //         // console.log(this.response);
        //         console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
        //     }
        // };
        // function clicki(){
        //     console.log(queryParams)
        // }
        // xhr.send('');


        


    </script>
</body>
</html>