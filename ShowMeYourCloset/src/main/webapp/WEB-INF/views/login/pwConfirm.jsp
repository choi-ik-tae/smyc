<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div>
		인증 번호 : <input type="text" id="pwconfirm" name="pwconfirm">
		<button id="checkBtn">확인</button>
	</div>
	
	<script>		
		$("#checkBtn").on("click",function(){
			var pw = $("#pwconfirm").val();
			var pwOk = "${authkey}";
		
			if(pw == pwOk){
				location.href="${pageContext.request.contextPath}/pwChange";
			}else{
				alert("불일치!");
			}
		})
	</script>

</body>
</html>