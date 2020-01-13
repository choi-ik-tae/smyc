<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstap4 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
		<c:when test="${email ==null }">
			로그인을 하십시오.
		</c:when>
		<c:otherwise>
			<div class="container-fuild">

				<!-- 헤더 -->
				<jsp:include page="../../standard/header.jsp" />

				<div class="row mt-5" style="margin-top: 300px;">
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
								</div>
								<hr>
							</div>
						</div>

					</div>
				</div>
				<div class="row">
					<div class="col-12" style="text-align: center">
						<h3>MY INFO</h3>
						<hr style="width: 500px;">
					</div>
				</div>
				<form action="${pageContext.request.contextPath}/member/InfoCheck" method="post">
					<input type="hidden" name="email" value="${email}">
					<div class="container" style="border: 1px solid #bcbcbc; border-radius: 20px; margin-bottom: 100px;">
						<div class="row" style="position: relative; top: 45%; height: 650px; ">
							<div class="col-4"></div>
							<div class="col-3 p-0" style="margin: auto">
								<input type="password" name="pw" class="form-control" placeholder="비밀번호를 입력해주세요">
							</div>
							<div class="col-2" style="margin: auto">
								<button class="btn btn-info" style="width: 80%;">확인</button>
							</div>
							<div class="col-3"></div>
						</div>
					</div>
				</form>

				<div class="row">
					<div class="col-12">
						<!-- 푸터 -->
						<jsp:include page="../../standard/footer.jsp" />
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<script>
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
</body>
</html>