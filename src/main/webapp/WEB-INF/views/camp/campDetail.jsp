<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport"
	content="width=device-width, initial-scale=1.0 user-scalable=no">
<title>${camp.facltNm}</title>
    <link rel="stylesheet" href="/resources/css/camp/switch.css">
	<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/fonts.css">
	<link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <!-- jQuery -->
    <script src="../../../resources/js/jquery-3.6.1.min.js"></script>
</head>
<style>
    body {
        font-size: 14px;
        color: #000;
        background-color: #f1f1f1;
    }
    header {
        position: fixed;
        left: 0px;
        right: 0px;
        top: 0px;
        height: 50px;
        background-color: rgb(255, 255, 255);
        z-index: 200;
        max-width: 600px;
        margin: 0 auto; 
    }
    .header-wrapper {
        display: flex;
        align-items: center;
        justify-content: center;
        max-width: 385px;
        margin: 0 auto;
        height: 50px;
        position: relative;
    }
    .body-wrapper {
        max-width: 600px;
        margin: 0 auto; 
        background-color: white;
        min-height: 100vh;
    }
    /* 컨텐츠css */
    .detailMain {
	padding-top: 70px;
    }
    .info_img{
        padding: 5px 5px;
        /* border-bottom: 10px solid rgb(243, 243, 243); */
    }
    .iconh {
        border: 2px solid #000;
        border-radius: 20%;
        
    }
    .iconh:hover{
        background-color: #000;
        color: #f1f1f1;
    }
    .infoTitle {
        font-weight: bold;
        color: rgb(39, 174, 96);
        width: 100px;
        padding: 5px;
    }
    .intro {
        margin: auto;
        padding: 10px;
        border: 1px solid #ccc;
    }
    .maps {
        padding: 10px;
    }
    .moreBlog {
        border-radius: 5px;
        border: 1px solid #343a40;
        text-align: center;
        padding: 7px;
        font-size: 16px;
    }
    .moreBlog:hover {
        background-color: #343a40;
        color: #ccc;
    }
    .reviewWrite_area > div{
        float: left;
    }
    .reviewWrite_area::after{
        content: "";
        display: block;
        clear: both;
    }
    #input {
        width: 80%;
    }
    .button {
        width: 20%;
        height: 100px;
    }
    .button > div {
        position: relative;
        top: 33px;
    }
    /* #reviewWrite {
        width: 95%;
    } */
  .star {
    position: relative;
    font-size: 1.5rem;
    color: #ddd;
  }
  
  .star input {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    opacity: 0;
    cursor: pointer;
  }
  
  .star span {
    width: 100%;
    position: absolute; 
    left: 0;
    color: red;
    overflow: hidden;
    pointer-events: none;
  }

  .reviewList {
    min-height: 100px;
    
    width: 100%;
  }
  .reviewList::after{
    content: "";
    display: block;
    clear: both;
  }
  .review_contents {
    float: left;
    width: 80%;
    height: 100%;
  }
  .review_info {
    width: 20%;
    height: 100%;
    padding: 5px;
    float: left;
  }
  .review_contents p {
    font-size: 20px;
  }
  .bi-trash-fill {
    visibility: hidden;
  }
  .reviewList i {
    padding-right: 5px;
  }
  .reviewList i:hover {
    color: blue;
  }


    </style>
<body >

    <!-- 헤더&메뉴바 -->
	<header>
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	</header>
	
	<!-- 컨텐츠 -->
    <div class="body-wrapper">

        <div class="detailMain">
            <div class="container"> 
                <div class="info_img">
                    <div  style='height: 300px; background: url(${camp.firstImageUrl}) no-repeat center center #343a40; background-size: 100%;'></div>
                    <br>
                    <div class='text-right tt' stlyle='padding-bottom: 0.75rem;'><small class='text-muted'>${camp.induty}</small></div>
                    <h3>${camp.facltNm}</h3>
                    <p>${camp.lineIntro}</p>
                    <a href="${camp.homepage}" target='_blank'>
                            <svg class="iconh" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
                                <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
                              </svg>
                    </a>
                    <hr>
                </div>
                <div class="info_detail">
                    <h4>기본정보</h4>
                    <table>
                        <tr>
                            <td class="infoTitle">캠핑형태</td>
                            <td>${camp.induty}</td>
                        </tr>
                        <tr>
                            <td class="infoTitle">환경</td>
                            <td>${camp.lctCl}</td>
                        </tr>
                        <tr>
                            <td class="infoTitle">대표번호</td>
                            <td>${camp.tel}</td>
                        </tr>
                        <tr>
                            <td class="infoTitle">주소</td>
                            <td>${camp.addr1}</td>
                        </tr>
                    </table>
                    <hr>
                    <h4>소개</h4>
                    <div class="intro">
                        ${camp.intro}
                    </div>
                    <hr>
                </div>
                <div class="blog_area">
                    <h4>블로그 후기</h4>
                </div>
                <div class="moreBlog"onclick="blogMore()">
                    더보기
                </div>
                <hr>
                <div class="map_area">
                    <h4>캠핑장 위치</h4>
                    <div class='text-right tt' stlyle='padding-bottom: 0.75rem;'><small class='text-muted'>주소 : ${camp.addr1}</small></div>
                    <div id="map" style="width:100%;height:400px;"></div>
                    <hr>
                </div>
                <h4>리뷰등록</h4>
                <div class="reviewWrite_area">
                    <div id="input">
                        <span class="star">
                            ★★★★★
                            <span id="checkstar">★★★★★</span>
                            <input type="range" id="starCount" oninput="drawStar(this)" value="10" step="1" min="1" max="10">
                        </span>
                        <textarea style="border-radius: 5px;width: 95%;" name="reviewWrite" id="reviewWrite"  rows="3" placeholder=" 리뷰를 남겨주세요."></textarea>
                    </div>
                    <div class="btn btn-secondary btn-block text-light button" onclick="insertReview()">
                        <div>등록</div>
                    </div>
                </div>
                <hr>
                <div class="review_area">
                 
                 </div>
        </div>
    </div>
            
            
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=2i99b6lxe8&submodules=geocoder"></script>    
    <script>
        var page = 1;
        //블로그 출력용 함수
        function blogLoad(){
            var url = 'https://dapi.kakao.com/v2/search/blog'; /*URL*/
            var queryParams = '?' + encodeURIComponent('sort') + '=' + encodeURIComponent('accuracy'); /**/
            queryParams += '&' + encodeURIComponent('page') + '=' + encodeURIComponent(page);
            queryParams += '&' + encodeURIComponent('size') + '=' + encodeURIComponent('5');
            queryParams += '&' + encodeURIComponent('query') + '=' + encodeURIComponent('${camp.facltNm}'); /**/
            queryParams += '&' + encodeURIComponent('serviceKey') + '='+'qbHoplMaKq5PUqUFEhfVjBpLiBxBcVPOw%2Fio3GvQ91q8xQjh%2BLZMz4caQ5Nqyt%2BU%2BeCGuAPRaJHRIhTzUqKmHw%3D%3D'; /*Service Key*/
            var urlBlog = url+queryParams;
            $.ajax({
                        url : urlBlog,
                        type : "GET",
                        data : {},
                        dataType : "json",
                        headers : {Authorization: "KakaoAK 7072f1c5ec76f11a0937d2337e6cad4e"},
                        async: false,
                        success : function(data) {
                            var str = "";
                            for (var i = 0; i < data.documents.length; i++) {
                            str += "<a href='"+data.documents[i].url+"' target='_blank'><div class='row blog' style='margin: 10px;'>"
                            str += "<div class='col-md-4'  style='height: 120px; width: 185px; background: url("+data.documents[i].thumbnail+") no-repeat center center #343a40; background-size: 100%;'></div>"
                            str += "<div class='col-md-8 blog_body' style='overflow: hidden; height: 130px;'><h6><b>"+data.documents[i].title+"</b></h6><div class='text-right tt' stlyle='padding-bottom: 0.25rem;'><small class='text-muted'>작성일 : "+data.documents[i].datetime.substr(0,10)+"</small></div>"
                            str += "<p>"+data.documents[i].contents+"</p></div></div></a>"
                            }
                            $(".blog_area").append(str)
                        },
                        error : function(request, status, error){
                            console.log("code: " + request.status)
                            console.log("message: " + request.responseText)
                            console.log("error: " + error);
                        }
                    })
            }
         
    // 블로그 글, 리뷰 리스트 출력
    $(document).ready(function() {
        blogLoad();
        campReviewList();
    })

    // 블로그 글 더보기
    function blogMore(){
        page++
        blogLoad();
    }

    // 댓글 별점 구현
    var reviewId = "";
    const drawStar = (target) => {
        console.log(target.id)
        if(target.id == "starCount"){
            $('.star #checkstar').css({ width :  target.value*10+'%' });
        }else{
            $('.star #checkstar'+target.id+'').css({ width :  target.value*10+'%' });
        }
    }

    // 댓글 수정창 출력
    function reviewModify(campReviewContents,campReviewNo,memberNickname,campReviewStar){
        console.log(campReviewContents)
        // $("#11").css({visibility: 'hidden'})
        campReviewList()
        var str=""
        str += "<br><div class='reviewList' style='padding : 5px; border : 3px solid #ccc; border-radius : 5px;'><div class='review_contents'>"
        str += "<span class='star'>★★★★★<span id='checkstar"+campReviewNo+"' style='width : "+campReviewStar*10+"%'>★★★★★</span>"
        str += "<input type='range' id='"+campReviewNo+"' oninput='drawStar(this)' value='"+campReviewStar+"' step='1' min='1' max='10'></span>"
        str += "<textarea style='border-radius: 5px;width: 95%;' name='reviewWrite' id='revieRewWrite'  rows='3' placeholder=' 리뷰를 남겨주세요.'>"+campReviewContents+"</textarea></div>"
        str += "<div class='review_info'><div style='height: 50%;text-align: left;font-size: large;'><b>"+memberNickname+"</b><input type='button' class='btn btn-secondary' onclick='modify("+campReviewNo+",\""+campReviewContents+"\","+campReviewStar+")' style='width : 100%' value='수정'/></div><div style='height: 50%;text-align: left;'><input type='button' class='btn btn-outline-secondary' onclick='modifyCancle()' style='width : 100%' value='취소'/> </div></div></div><br>"
        $("#reviewList-"+campReviewNo+"").html(str);
    }

    // 수정창 취소
    function modifyCancle(){
        campReviewList()
    }

    // 댓글 수정
    function modify(ReviewNo,ReviewContents,ReviewStar){
        console.log(ReviewNo + ":"+ReviewContents+":"+ReviewStar)
        var campReviewNo = ReviewNo;
        var campReviewContents = $("#revieRewWrite").val();
        var campReviewStar = $("#"+ReviewNo+"").val();
        if(confirm("수정 하시겠습니까?")){

            $.ajax({
                url : "/camp/campReviewModify.kh",
                type : "post",
                data : {
                    "campReviewNo" : campReviewNo,
                    "campReviewContents" : campReviewContents,
                    "campReviewStar" : campReviewStar
                },
                success : function(result){
                    if(result == "success"){
                        campReviewList()
                    }
                },
                error : function(request, status, error){
                    console.log("code: " + request.status)
                    console.log("message: " + request.responseText)
                    console.log("error: " + error);
                }
    
            })
        }
    }

    // 댓글 등록
    function insertReview(){
        var memberId = "${sessionScope.loginUser.memberId}";
        var memberNickname = "${sessionScope.loginUser.memberNickname}";
        var campId = "${camp.contentId}";
        var campName = "${camp.facltNm}";
        var campReviewContents =$('#reviewWrite').val();
        var campReviewStar = $('#starCount').val();
        if(memberId == ""){
            alert("로그인 후 작성 가능합니다.");
            location.href="/member/loginView";
        }
        else if(campReviewContents.trim() == ""){
            alert("리뷰 내용을 등록하세요.");
        }
        else if(confirm("리뷰를 등록하시겠습니까?")){
            // location.href="/member/loginView";
            $.ajax({
                url : "/camp/campReviewWrite.kh",
                type : "post",
                data : {
                    "memberId" : memberId,
                    "memberNickname" :memberNickname,
                    "campId" : campId,
                    "campName" : campName,
                    "campReviewContents" : campReviewContents,
                    "campReviewStar" : campReviewStar
                },
                success : function(result){
                    if(result == "success"){
                        alert("등록완료");
                        campReviewList()
                    }else{
                        alert("등록실패");
                    }

                },
                error : function(request, status, error){
                    console.log("code: " + request.status)
                    console.log("message: " + request.responseText)
                    console.log("error: " + error);
                }
            })
            
            $('#reviewWrite').val("");
        }
    }
    // 댓글 리스트 출력
    function campReviewList(){
        var contentId = "${camp.contentId}";
        $.ajax({
            url : "/camp/campReviewList.kh",
            type : "get",
            data : {
                "contentId" : contentId
            },
            async: false,
            success : function(data){
                var str = "";
                for(var i = 0; i<data.length ; i++){
                    str += "<div class='reviewList' id='reviewList-"+data[i].campReviewNo+"'><div id='"+data[i].campReviewNo+"'><div class='review_contents'><span class='starx' style='position: relative;font-size: 1.5rem;color: #ddd;'>★★★★★";
                    str += "<span style='width: "+data[i].campReviewStar*10+"%; position: absolute; left: 0; color: red;overflow: hidden; pointer-events: none;'>★★★★★</span></span>"
                    str += "<p>"+data[i].campReviewContents+"</p></div><div class='review_info'><div style='height: 50%;text-align: right;font-size: large;'>"
                    if(data[i].memberId == "${sessionScope.loginUser.memberId}"){
                        str += "<a><i class='bi bi-pencil-square' style='visibility: initial;' onclick='reviewModify(\""+data[i].campReviewContents+"\","+data[i].campReviewNo+",\""+data[i].memberNickname+"\","+data[i].campReviewStar+")'></i></a>"
                        str += "<a><i class='bi bi-trash-fill' style='visibility: initial;' onclick='reviewDelete("+data[i].campReviewNo+",\""+data[i].memberId+"\")'></i></a>"
                    }else{
                        str += "<a><i class='bi bi-pencil-square' style='visibility: hidden;' onclick='reviewModify(\""+data[i].campReviewContents+"\","+data[i].campReviewNo+",\""+data[i].memberNickname+"\","+data[i].campReviewStar+")'></i></a>"
                        str += "<a><i class='bi bi-trash-fill' onclick='reviewDelete("+data[i].campReviewNo+",\""+data[i].memberId+"\")'></i></a>"
                    }
                    str += "</div><div style='height: 50%;text-align: left;'><h6><b>"+data[i].memberNickname+"</b></h6>"
                    str += "<small>"+data[i].rCreateDate+"</small></div></div></div></div><hr>"
                    }
                    $(".review_area").html(str);
                
            },
            error : function(request, status, error){
                    console.log("code: " + request.status)
                    console.log("message: " + request.responseText)
                    console.log("error: " + error);
            }

        })
    }

    // 댓글 삭제
    function reviewDelete(campReviewNo,memberId){
        if(confirm("댓글을 삭제하시겠습니까?")){
            console.log(campReviewNo + ":" + memberId)
            $.ajax({
                url : "/camp/campReviewRemove.kh",
                type : "post",
                data : {
                    "campReviewNo" : campReviewNo,
                    "memberId" : memberId
                },
                success : function(result){
                    console.log(result)
                    if(result == "success"){
                        alert("댓글 삭제 완료");
                        campReviewList();
                    }else{
                        alert("댓글 삭제 실패");
                        campReviewList();
                    }
                },
                error : function(request, status, error){
                    console.log("code: " + request.status)
                    console.log("message: " + request.responseText)
                    console.log("error: " + error);
                }


            })
        }
    }
    
    
    // 지도 위치 표시
    function addSearch(){
			new daum.Postcode({
		        oncomplete: function(data) {
		            console.log(data)
		            document.querySelector("#postCode").value = data.zonecode;
		            document.querySelector("#roadAddr").value = data.roadAddress;
		            document.querySelector("#jibunAddr").value = data.jibunAddress;
		        }
		    }).open();
		}
		var mapOptions = {
			    center: new naver.maps.LatLng(${camp.mapY}, ${camp.mapX}),
			    zoom: 20,
			    zoomControl : true,
			    zoomControlOption : {
			    	position : naver.maps.Position.TOP_RIGHT,
			    	style : naver.maps.ZoomControlStyle.SMALL
			    }
			};
		//mapOptions를 아래 변수에 넣어서 구문을 하나로 합칠수도있음
		var map = new naver.maps.Map('map', mapOptions); //지도생성
		
		var markerOptions = {};
		//마커 찍기
		var marker = new naver.maps.Marker({//마커생성
			position : new naver.maps.LatLng(${camp.mapY}, ${camp.mapX}), //옵션설정
			map : map
		});
		var titleCamp = "${camp.facltNm}";
        var campAddr ="${camp.addr1}";

		//마커에 정보창 표시
		var contentStr = "<div class='maps'><div class=''  style='height: 60px; width: 60px; background: url(${camp.firstImageUrl}) no-repeat center center #343a40; background-size: 100%;'></div><span class=col-md-8><h5>"+titleCamp+"</h5><p>"+campAddr+"</p></span></div>";
		var infoWindow = new naver.maps.InfoWindow({
			content : contentStr
		});
        //말풍선창 제어
		infoWindow.open(map,marker);
		naver.maps.Event.addListener(marker,"click",function(e){
			//true면 열려있고 fales면 닫혀있고
			if(infoWindow.getMap()){
			infoWindow.close();
				
			}else{
				infoWindow = new naver.maps.InfoWindow({
					content : contentStr
				});
				infoWindow.open(map,marker);
			}
		});

    
		
	// 	naver.maps.Event.addListener(map,"click", function(e) {
    //      marker.setPosition(e.coord);
    //      if(infoWindow.getMap()) {
    //         infoWindow.close();
    //      }
    //      naver.maps.Service.reverseGeocode({  // < JSON으로 넘겨줌
    //         location : new naver.maps.LatLng(e.coord.lat(),e.coord.lng()) //위도 경도값 넘겨줌
    //      }, function(status, response) {
    //     	 console.log(response)
    //         var data = response.result;
    //         var items = data.items;
    //         var address = items[1].address; 
    //         contentStr = "<div><p>" + address + "</p></div>";
    //      });
    //   });


    </script>

    
</body>
</html>