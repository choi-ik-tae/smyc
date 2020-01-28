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
	.text-logo{cursor:pointer;}
</style>

</head>
<body>
	<form class="form-signin" action="${pageContext.request.contextPath}/member/signinProc" id="frm" method="post">
		<div class="text-logo"><h1 class="h3 mb-3 font-weight-normal text-center">Show Me Your Closet</h1></div>
		<input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address" required>
		<input type="password" id="inputPassword" name="pw" class="form-control mb-3" placeholder="Password" required>
		<div class="checkbox mb-3">
		</div>
		<button class="btn btn-lg btn-outline-secondary btn-block" type="button" id="signInBtn">Sign in</button>
		<div class="resultBox">
			<span id="result" style="font-size:12px;"></span>
		</div>
		<div class="signBox mt-2" style="font-size:10px;">
			<span style="float:left"><a href="${pageContext.request.contextPath}/idFind">이메일/비밀번호 찾기</a></span>
			<span style="float:right"><a href="${pageContext.request.contextPath}/signup">회원가입</a></span> 
		</div>
	</form>
	
	<script>
		$(".text-logo").on("click",function(){
			location.href="${pageContext.request.contextPath}/";
		})
		$("#signInBtn").on("click",function(){
			
			$.ajax({
				url:"${pageContext.request.contextPath}/member/signinProc",
				data:{
					email:$("#inputEmail").val(),
					pw:$("#inputPassword").val()
				}
				
			}).done(function(data){
				if(data == 0){
					$("#result").html("* 가입하지 않은 회원이거나, 이메일 혹은 패스워드가 일치하지 않습니다.")
					.css("color","red");
				}else if(data == 1){
					$("#result").html("* 인증되지 않은 이메일입니다. <br>&nbsp;&nbsp;이메일 인증을 진행해주세요.")
					.css("color","green");
				}else if(data == 2){
					$("#result").html("* 유해성 문제로 로그인이 차단 되었습니다. <br>&nbsp;&nbsp;관리자에게 문의하세요.")
					.css("color","red");
				}else{
					location.href="${pageContext.request.contextPath}/";
				}
			})
		
		})
	</script>
</body>
</html>