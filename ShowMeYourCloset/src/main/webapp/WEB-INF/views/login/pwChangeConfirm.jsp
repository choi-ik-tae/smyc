<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<script>
		var result = confirm("비밀번호가 변경 되었습니다.");
		
		if(result){
			location.href="${pageContext.request.contextPath}/";
		}
		
	</script>

</body>
</html>