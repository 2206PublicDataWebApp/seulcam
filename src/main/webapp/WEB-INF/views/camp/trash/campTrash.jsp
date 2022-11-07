<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>

    var url = 'https://apis.data.go.kr/B551011/GoCamping/basedList'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'qbHoplMaKq5PUqUFEhfVjBpLiBxBcVPOw%2Fio3GvQ91q8xQjh%2BLZMz4caQ5Nqyt%2BU%2BeCGuAPRaJHRIhTzUqKmHw%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
    queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10');
    queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('WIN');
    queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('seulcam'); /**/
    queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('json');
    queryParams += '&' + encodeURIComponent('mapX') + '=' + encodeURIComponent('json'); 
    queryParams += '&' + encodeURIComponent('mapY') + '=' + encodeURIComponent('json'); 
    queryParams += '&' + encodeURIComponent('radius') + '=' + encodeURIComponent('10000'); 
    var urli = url+queryParams;
    console.log($(document).height())
    $.ajax({
                url : urli,
                type : "GET",
                data : {},
                dataType : "json",
                async: false,
                success : function(data) {
                    console.log(data.response.body.numOfRows)
                    var str = "";
                    for (var i = 0; i < data.response.body.items.item.length; i++) {
                        var campItem = data.response.body.items.item;
                        // if(campItem[i].facltDivNm =="민간" && campItem[i].doNm == "전라남도" && campItem[i].manageSttus == "운d영"){
                            str += "<div class='camp_List' id='campsite-"+campItem[i].contentId+"'>"
                            str += "<a href='#' data-id='"+campItem[i].contentId+"'>"
                            str += "<div style='height: 225px; background: url("+campItem[i].firstImageUrl+") no-repeat center center #343a40; background-size: 100%;'></div></a>"
                            str += "<div class='card-body 'style='padding-top: 0.75rem;'><div class='text-right tt' stlyle='padding-bottom: 0.75rem;'><small class='text-muted'>"+campItem[i].induty+"</small></div>"
                            str += "<a href='#' data-id='"+campItem[i].contentId+"'><h3 class='card-title tt'>"+campItem[i].facltNm+"</h3><p class='card-text tt'>"+campItem[i].addr1+"</p></a></div><hr>좋아요 : 0</div>"
                            $.ajax({
                                url : "/campLike.kh",
                                type : "GET", 
                                data : {
                                    "contentId" : campItem[i].contentId
                                },
                                dataType : "json",
                                success : function(result){
                                    
                                },
                                error : function(){
                                    
                                }
                            })
                        // }
                    }
                    if(str == ""){
                        $("#list_area").append("없서용");
                    }
                    $("#list_area").append(str);

                },
                error : function() {
                    console.log("출력실패");
                }
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

