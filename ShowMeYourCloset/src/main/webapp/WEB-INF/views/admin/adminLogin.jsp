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
	a{color : black;}
	.text-logo{cursor:pointer;}
	html,body{height: 100%;}
    body {display: -ms-flexbox;display: flex;-ms-flex-align: center;align-items: center;padding-top: 40px;padding-bottom: 40px;}
    .form-signin {width: 100%;max-width: 330px;padding: 15px;margin: auto; background:rgba(255, 255, 255, 0.9); border-radius: 20px; border:2px solid lightgray;}
    .form-signin .checkbox {font-weight: 400;}
    .form-signin .form-control { position: relative;box-sizing: border-box;height: auto;padding: 10px;font-size: 16px;}
</style>
</head>
<body>
	<form class="form-signin" action="${pageContext.request.contextPath}/admin/adminMain" id="frm" method="post">
		<div class="text-logo"><h1 class="h3 mb-3 font-weight-normal text-center">관리자 모드</h1></div>
		<input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address" required>
		<input type="password" id="inputPassword" name="pw" class="form-control mb-3" placeholder="Password" required>
		<div class="checkbox mb-3">
		</div>
		<button class="btn btn-lg btn-outline-dark btn-block" type="button" id="signInBtn">로그인</button>
		<div class="resultBox">
			<span id="result" style="font-size:12px;"></span>
		</div>
	</form>
	<script>
		$(".text-logo").on("click",function(){
			location.href="${pageContext.request.contextPath}/";
		})
		$("#signInBtn").on("click",function(){
			$("#frm").submit();
		})
	</script>
</body>
</html>