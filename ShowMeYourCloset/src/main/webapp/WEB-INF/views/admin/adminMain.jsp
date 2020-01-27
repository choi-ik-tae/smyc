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
<style>
	.container {width: 1000px;max-width: none !important; border:1px solid lightgray; height:600px;}
	html,body{height: 100%;}
    body {display: -ms-flexbox;display: flex;-ms-flex-align: center;align-items: center;padding-top: 40px;padding-bottom: 40px;}
    #title{height:200px; line-height:200px; font-size:30pt; font-weight:800;}
    .borderDelete{border: 0px;}
</style>
</head>
<body>
	<div class="container p-0">
		<div class="row m-0">
			<div class="col-12 text-center" id="title">
				관리자님 환영합니다.
			</div>
		</div>
		<div class="row m-0">
			<div class="col-12">
				<button id="toChart" type="button" class="form-control btn btn-lg btn-outline-dark">통계</button>
			</div>
		</div>
		<div class="row m-0 mt-2">
			<div class="col-12">
				<button id="toBlock" type="button" class="form-control btn btn-lg btn-outline-dark">차단</button>
			</div>
		</div>
	</div>
	<script>
		$("#toChart").on("click",function(){
			location.href="${pageContext.request.contextPath}/admin/chart";
		});
		$("#toBlock").on("click",function(){
			location.href="${pageContext.request.contextPath}/admin/block";
		});
	</script>
</body>
</html>