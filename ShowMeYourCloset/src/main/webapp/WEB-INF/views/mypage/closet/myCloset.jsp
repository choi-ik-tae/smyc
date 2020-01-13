<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Me Your Closet</title>
<!-- Bootstap4 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
    *{box-sizing: border-box;font-family: 'Noto Sans KR', sans-serif;}
    #closet{transform: translate(45%,5%); margin-bottom: 70px;}
    .nav-font{font-size: 10pt; font-weight: 800;}
    .item-page{border: 1px solid lightgray; border-radius: 5px; max-height:700px; overflow:auto;}
    .item-page::-webkit-scrollbar {display:none;}
    .item-page>div>div[class~='card']{cursor:pointer;}
    #dressBox>div>div{background:rgba(255, 255, 255, 0.2);border-radius: 5px;color: white;font-size: 20pt;font-weight: 800;}
    #accBox{position: absolute;left: 480px;top:50px;width:198px;height:500px;line-height: 500px; text-align: center;}
    #topBox{position: absolute;left: 690px;top:50px;width:269px;height:668px;line-height: 668px; text-align: center;}
    #pantsBox{position: absolute;left: 970px;top:50px;width:269px;height:668px;line-height: 668px; text-align: center;}
    #shoesBox{position: absolute;left: 1250px;top:50px;width:200px;height:500px;line-height: 500px; text-align: center;}
    .nav-item>a{color: black; font-size: 15pt;}
    .logo{font-size: 15pt;}
    #top{height: 80px;background-color:white;border-bottom: 1px solid gray;}
    #bottom{background-color:white;border-top: 1px solid gray;width: 100%;height: 150px;}
    #bottom-logo{height: 150px; line-height: 150px;}
    #bottom-contents{font-size: 10pt;color: gray;}
    .imgBox{position: relative; width:100%; height: 100%; overflow: auto; -ms-overflow-style: none;}
    .imgBox::-webkit-scrollbar {display:none;}
    .imgBox>img{border-radius: 20px;height: 130px;float: left;}
    .closetTag{position: relative;width: 100%;height: 50px;line-height: 50px;}
    .nav-link:hover{cursor: pointer;}
</style>
</head>
<body>
<c:choose>
<c:when test="${email == null}">
	<script>
		alert("로그인 해주세요!");
		location.href="${pageContext.request.contextPath}/signin";
	</script>
</c:when>
<c:otherwise>
<div class="container-fuild">
 	
    <!-- 헤더 -->
    <jsp:include page="../../standard/header.jsp" />
    <!-- 퀵 메뉴 -->
    <jsp:include page="../../standard/mypageQuickMenu.jsp" />
    
	<div class="row mt-5" id="toTop">
        <div class="col-12 mt-5">
            <div class="row">
                <div class="col-12 text-center">
                    <h1 style="font-weight: 800;">My Page</h1>    
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12 text-center">
                    <div class="btn-group" role="group" aria-label="Basic example">
                      <button id="toInfo" type="button" class="btn btn-outline-dark">Info</button>
                      <button id="toCloset" type="button" class="btn btn-outline-dark">Closet</button>
                      <button id="toStyle" type="button" class="btn btn-outline-dark">Style</button>
                    </div><hr>
                </div>   
            </div>
            <div class="row mt-4">
                <div class="col-3 text-center m-auto">
                	<input type="hidden" name="c_no" value="" id="targetCloset">
                    <select class="form-control d-inline-block" name="closetName" id="closetName" style="width: 80%;">
						<c:choose>
							<c:when test="${closetList.size() > 0}">
								<c:forEach items="${closetList}" var="closet">
									<option id="${closet.name}" value="${closet.name}">${closet.name}</option>
									<c:if test="${closet.name == target}">
										<script>
											$("#${closet.name}").prop("selected",true);
											$("#targetCloset").val("${closet.no}");
										</script>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<option value="기본옷장">기본옷장</option>
							</c:otherwise>
						</c:choose>                        
                    </select>
                    <button class="btn btn-outline-dark mb-2" type="button" id="toClosetModify">수정모드</button>
                </div>
            </div>
        </div>
    </div>
    <div class="row" id="dressBox">
        <div class="col-12">
        <c:choose>
	        <c:when test="${dressList.size() > 0}">
	        <img src="${pageContext.request.contextPath}/imgs/closet/${img}.png" id="closet">
            <div id="topBox">
                <div class="imgBox text-left">
                <c:choose>
                	<c:when test="${topImgList.size() > 0}">
                	    <div class="closetTag text-center">TOP</div>
                		<c:forEach items="${topImgList}" var="topImg">
                			<img src="${topImg.path}" class="w-50 p-1">
                		</c:forEach>
                	</c:when>
                	<c:otherwise>
                		<span class="d-block text-center">TOP</span>
                	</c:otherwise>
                </c:choose>
                </div>
            </div>
            <div id="pantsBox">
                <div class="imgBox text-left">
                <c:choose>
                	<c:when test="${pantsImgList.size() > 0}">
                	<div class="closetTag text-center">PANTS</div>
	                    <c:forEach items="${pantsImgList}" var="pantsImg">
	                		<img src="${pantsImg.path}" class="w-50 p-1">
	                	</c:forEach>
                	</c:when>
                	<c:otherwise>
                		<span class="d-block text-center">PANTS</span>
                	</c:otherwise>
                </c:choose>
                </div>
            </div>
            <div id="shoesBox">
                <div class="imgBox text-left">
                <c:choose>
                    <c:when test="${shoesImgList.size() > 0}">
                    <div class="closetTag text-center">SHOES</div>
	                    <c:forEach items="${shoesImgList}" var="shoesImg">
	                		<img src="${shoesImg.path}" class="w-50 p-1">
	                	</c:forEach>
                	</c:when>
                	<c:otherwise>
                		<span class="d-block text-center">SHOES</span>
                	</c:otherwise>
                </c:choose>
                </div>
            </div>
            <div id="accBox">
                <div class="imgBox text-left">
                <c:choose>
                    <c:when test="${accImgList.size() > 0}">
                    <div class="closetTag text-center">ACC</div>
	                    <c:forEach items="${accImgList}" var="accImg">
	                		<img src="${accImg.path}" class="w-50 p-1">
	                	</c:forEach>
                	</c:when>
                	<c:otherwise>
                		<span class="d-block text-center">ACC</span>
                	</c:otherwise>
                </c:choose>
                </div>
            </div>
	        </c:when>
			<c:otherwise>
           		<img src="${pageContext.request.contextPath}/imgs/closet/${img}.png" id="closet">
	            <div id="topBox">
	                TOP
	            </div>
	            <div id="pantsBox">
	                PANTS
	            </div>
	            <div id="shoesBox">
	                SHOES
	            </div>
	            <div id="accBox">
	                ACC
	            </div>
        	</c:otherwise>
        </c:choose>
        </div>
    </div><hr>
    <div class="row">
        <div class="col-8 m-auto p-0">
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a id="allView" class="nav-link"><span class="nav-font">All</span></a>
              </li>
              <li class="nav-item">
                <a id="topView" class="nav-link targetView"><span class="nav-font">Top</span></a>
              </li>
              <li class="nav-item">
                <a id="pantsView" class="nav-link targetView"><span class="nav-font">Pants</span></a>
              </li>
              <li class="nav-item">
                <a id="shoesView" class="nav-link targetView"><span class="nav-font">Shoes</span></a>
              </li>
              <li class="nav-item">
                <a id="accView" class="nav-link targetView"><span class="nav-font">Acc</span></a>
              </li>
            </ul>
        </div>
    </div>
    <div class="row mt-1 mb-5">
		<div class="col-8 m-auto p-0">
			<div class="row row-cols-3 m-auto item-page">
	        <!-- 파일 가져와서 뿌려주면 됨. 반복문사용 -->
	        <c:choose>
		        <c:when test="${dressList.size() > 0}">
		        <c:forEach var="i" begin="0" end="${dressList.size() - 1}">
				      <div class="col-4 mb-4 mt-4" id="dress${dressList.get(i).no}" onclick="toDetail(${dressList.get(i).no},${dressList.get(i).c_no})">
				        <div class="card h-100">
				          <img src="${dressImgList.get(i)}" class="card-img-top" style="height:200px;">
				          <div class="card-body">
				            <h5 class="card-title">${dressList.get(i).name}</h5>
				            <p class="card-text">
				            	${dressList.get(i).memo}
				            </p>
				          </div>
				        </div>
				      </div>
				</c:forEach>
		        </c:when>
		        <c:otherwise>
		        	<div class="col-12" style="height:350px; font-weight:800;">
		        		<div class="row text-center">
		        			<div class="col-12" style="height:250px; line-height:250px;">비어있습니다.</div>
		        		</div>
		        		<div class="row text-center">
		        			<div class="col-12" style="height:100px; line-height:100px;">
		        				<button onclick="toDressUpload()" class="btn btn-outline-dark" type="button">옷 등록하러 가기</button>
		        			</div>
		        		</div>
		        	</div>
		        </c:otherwise>
	        </c:choose>
	        </div>
		</div>
    </div>
    <!-- 푸터 -->
    <jsp:include page="../../standard/footer.jsp" />
</div>
<script>
	var toDetail = function(d_no,c_no){
		location.href="${pageContext.request.contextPath}/dressDetailView?d_no="+d_no+"&c_no="+c_no;
	}
	var toDressUpload = function(){
		location.href="${pageContext.request.contextPath}/dressUpload";
	}
	$("#toClosetModify").on("click",function(){
		location.href="${pageContext.request.contextPath}/closetModify?c_no="$("targetCloset").val();
	});
	$("#allView").on("click",function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/closet/allView",
			method:"POST",
			data:{
				email:"${email}",
				closet:"${closetNo}"
			},
			dataType:"json"
		}).done(function(data){
			$(".item-page").html("");
			if(data.length == 0) {
				var contents = $("<div class='col-12' style='height:350px; font-weight:800;'>");
				var row1 = $("<div class='row text-center'>");
				var box1 = $("<div class='col-12' style='height:250px; line-height:250px;'>");
				var text1 = "비어있습니다."
				
				var row2 = $("<div class='row text-center'>");
				var box2 = $("<div class='col-12' style='height:100px; line-height:100px;'>")
				var btn = $("<button onclick='toDressUpload()' class='btn btn-outline-dark' type='button'>");
				var text2 = "옷 등록하러 가기"
				
				contents.append(row1);
				row1.append(box1);
				box1.append(text1);
				contents.append(row2);
				row2.append(box2);
				box2.append(btn);
				btn.append(text2);
				
				$(".item-page").append(contents);
			} else {
				// for문 감싸기~
				for(i=0;i<data.length;i++) {	
					var contents = $("<div class='col-4 mb-4 mt-4' onclick='toDetail("+data[i].dress.no+","+data[i].dress.c_no+")'>");
					var card = $("<div class='card h-100'>");
					var img = $("<img class='card-img-top' src='"+data[i].dressImg+"'style='height:200px;'>");
					var cardbody = $("<div class='card-body'>");
					var htag = $("<h5 class='card-title'>");
					var ptag = $("<p class='card-text'>");
					
					contents.append(card);
					card.append(img);
					card.append(cardbody);
					htag.append(data[i].dress.name)
					ptag.append(data[i].dress.memo)
					cardbody.append(htag);
					cardbody.append(ptag);

					$(".item-page").append(contents);
				}
				//	
			}
		}).fail(function(data){
			console.log("못가져왔어!");
			
		});
	});
	$(".targetView").on("click",function(){
		var item = $(this).text();
		$.ajax({
			url:"${pageContext.request.contextPath}/closet/targetView",
			method:"POST",
			data:{
				email:"${email}",
				closet:"${closetNo}",
				category:item
			},
			dataType:"json"
		}).done(function(data){
			$(".item-page").html("");
			if(data.length == 0) {
				var contents = $("<div class='col-12' style='height:350px; font-weight:800;'>");
				var row1 = $("<div class='row text-center'>");
				var box1 = $("<div class='col-12' style='height:250px; line-height:250px;'>")
				var text1 = "비어있습니다."
				
				var row2 = $("<div class='row text-center'>");
				var box2 = $("<div class='col-12' style='height:100px; line-height:100px;'>")
				var btn = $("<button onclick='toDressUpload()' class='btn btn-outline-dark' type='button'>");
				var text2 = "옷 등록하러 가기"
				
				contents.append(row1);
				row1.append(box1);
				box1.append(text1);
				contents.append(row2);
				row2.append(box2);
				box2.append(btn);
				btn.append(text2);
				
				$(".item-page").append(contents);
			} else {
				// for문 감싸기~
				for(i=0;i<data.length;i++) {	
					var contents = $("<div class='col-4 mb-4 mt-4' onclick='toDetail("+data[i].dress.no+","+data[i].dress.c_no+")'>");
					var card = $("<div class='card h-100'>");
					var img = $("<img class='card-img-top' src='"+data[i].dressImg.path+"'style='height:200px;'>");
					var cardbody = $("<div class='card-body'>");
					var htag = $("<h5 class='card-title'>");
					var ptag = $("<p class='card-text'>");
					
					contents.append(card);
					card.append(img);
					card.append(cardbody);
					htag.append(data[i].dress.name)
					ptag.append(data[i].dress.memo)
					cardbody.append(htag);
					cardbody.append(ptag);
					
					$(".item-page").append(contents);
				}
				//	
			}
		}).fail(function(data){
			console.log("못가져왔어!");
		});
	});
	$("#closetName").on("change",function(){
		location.href = "${pageContext.request.contextPath}/closet/myCloset?target="+$("#closetName option:selected").val();
	});
	$("#toInfo").on("click",function(){
		location.href="${pageContext.request.contextPath}/myInfo";
	});
	$("#toCloset").on("click",function(){
		location.href="${pageContext.request.contextPath}/myCloset";	
	});
	$("#toStyle").on("click",function(){
		location.href="${pageContext.request.contextPath}/myStyle";
	});
</script>
</c:otherwise>
</c:choose>
</body>
</html>