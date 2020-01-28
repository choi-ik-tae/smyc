<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 숨김 메뉴 -->
    <div class="container-fluid p-0">
        <div class="row m-0 menu">
            <div class="p-0 menubar" style="width:23%;">
                <div class="row m-0">
                    <div class="col-12 p-2">
                        <button id="closeMenu" type="button" class="btn btn-outline-dark form-control">X</button>
                    </div>
                </div>
                <div class="row m-0" >
                    <div class="col-12 text-center" id="menu-nickname">
                    	<c:choose>	
                    		<c:when test="${email == null }">
                    			<span style="font-size:18px;">
                    				<button id="toLogin" type="button" class="btn borderDelete btn-outline-dark form-control">로그인</button>
                    			</span>
                    		</c:when>
                    		<c:otherwise>
                    			<span>${nick}</span>
                    		</c:otherwise>
                    	</c:choose>
                        
                    </div>
                </div><hr>
                <div class="row m-0">
                    <div class="col-12">
                        내 정보
                    </div>
                </div><hr>
                <div class="row m-0 infoMenu">
                    <div class="col-12">
                    	<div class="row">
	                        <c:choose>	
	                    		<c:when test="${email == null }">
	                 
	                    		</c:when>
	                    		<c:otherwise>
	                    			<button id="toLogout" type="button" class="btn borderDelete btn-outline-dark form-control">로그아웃</button>
	                    		</c:otherwise>
	                    	</c:choose>
                        	
                        </div>
                        <div class="row">
                            <button id="toMyBoard" type="button" class="btn borderDelete btn-outline-dark form-control">내가 쓴 글</button>
                        </div>
                        <div class="row">
                            <button id="toMyComments" type="button" class="btn borderDelete btn-outline-dark form-control">내가 쓴 댓글</button>
                        </div>
                        <div class="row">
                        	<button id="toMypage" type="button" class="btn borderDelete btn-outline-dark form-control">마이 페이지</button>
                        </div>
                    </div>
                </div><hr>
                <div class="row m-0">
                    <div class="col-12">
                        게시판
                    </div>
                </div><hr>
                <div class="row m-0">
                   <div class="col-12">
                        <div class="row">
                            <button id="toMain" type="button" class="btn borderDelete btn-outline-dark form-control">메인 페이지</button>
                        </div>
                        <div class="row">
                            <button id="toBoast" type="button" class="btn borderDelete btn-outline-dark form-control">자랑 게시판</button>
                        </div>
                        <div class="row">
                            <button id="toHelp" type="button" class="btn borderDelete btn-outline-dark form-control">도움 게시판</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="p-0 mainblock" style="width:77%;"></div>
         </div>
    </div>
    <script>
    	$("#toLogin").on("click",function(){
    		location.href="${pageContext.request.contextPath}/signin";
    	})
    	$("#toMain").on("click",function(){
    		location.href="${pageContext.request.contextPath}/";
    	});
    	$("#toBoast").on("click",function(){
    		location.href="${pageContext.request.contextPath}/board/boastBoard";
    	});
    	$("#toHelp").on("click",function(){
    		location.href="${pageContext.request.contextPath}/board/helpBoard";
    	});
    	$("#toMypage").on("click",function(){
    		location.href="${pageContext.request.contextPath}/myInfo";
    	});
    	$("#toLogout").on("click",function(){
    		location.href="${pageContext.request.contextPath}/member/logoutProc";
    	});
    	$("#toMyComments").on("click",function(){
    		if("${email}"==""){
    			alert("로그인 후 이용해주세요");
    			return;
    		}
    		location.href="${pageContext.request.contextPath}/comments/myComments";
    	});
    	$("#toMyBoard").on("click",function(){
    		if("${email}"==""){
    			alert("로그인 후 이용해주세요");
    			return;
    		}
    		location.href="${pageContext.request.contextPath}/board/myBoard";
    	});
    </script>
<!--  -->