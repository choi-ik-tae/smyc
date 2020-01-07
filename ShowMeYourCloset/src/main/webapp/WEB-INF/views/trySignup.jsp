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
	<c:choose>
		<c:when test="${result == 0 }">
			회원가입 하러 가십시오
		</c:when>
		<c:otherwise>
			이메일 체크 하십시오
		</c:otherwise>
	</c:choose>
</body>
</html>