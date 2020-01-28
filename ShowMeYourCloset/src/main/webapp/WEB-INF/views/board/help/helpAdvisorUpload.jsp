<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <!-- Bootstap4 -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
    </head>
    <style>

        #target{height:770px;}
        .advisor-notify span{display: block; font-size:13px;}
        .category-title{text-align: center;font-size: 30px; font-weight: 700;}
        .container{position:absolute;left:50%; transform: translate(-50%);}
        .categoryDiv>div{position:absolute; width: 220px; z-index: 1; border-radius: 10px; background:rgba(188, 188, 188,0.7); font-size: 20px; font-weight: 700;}
        .Top{height: 180px;top:240px;left: 168px; line-height: 180px;}
        .Pants{height: 230px;top:430px;left: 168px; line-height: 230px;}
        .Shoes{height: 120px;top:670px; left: 168px; line-height: 120px;}
        .Acc{height: 100px; top:180px; line-height: 100px;}
        .noneDiv {width:150px;height:150px;display:inline-block;padding:5px;}
		.noneDiv>img{width:100%;height:100%;}
		.categoryImgDiv{width:150px;height:150px;display:inline-block;padding:5px;}
		.categoryImgDiv>img{width:100%;height:100%;}
		.loadImg{width:100%; height:100%;}
		.container{ width:1900px; max-width:none !important;}
    </style>
    <body>
    	<c:if test="${admin ==null }">
    		<script>
    			alert("나가시라구여!!!");
    			location.href="${pageContext.request.contextPath}/";
    		</script>
    	</c:if>
        <div class="container">
        	<div class="col-7" style="margin:auto;">
            <div class="categoryDiv">
                <div class="category Top text-center" id="Top">TOP</div>
                <div class="category Pants text-center" id="Pants">PANTS</div>
                <div class="category Shoes text-center" id="Shoes">SHOES</div>
                <div class="category Acc text-center" style="width: 150px;" id="Acc">ACC</div>
            </div>
            <div class="row mt-2 mb-3">
                <div class="col-8 advisor-notify" style="margin:auto;">
                    <span>* 이용방법 *</span>
                    <span> 1. 다른 친구의 옷으로 캐릭터를 코디해주세요!</span>
                    <span> 2. 각 카테고리를 클릭하면 친구가 등록한 옷이 화면에 나타납니다.</span>
                    <span>화면에 뜬 옷을 클릭하면 캐릭터가 옷을 입습니다.</span>
                    <span>3. 비방 및 욕설은 계정 정지 사유에 해당됩니다.</span>
                </div>
            </div>
            <div class="row">
                <div class="col-6" style="text-align: center; border: 1px solid #bcbcbc;">
                	<c:choose>
                		<c:when test="${gender == 'M'}">
                			<img src="/imgs/shilouette/man.png" id="target">
                		</c:when>
                		<c:otherwise>
                			<img src="/imgs/shilouette/woman.png" id="target">
                		</c:otherwise>
                	</c:choose>
                    
                </div>
                <div class="col-6 p-2" style="border: 1px solid #bcbcbc;">
                    <div class="row">
                        <div class="col-12">
                            <select class="form-control" id="closet" name="closet" onchange="changeClosetSelect()">
                                <c:forEach var="closetDTO" items="${closetList}">
									<option value="${closetDTO.no}" >${closetDTO.name}</option>
								</c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 category-title">
                            <span>TOP</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 categoryMenu">

                        </div>
                    </div>

                </div>
            </div>
            <form action="${pageContext.request.contextPath}/advisor/advisorUploadProc" method="post" id="uploadFrm">
            		<input type="hidden" name="cpage" value="${cpage}">
            		<input type="hidden" name="top" id="topHidden">
	            	<input type="hidden" name="pants" id="pantsHidden">
	            	<input type="hidden" name="shoes" id="shoseHidden">
	            	<input type="hidden" name="acc" id="accHidden">
	            	<input type="hidden" name="b_no" value="${b_no}">
                <div class="row">
                    <div class="col-12">
                        <div class="row mt-2 mb-2">
                            <div class="col-12">
                                <label>제목</label>
                                <input type="text" class="form-control" name="title" id="title">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 mt-2 mb-3">
                                <textarea class="form-control" style="resize: none;" rows="15" name="contents" id="contents"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mb-5">
                    <div class="col-12" style="text-align: right;">
                        <button class="btn btn-info" type="button" id="advisorUploadBtn">등록하기</button>
                    </div>
                </div>
            </form>
       	 </div> 
        </div>
        
        <script>
        //advisor등록
        	$("#advisorUploadBtn").on("click",function(){
        		var topSrc= $(".Top").children("img").attr("src");
        		var pantsSrc= $(".Pants").children("img").attr("src");
        		var shoseSrc= $(".Shoes").children("img").attr("src");
        		var accSrc = $(".Acc").children("img").attr("src");
        		
        		
        		if( topSrc == null && pantsSrc==null && shoseSrc==null && accSrc ==null){
        			alert("하나 이상 옷을 선택해주세요");
        			return;
        		}
        		
        		if( $("#title").val() == ""){
        			alert("제목을 적어주세요");
        			return;
        		}
        		
        		if($("#contents").val()==""){
        			alert("내용을 입력해주세요");
        			return;
        		}
        		
        		$("#topHidden").val(topSrc);
        		$("#pantsHidden").val(pantsSrc);
        		$("#shoseHidden").val(shoseSrc);
        		$("#accHidden").val(accSrc);
        		
        		$("#uploadFrm").submit();
        	
        	})
        	
        </script>
        <script>
         	var category_id = null;
         	var writer = "${writer}";
         	
         	
         	// 메뉴 초기화
        	var divInit = function(){
        		$(".categoryMenu").html("");
        		var div = $("<div class='noneDiv'>");
        		var img = $("<img src='/imgs/shilouette/none.png'>")
        		div.append(img);
        		$(".categoryMenu").append(div);
        	}
         	
        	// 동적 바인딩 이벤트 (끌어온 이미지 클릭 이벤트) 
        	$("body").on("click",".categoryImgDiv",function(){
        		var src= $(this).children("img").attr("src");
         		var img = $("<img class='loadImg' id='"+category_id+"Img'>");
        		img.attr("src",src);
        		
        		$("."+category_id).css("opacity","0.9").css("line-height","0px");
        		$("."+category_id).html(img);
        	})
        	
        	// 카테고리 로고 띄워주기
        	$("body").on("click",".noneDiv",function(){
        		var height = $("."+category_id).css("height");
        		$("."+category_id).html("");
        		$("."+category_id).text(category_id.toUpperCase()).css("opacity","0.7").css("line-height",height);
        	})
        
	     	// 옷장 변경 이벤트
			var changeClosetSelect = function(){
	     		
				divInit();
	
				var closet = $("#closet option:selected").val();
				
				if(category_id == null){
					category_id ="Top";
				}
				selectDressAll(category_id , closet,writer);
			}
	     	
			// 카테고리 클릭이나 옷장 변경 시  실행되는 ajax
         	var selectDressAll = function(category , closet, writer){
         		
         		$.ajax({
            		url:"${pageContext.request.contextPath}/advisor/selectCategoryMenu",
            		data:{
            			category : category,
            			c_no : closet,
            			writer: writer
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
         		
         	}
	     	
            $(".category").on("click",function(){
                var id = $(this).attr("id");
                $(".category-title").text(id.toUpperCase());
                
                category_id= id;
				var closet = $("#closet").val();
            	
				divInit();
				
            	selectDressAll(category_id, closet, writer);
                
                $(".categoryMenu").css("opacity","0")
                .animate({'opacity':1},300);
            })
            
        </script>

    </body>
</html>