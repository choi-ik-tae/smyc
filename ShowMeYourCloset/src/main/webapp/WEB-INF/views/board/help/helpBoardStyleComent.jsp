<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <!-- Bootstap4 -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
        <style>

        </style>
    </head>
    <body>
        <div class="container-fuild">
            <div class="row m-0">
                <div class="col-12 p-0" style="min-height: 200px; overflow: hidden;">
                    <div class="row commentContainer">
                    	<c:if test="${list.size()== null || list.size() == 0 }">
                    		<div class="col-12" style="text-align : center; line-height:200px;">
                    			<span>등록된 도움 글이 없습니다.</span>
                    		</div>
                    	</c:if>
	                    <c:forEach items="${list}" var="item">
	                    	<div class="col-6" onclick="detailAdvisor(${item.no})">
	                            <div class="row m-2 p-2" style="border: 1px solid #bcbcbc; border-radius: 5px;">
	                                <div class="col-4 p-0" style="height: 100px;">
	                                    <img src="${item.top}" style="width: 100%; height: 100%;">
	                                </div>
	                                <div class="col-8" >
	                                    <div class="row" style="height: 100px;">
	                                        <div class="col-12" style="height: 50%;">${item.title}</div>
	                                        <div class="col-12" style="height: 50%;">${item.nickname}</div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </c:forEach>
                    </div>
                </div>
            </div>
            <div class="row m-0 mt-3 mb-2">
                <div class="col-12" style="text-align: center;">
                    <span>${page}</span>
                </div>
            </div>
            <div class="row m-0 ">
                <div class="col-12" style="text-align: right;">
                    <button id="btn" class="btn btn-info"> 코디 도움 주기</button>
                </div>
            </div>
            <div class="van" style="height:20px;">
            </div>
        </div>

        <script>
        	var detailAdvisor = function(no){
        		parent.document.detailFrm.writer.value="${writer}";
        		parent.document.detailFrm.no.value=no;
        		
        		parent.document.detailFrm.submit();
        	}
        	
            $("#btn").on("click",function(){
            	if("${email}" == ""){
            		alert("로그인을 해주세요.");
            		return ; 
            		
            	}
            	
            	parent.document.hiddenFrm.writer.value="${writer}";
            	parent.document.hiddenFrm.b_no.value="${b_no}";
            	
            	parent.document.hiddenFrm.submit();
            })
        </script>
    </body>
</html>