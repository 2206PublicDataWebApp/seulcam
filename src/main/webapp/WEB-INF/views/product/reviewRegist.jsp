<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable= no">
	<title>리뷰작성</title>
</head>
<link rel="stylesheet" href="/resources/css/product/reviewRegist.css">
<link rel="stylesheet" href="/resources/css/fonts.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<header>
	<div id="header-block">
          <div class="header-wrapper">
              <div class="back-layout">
                  <button class="go-back" onclick="history.back()">
                      <img src="/resources/images/back_arrow.png">
                  </button>
              </div>
              <h2>
                  상품 리뷰작성
              </h2>
          </div>
     </div>
</header>
<body>
 <section class="review" >
 <form action="/product/reviewRegister" enctype="multipart/form-data" method="post">
 <input type="hidden" name="productNo" value="${productNo }"> 

 <input type="hidden" value=10 name="reviewGrade" id="reviewGrade">  
	 	<div class="range">
	        <span class="number" id="gradeNumber">0</span>
	        <input type="radio" name="range" id="range10" value=10 />
	        <label for="range10" class="range-star x2"></label>
	        <span class="number">10</span>
	        <input type="radio" name="range" id="range9" value=9 />
	        <label for="range9" class="range-star"></label>
	        <span class="number">9</span>
	        <input type="radio" name="range" id="range8" value=8 />
	        <label for="range8" class="range-star x2"></label>
	        <span class="number">8</span>
	        <input type="radio" name="range" id="range7" value=7 />
	        <label for="range7" class="range-star"></label>
	        <span class="number">7</span>
	        <input type="radio" name="range" id="range6" value=6 />
	        <label for="range6" class="range-star x2"></label>
	        <span class="number">6</span>
	        <input type="radio" name="range" id="range5" value=5 />
	        <label for="range5" class="range-star"></label>
	        <span class="number">5</span>
	        <input type="radio" name="range" id="range4" value=4 />
	        <label for="range4" class="range-star x2"></label>
	        <span class="number">4</span>
	        <input type="radio" name="range" id="range3" value=3 />
	        <label for="range3" class="range-star"></label>
	        <span class="number">3</span>
	        <input type="radio" name="range" id="range2" value=2 />
	        <label for="range2" class="range-star x2"></label>
	        <span class="number">2</span>
	        <input type="radio" name="range" id="range1" value=1 />
	        <label for="range1" class="range-star"></label>
	        <span class="number">1</span>
	    </div>

        <div class="box-form">
            <label>상품명</label>
            <input type="text" class="g-inputbox-medium textarea-title" placeholder="${productName }" name="productName" value="" readonly>
        </div>
        <div class="box-form">
            <label>작성자 아이디</label>
            <input type="text" class="g-inputbox-medium textarea-title" placeholder="${memberId }" name="memberId" value="${memberId }" readonly>
        </div>
        <div class="box-form">
            <label>내용</label>
            <input type="text" class="g-inputbox-medium textarea-title" placeholder="제목을 입력해주세요." name="reviewTitle" value="">
            <div class="box-textarea">
                <textarea placeholder="내용을 입력해주세요." name="reviewContents"></textarea>
            </div>
        </div>
         
           
        <label>사진</label>
       <div id="upload-box-form">
	        <div class="box-img-upload">
	            <span class="drop-zone__prompt">+</span>
	             <input type="file" name="myFile" class="drop-zone__input">
			</div>
			        <div class="box-img-upload">
	            <span class="drop-zone__prompt">+</span>
	             <input type="file" name="myFile" class="drop-zone__input">
			</div>
	        <div class="box-img-upload">
	            <span class="drop-zone__prompt">+</span>
	             <input type="file" name="myFile" class="drop-zone__input">
			</div>
        </div>
        <br>
        <p class="guide" >
			
			<input type="button" class="img-delete-bt" value="삭제">
			<input type="button" class="img-delete-bt" value="삭제">
			<input type="button" class="img-delete-bt" value="삭제">
		</p>
		<p class="guide"> 최대 3개까지 등록 가능합니다.</p>
	        
	      
		<div class="join-button-wrapper">
              <button type="submit" class="submit-button">
                  등록하기
              </button>
        </div>
       
         
         <p class="guide">상품과 무관한 사진/동영상을 첨부한 리뷰는 통보없이 삭제 및 적립 혜택이 회수됩니다.</p>
         
		</form>
    </section>
</body>
<footer>
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>
</footer>
<script>

$(".img-delete-bt").eq(1).click(function(){
	
	alert("취소!");
});

$('input[type=radio][name=range]').change(function() {
	$("#reviewGrade").val($('input[name=range]:checked').val());	
});




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
</html>