<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/productRegist.css">
<body>
   <section class="productRegist">
        <div class="leftForm">
            <div class="box-form">
                <label>상품명</label>
                <input type="text" class="g-inputbox-medium textarea-title" placeholder="상품명을 입력해주세요." name="productName" value="" >
            </div>
            <div class="box-form">
                <label>브랜드</label>
                <select class="selectBox" placeholder="브랜드를 선택해주세요" name="productName">
                    <option>##</option>
                    <option>##</option>
                    <option>##</option>
                    <option>##</option>
                    <option>##</option>
                    <option>##</option>
                    <option>##</option>
                </select>
            </div>
            <div class="box-form">
                <label>카테고리</label>
                <select class="selectBox" placeholder="카테고리를 선택해주세요" name="productName">
                    <option>##</option>
                    <option>##</option>
                    <option>##</option>
                    <option>##</option>
                    <option>##</option>
                    <option>##</option>
                    <option>##</option>
                </select>
            </div>
            <div class="box-form">
                <label>가격</label>
                <input type="text" class="g-inputbox-medium textarea-title" placeholder="가격을 입력해주세요." name="productName" value="" >
            </div>
            <div class="box-form">
                <label>재고</label>
                <input type="text" class="g-inputbox-medium textarea-title" placeholder="재고를 입력해주세요." name="productName" value="" >
            </div>
            <div class="box-form">
                <label>소재</label>
                <input type="text" class="g-inputbox-medium textarea-title" placeholder="소재를 입력해주세요." name="productName" value="" >
            </div>
        </div>
        
        <div class="rightForm">
            <div class="box-form">
                <label>메인사진</label>
                <div class="box-img-upload" style="width: 200px; height: 260px;">
                    <span class="drop-zone__prompt">+</span>
                    <input type="file" name="myFile" class="drop-zone__input">
                </div>

            </div>
           
           
            <div class="box-form">
                <p><label>상세 사진1</label></p>
                <div class="box-img-upload">
                    <span class="drop-zone__prompt">+</span>
                    <input type="file" name="myFile" class="drop-zone__input">
                </div>
                <div class="box-textarea">
                    <textarea placeholder="상세설명을 입력해주세요." name="qa_msg"></textarea>
                </div>
           </div>
           
            <div class="box-form">
                <label>상세 사진2</label>
                    <div class="box-img-upload">
                        <span class="drop-zone__prompt">+</span>
                        <input type="file" name="myFile" class="drop-zone__input">
                    </div>    
                    <div class="box-textarea">
                        <textarea placeholder="상세설명을 입력해주세요." name="qa_msg"></textarea>
                    </div>
            </div>
        </div>
        <input type="submit" value="등록하기"></input>
    </section>



<script>
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
	      thumbnailElement.style.backgroundImage = `url('${reader.result}')`;
	    };
	  } else {
	    thumbnailElement.style.backgroundImage = null;
	  }
	}
 </script>
</body>
</html>