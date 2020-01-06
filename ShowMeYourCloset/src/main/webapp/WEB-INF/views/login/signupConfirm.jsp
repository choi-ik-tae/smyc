<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${auth_check == 0}">
		인증 메일을 보냈습니다.
	</c:if>
	<c:if test="${auth_check == 1 }">
		회원 가입이 완료 되었습니다.
		
	</c:if>

</body>
</html>