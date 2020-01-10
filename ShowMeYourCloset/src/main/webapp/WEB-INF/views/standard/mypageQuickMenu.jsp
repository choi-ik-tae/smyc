<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
    #quickMenu{
    border: 1px solid gray;
        position: fixed;
        z-index:10;
        right: 50px;
        top: 400px;
        text-align: center;
        background:rgba(255, 255, 255, 0.9);
    }
</style>
<div id="quickMenu" class="menu">
	<a class="dropdown-item" href="#toTop">TOP</a>
	<div class="dropdown-divider"></div>
	<a class="dropdown-item" href="${pageContext.request.contextPath}/closetUpload">Closet Upload</a> 
	<a class="dropdown-item" href="${pageContext.request.contextPath}/dressUpload">Dress Upload</a> 
	<a class="dropdown-item" href="${pageContext.request.contextPath}/styleUpload">Style Upload</a>
	<div class="dropdown-divider"></div>
	<a class="dropdown-item" href="#bottom">BOTTOM</a>
</div>

