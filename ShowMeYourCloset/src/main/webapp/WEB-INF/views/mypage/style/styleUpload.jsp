<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstap4 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- style Upload css -->
<link href="/css/styleUpload.css" rel="stylesheet" type="text/css">

<style>
.categoryImgDiv{
	width:150px;
	height:150px;
	border: 1px solid #bcbcbc;
	display:inline-block;
	padding:5px;
}
.categoryImgDiv>img{
	width:100%;
	height:100%;
}
.loadImg{
	width:100%;
	height:100%;
}
</style>

</head>
<body>

		<div class="wrapper-All">
            <div class="categoryMenu"></div>

            <div class="wrapper">

                <div class="category top" id="top">Top</div>
                <div class="category pants" id="pants">Pants</div>
                <div class="category shose" id="shose">Shose</div>
                <div class="category acc" id="acc">Acc</div>
                <div class="imgBox">
                    <img src="imgs/shilouette/man.png">
                </div>

            </div>
            
            <form id="insertFrm" action="${pageContext.request.contextPath}/style/insertProc" method="post">
	            <div class="writeInfo">
	            	<input type="hidden" name="email" value="${email}">
	            	<input type="hidden" name="top" id="topHidden">
	            	<input type="hidden" name="pants" id="pantsHidden">
	            	<input type="hidden" name="shose" id="shoseHidden">
	            	<input type="hidden" name="acc" id="accHidden">
	            	<div class="">
	            		옷 이름 <input type="text" name="name">
	            	</div>
	            	<div>
	            		계절 <input type="text" name="season">
	            		메모 <input type="text" name="memo">
	            	</div>
	            	<div>
	            		<button id="styleInsertBtn" type="button">저장하기</button>
	            	</div>
	            </div>
            </form>
        </div>
        
        <script>
        	$("#styleInsertBtn").on("click",function(){
        		var topSrc= $(".top").children("img").attr("src");
        		var pantsSrc= $(".pants").children("img").attr("src");
        		var shoseSrc= $(".shose").children("img").attr("src");
        		var accSrc = $(".acc").children("img").attr("src");
        		
        		$("#topHidden").val(topSrc);
        		$("#pantsHidden").val(pantsSrc);
        		$("#shoseHidden").val(shoseSrc);
        		$("#accHidden").val(accSrc);
        		
        		$("#insertFrm").submit();
        	})
        	
        </script>
        
        <!-- 코디 시키기 이벤트 -->
        <script>
        
        	// 메뉴 초기화
        	var divInit = function(){
        		$(".categoryMenu").html("");
        	}
        	
         	// 카테고리 아이디
        	var cid ="none";
         	
         	// 동적 바인딩 이벤트 (끌어온 이미지 클릭 이벤트) 
        	$("body").on("click",".categoryImgDiv",function(){
        		var src= $(this).children("img").attr("src");
         		var img = $("<img class='loadImg' id='"+cid+"Img'>");
        		img.attr("src",src);
        		
        		$("."+cid).css("opacity","1");
        		$("."+cid).html(img);
        		
        	})
        	
        	// 카테고리 div 클릭 이벤트
            $(".category").on("click",function(){
            	divInit();
            	
            	cid= $(this).attr("id");
            	
            	$.ajax({
            		url:"${pageContext.request.contextPath}/style/selectCategoryProc",
            		data:{
            			category : cid
            		},
            		dataType:"json"
            	}).done(function(data){          		
            		for(i=0;i<data.length;i++){
            			var div=$("<div class='categoryImgDiv'>")
            			var img = $("<img>");
            			img.attr("src",data[i].file);
            			div.append(img);
            			$(".categoryMenu").append(div);
            		}         		
            		
            	}).fail(function(){
            		console.log("fail");            		
            	})
                
                $(".categoryMenu").css("display","block")
                .css("opacity","0")
                .animate({'opacity':1},300);

            })

        </script>
</body>
</html>