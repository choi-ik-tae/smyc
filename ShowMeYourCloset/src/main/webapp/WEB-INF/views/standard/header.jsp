<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row fixed-top align-items-center" id="top">
	<div class="col-2 text-center">
		<label class="m-0 logo">Show Your Closet</label>
	</div>
	<div class="col-10">
		<ul class="nav justify-content-end">
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">Home</a></li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">StyleBoard</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">StyleBoast</a> 
					<a class="dropdown-item" href="#">StyleHelp</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">MyPage</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Info</a>
					<a class="dropdown-item" href="#">Closet</a>
					<a class="dropdown-item" href="#">Style</a>
				</div>
			</li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/signin">Login</a></li>
			<!-- 로그인 후 회원가입 및 마이페이지 메뉴 추가 생성 -->
		</ul>
	</div>
</div>