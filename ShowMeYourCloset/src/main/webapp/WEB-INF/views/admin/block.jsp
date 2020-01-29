<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <!-- Bootstap4 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
        *{box-sizing: border-box;font-family: 'Noto Sans KR', sans-serif;}
        .container{width: 1200px;max-width: none !important;height:600px; margin-top:100px;}
        #title{height:200px; line-height:200px; font-size:30pt; font-weight:800;}
        .borderDelete{border: 0px;}
        #toChart{height: 100px;}
        #toBlock{height: 100px;}
        .navi{border-bottom: 1px solid lightgray;font-weight: 800;font-size: 25pt; background-color:white;}
        .chartTitle>div{border: 1px solid black; text-align: center;}
        .chartContents>div{border: 1px solid black; text-align: center;}
    </style>
</head>

<body>
	<c:if test="${admin ==null }">
    		<script>
    			alert("나가시라구여!!!");
    			location.href="${pageContext.request.contextPath}/";
    		</script>
    	</c:if>
    <div class="container p-0">
        <div class="row navi m-0 fixed-top">
            <div class="col-12 text-center">
                SHOW ME YOUR CLOSET
            </div>
        </div>
        <div class="row m-0">
            <div class="col-12 mb-3" style="font-size: 20px; font-weight: 600; text-align: center;">
                <span>
                    회원 명단
                </span>
            </div>
        </div>
        <div class="row m-0">
            <div class="col-10" style="margin: auto;">
                <div class="row chartTitle">
                    <div class="col-3">
                        <span>이메일</span>
                    </div>
                    <div class="col-1">
                        <span>이름</span>
                    </div>
                    <div class="col-2">
                        <span>닉네임</span>
                    </div>
                    <div class="col-2">
                        <span>전화번호</span>
                    </div>
                    <div class="col-1">
                        <span>성별</span>
                    </div>
                    <div class="col-2">
                        <span>가입 날짜</span>
                    </div>
                    <div class="col-1">
                        <span>차단</span>
                    </div>
                </div>
                <c:forEach var="i" begin="0" end="${list.size()-1}">
                	<div class="row chartContents">
	                    <div class="col-3 p-0">
	                        <span>${list.get(i).email}</span>
	                    </div>
	                    <div class="col-1 p-0">
	                        <span>${list.get(i).name}</span>
	                    </div>
	                    <div class="col-2 p-0">
	                        <span>${list.get(i).nickname }</span>
	                    </div>
	                    <div class="col-2 p-0">
	                        <span>${list.get(i).phone}</span>
	                    </div>
	                    <div class="col-1 p-0">
	                        <span>${list.get(i).gender}</span>
	                    </div>
	                    <div class="col-2 p-0">
	                        <span>${list.get(i).join_date}</span>
	                    </div>
	                    <div class="col-1 p-0">
	                    	<c:choose>
	                    		<c:when test="${list.get(i).ban== 'N' }">
	                    			<span><button class="blockBtn" id="identity${i}" onclick="blockProc('${list.get(i).email}','${i}')">차단</button></span>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<span><button class="releaseBtn" id="identity${i}" onclick="blockProc('${list.get(i).email}','${i}')">차단해제</button></span>
	                    		</c:otherwise>
	                    	</c:choose>
	                    </div>
                	</div>
                </c:forEach>
                
            </div>
        </div>
    </div>
    <script>
    	var blockProc = function(email,selec){
    		var statusClass =$("#identity"+selec).attr("class");
    		var check = "N";
    		if(statusClass=="blockBtn"){
    			$("#identity"+selec).attr("class","releaseBtn").text("차단해제");
    			check="Y";
    		}else{
    			$("#identity"+selec).attr("class","blockBtn").text("차단");
    		}
    		
    		$.ajax({
    			url:"${pageContext.request.contextPath}/admin/blockProc",
    			data:{
    				email:email,
    				ban:check
    			}
    		}).done(function(data){
    			console.log(data);
    		})
    
    		
    	}
    </script>
</body>
</html>