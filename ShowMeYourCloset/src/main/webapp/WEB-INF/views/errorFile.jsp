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
</head>
<style>
    *{box-sizing: border-box;font-family: 'Noto Sans KR', sans-serif;}
    html,body{height: 100%;}
    body {display: -ms-flexbox;display: flex;-ms-flex-align: center;align-items: center;padding-top: 40px;padding-bottom: 40px; background-image: url(/imgs/bg/er1.jpg)}
    .error-form{background:rgba(255, 255, 255, 0.9); border-radius: 10px;}
</style>
<body>
<div class="container">
    <div class="row">
        <div class="col-9 m-auto error-form">
            <div class="row mt-3">
                <div class="col-9 m-auto text-center">
                    <span style="font-size: 20pt;font-weight: 800">Show Me Your Closet</span>
                </div>
            </div><hr class="m-2">
            <div class="row">
                <div class="col-9 m-auto text-center">
                    <p class="mt-3 mb-3" style="font-weight: 800;">이미 지워졌거나 존재하지 않는 파일입니다.</p>
                </div>
            </div>
            <div class="row mt-3 mb-3">
                <div class="col-9 m-auto text-center">
                    <button id="toHome" type="button" class="btn btn-outline-dark">돌아가기</button>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-12 text-center">
                    <span style="color:gray;font-weight: 800;font-size: 10pt">Copyright © 2020 InSync Inc. 모든 권리 보유.</span>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $("#toHome").on("click",function(){
       location.href="${pageContext.request.contextPath}/"; 
    });
</script>
</body>
</html>