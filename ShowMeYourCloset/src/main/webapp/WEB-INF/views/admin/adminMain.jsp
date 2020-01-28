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
    *{box-sizing: border-box;font-family: 'Noto Sans KR', sans-serif;}
	.container{width: 1000px;max-width: none !important;height:600px; margin-top:200px;}
    .contents{margin-top:150px;}
    #title{height:200px; line-height:200px; font-size:30pt; font-weight:800;}
    .borderDelete{border: 0px;}
    #toChart{height: 100px;}
    #toBlock{height: 100px;}
    .navi{border-bottom: 1px solid lightgray;font-weight: 800;font-size: 25pt;}
</style>
</head>
<body>
	<div class="container p-0">
        <div class="row navi m-0 fixed-top">
            <div class="col-12 text-center">
                SHOW ME YOUR CLOSET
            </div>
        </div>
		<div class="row m-0">
		    <div class="contents col-12">
		        <div class="row m-0 mt-5">
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