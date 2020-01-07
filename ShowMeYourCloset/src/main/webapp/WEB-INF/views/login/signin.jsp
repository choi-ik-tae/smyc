<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- signin.css -->
<link rel="stylesheet" type="text/css" href="/css/signin.css">

<style>
	a{
		color : black;
	}
</style>

</head>
<body>
	<form class="form-signin" action="" id="frm" method="post">
		<h1 class="h3 mb-3 font-weight-normal text-center">Show Me Your Closet</h1>
		<input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address" required>
		<input type="password" id="inputPassword" name="pw" class="form-control mb-3" placeholder="Password" required>
		<div class="checkbox mb-3">
			<label>
				<input type="checkbox" value="remember-me"> Remember me
			</label>
		</div>
		<button class="btn btn-lg btn-outline-secondary btn-block" type="submit">Sign in</button>
		<div class="signBox mt-2" style="font-size:10px;">
			<span style="float:left"><a href="${pageContext.request.contextPath}/idFind">이메일/비밀번호 찾기</a></span>
			<span style="float:right"><a href="${pageContext.request.contextPath}/signup">회원가입</a></span> 
		</div>
	</form>
</body>
</html>