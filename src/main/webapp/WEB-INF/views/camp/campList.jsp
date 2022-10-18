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
        function xmlToJson(xml) {
  // Create the return object
  var obj = {};

  if (xml.nodeType == 1) {
    // element
    // do attributes
    if (xml.attributes.length > 0) {
      obj["@attributes"] = {};
      for (var j = 0; j < xml.attributes.length; j++) {
        var attribute = xml.attributes.item(j);
        obj["@attributes"][attribute.nodeName] = attribute.nodeValue;
      }
    }
  } else if (xml.nodeType == 3) {
    // text
    obj = xml.nodeValue;
  }

  // do children
  // If all text nodes inside, get concatenated text from them.
  var textNodes = [].slice.call(xml.childNodes).filter(function(node) {
    return node.nodeType === 3;
  });
  if (xml.hasChildNodes() && xml.childNodes.length === textNodes.length) {
    obj = [].slice.call(xml.childNodes).reduce(function(text, node) {
      return text + node.nodeValue;
    }, "");
  } else if (xml.hasChildNodes()) {
    for (var i = 0; i < xml.childNodes.length; i++) {
      var item = xml.childNodes.item(i);
      var nodeName = item.nodeName;
      if (typeof obj[nodeName] == "undefined") {
        obj[nodeName] = xmlToJson(item);
      } else {
        if (typeof obj[nodeName].push == "undefined") {
          var old = obj[nodeName];
          obj[nodeName] = [];
          obj[nodeName].push(old);
        }
        obj[nodeName].push(xmlToJson(item));
      }
    }
  }
  return obj;
}
        var xhr = new XMLHttpRequest();
        var url = 'https://apis.data.go.kr/B551011/GoCamping/basedList'; /*URL*/
        var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'qbHoplMaKq5PUqUFEhfVjBpLiBxBcVPOw%2Fio3GvQ91q8xQjh%2BLZMz4caQ5Nqyt%2BU%2BeCGuAPRaJHRIhTzUqKmHw%3D%3D'; /*Service Key*/
        queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
        queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10');
        queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('WIN');
        queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('seulcam'); /**/
        queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('json');        
        xhr.open('GET', url + queryParams);
        xhr.onreadystatechange = function () {

            if (this.readyState == 4) {
                // console.log(this.response);
                console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
            }
        };
        function clicki(){
            console.log(queryParams)
        }
        xhr.send('');
        


    </script>
</body>
</html>