<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstap4 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
	
<style>
	.container-fuild {width: 1903px;max-width: none !important;}
	.container {width: 1140px;max-width: none !important;}
    *{box-sizing: border-box;font-family: 'Noto Sans KR', sans-serif;}
    .nav-font{font-size: 10pt; font-weight: 800;}
    .nav-item>a{color: black; font-size: 15pt;}
    .logo{font-size: 15pt;}
    #top{height: 80px;background-color:white;border-bottom: 1px solid gray;width: 1903px;max-width: none !important;}
    #bottom{background-color:white;border-top: 1px solid gray;width: 100%;height: 150px;}
    #bottom-logo{height: 150px; line-height: 150px;}
    #bottom-contents{font-size: 10pt;color: gray;}
    .nav-link:hover{cursor: pointer;}
</style>

</head>
<body>
	<c:choose>
		<c:when test="${email ==null }">
			
			<script>
				alert("로그인 해주세요!");
				location.href="${pageContext.request.contextPath}/signin";
			</script>
			
			
		</c:when>
		<c:otherwise>
			<div class="container-fuild">

				<!-- 헤더 -->
				<jsp:include page="../../standard/header.jsp" />

				<div class="row m-0 mt-5" style="margin-top: 300px;">
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
				<div class="row m-0">
					<div class="col-12 text-center">
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


				<!-- 푸터 -->
				<jsp:include page="../../standard/footer.jsp" />

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