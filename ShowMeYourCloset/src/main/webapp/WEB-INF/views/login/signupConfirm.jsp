<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>
<!-- signin.css -->
<link rel="stylesheet" type="text/css" href="/css/signin.css">
</head>
<body>


	<div class="form-signin">
		<h3 class="h3 mb-3 form-control" style="background:lightyellow; color:#595757;font-weight:700; text-align:center">
			<c:if test="${auth_check == 0}">
				인증 메일을 보냈습니다.
			</c:if>
			<c:if test="${auth_check == 1 }">
				회원 가입이 완료 되었습니다.	
			</c:if>
		</h3>
		<div style="text-align:center">
			<button id="mainGo" class="btn btn-info ">Main ></button>
			<button id="loginGo" class="btn btn-info ">SignIn ></button>
		</div>

	</div>
	
	<script>
		$("#mainGo").on("click",function(){
			location.href="${pageContext.request.contextPath}/";
		})
		
		$("#loginGo").on("click",function(){
			location.href="${pageContext.request.contextPath}/signin";
		})
	</script>



</body>
</html>