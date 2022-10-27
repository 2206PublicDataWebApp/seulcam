<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/product/productRegist.css">
<link rel="stylesheet" href="/resources/css/fonts.css">
</head>

<body>
<form action="/admin/productRegister" enctype="multipart/form-data" method="post">
   <section class="productRegist">
        <div class="leftForm">
            <div class="box-form">
                <label>상품명</label>
                <input type="text" class="g-inputbox-medium textarea-title" placeholder="상품명을 입력해주세요." name="productName" value="" >
            </div>
            <div class="box-form">
                <label>브랜드</label>
                <select class="selectBox" placeholder="브랜드를 선택해주세요" name="brandName">
                    <c:forEach items="${sNameList }" var="brandName" varStatus="i">
                   		 <option value="${brandName.brandName }">${brandName.brandName }</option>
                    </c:forEach>
                </select>
            </div>
            <div class="box-form">
                <label>카테고리</label>
                <select class="selectBox" placeholder="카테고리를 선택해주세요" name="category" >
						<option value="텐트">텐트</option>
						<option value="타프">타프</option>
						<option value="테이블">테이블</option>
						<option value="체어">체어</option>
						<option value="침낭">침낭</option>
						<option value="매트">매트</option>
						<option value="야전침대">야전침대</option>
						<option value="코펠">코펠</option>
						<option value="취사도구">취사도구</option>
						<option value="컵/머그컵">컵/머그컵</option>
						<option value="스토브">스토브</option>
						<option value="화로대">화로대</option>
						<option value="난로">난로</option>
						<option value="전자용품">전자용품</option>
						<option value="기타소품">기타소품</option>
                </select>
            </div>
            <div class="box-form">
                <label>가격</label>
                <input type="text" class="g-inputbox-medium textarea-title" placeholder="가격을 입력해주세요." name="productPrice" value="" >
            </div>
             <div class="box-form">
                <label>색상</label>
                <input type="text" class="g-inputbox-medium textarea-title" placeholder="색상을 입력해주세요." name="productColor" value="" >
            </div>
            <div class="box-form">
                <label>재고</label>
                <input type="text" class="g-inputbox-medium textarea-title" placeholder="재고를 입력해주세요." name="productStock" value="" >
            </div>
            <div class="box-form">
                <label>소재</label>
                <input type="text" class="g-inputbox-medium textarea-title" placeholder="소재를 입력해주세요." name="productMaterial" value="" >
            </div>
        </div>
        
        <div class="rightForm">
            <div class="box-form">
                <label>메인사진</label>
                <div class="box-img-upload" style="width: 200px; height: 260px;">
                    <span class="drop-zone__prompt">+</span>
                    <input type="file" name="uploadFile" class="drop-zone__input">
                </div>

            </div>
           
           
            <div class="box-form">
                <p><label>상세 사진1</label></p>
                <div class="box-img-upload">
                    <span class="drop-zone__prompt">+</span>
                    <input type="file" name="dList[0].detailFileNameMPF" class="drop-zone__input" >
                </div>
                <div class="box-textarea">
                    <textarea placeholder="상세설명을 입력해주세요." name="dList[0].detailContents"></textarea>
                </div>
           </div>
           
            <div class="box-form">
                <label>상세 사진2</label>
                    <div class="box-img-upload">
                        <span class="drop-zone__prompt">+</span>
                        <input type="file" name="dList[1].detailFileNameMPF" class="drop-zone__input">
                    </div>    
                    <div class="box-textarea">
                        <textarea placeholder="상세설명을 입력해주세요." name="dList[1].detailContents"></textarea>
                    </div>
            </div>
        </div>
     
        <div style="float:left;width: 100%;">
	        <button id="goBack" onclick="goBack()" style="float:left">뒤로가기</button>
	        <button id="submit">등록하기</button>
        </div>
    </section>
</form>


<script>

function goBack() {
	  window.history.back();
	}

	    document.querySelectorAll(".drop-zone__input").forEach((inputElement) => {
	  const dropZoneElement = inputElement.closest(".box-img-upload");
	
	  dropZoneElement.addEventListener("click", (e) => {
	    inputElement.click();
	  });
	
	  inputElement.addEventListener("change", (e) => {
	    if (inputElement.files.length) {
	      updateThumbnail(dropZoneElement, inputElement.files[0]);
	    }
	  });
	
	  dropZoneElement.addEventListener("dragover", (e) => {
	    e.preventDefault();
	    dropZoneElement.classList.add("drop-zone--over");
	  });
	
	  ["dragleave", "dragend"].forEach((type) => {
	    dropZoneElement.addEventListener(type, (e) => {
	      dropZoneElement.classList.remove("drop-zone--over");
	    });
	  });
	
	  dropZoneElement.addEventListener("drop", (e) => {
	    e.preventDefault();
	
	    if (e.dataTransfer.files.length) {
	      inputElement.files = e.dataTransfer.files;
	      updateThumbnail(dropZoneElement, e.dataTransfer.files[0]);
	    }
	
	    dropZoneElement.classList.remove("drop-zone--over");
	  });
	});
	
	/**
	 * Updates the thumbnail on a drop zone element.
	 *
	 * @param {HTMLElement} dropZoneElement
	 * @param {File} file
	 */
	function updateThumbnail(dropZoneElement, file) {
	  let thumbnailElement = dropZoneElement.querySelector(".drop-zone__thumb");
	
	  // First time - remove the prompt
	  if (dropZoneElement.querySelector(".drop-zone__prompt")) {
	    dropZoneElement.querySelector(".drop-zone__prompt").remove();
	  }
	
	  // First time - there is no thumbnail element, so lets create it
	  if (!thumbnailElement) {
	    thumbnailElement = document.createElement("div");
	    thumbnailElement.classList.add("drop-zone__thumb");
	    dropZoneElement.appendChild(thumbnailElement);
	  }
	
	  thumbnailElement.dataset.label = file.name;
	
	  // Show thumbnail for image files
	  if (file.type.startsWith("image/")) {
	    const reader = new FileReader();
	
	    reader.readAsDataURL(file);
	    reader.onload = () => {
	      thumbnailElement.style.backgroundImage = `url(`+reader.result+`)`;
	    };
	  } else {
	    thumbnailElement.style.backgroundImage = null;
	  }
	}
 </script>
</body>
</html>