<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
    .notifyPost{position:absolute;height:100vh;z-index:2000;background:rgba(56, 51, 50);width: 1920px;max-width: none !important;}
    #notifyText{border:1px solid black;border-radius:50px;background-color:white;height:800px;}
</style>
<!-- 신고게시물 화면 -->
    <div class="container-fulid notifyPost p-0" style="top:0px;">
        <div class="row m-0 mt-5">
			<div class="col-10 m-auto" id="notifyText">
				<div class="row m-0">
					<div class="col-12 text-center" style="line-height:800px;">
						<span style="font-weight:800">
						누적된 신고가 많은 게시물 입니다.&nbsp;&nbsp;<button id="toBack" type="button" class="btn btn-sm btn-outline-dark d-inline">돌아가기</button>
						</span>
					</div>
				</div>
			</div>
        </div>
    </div>
    <script>
    	$("#toBack").on("click",function(){
    		history.back();
    	})
    </script>
<!--  -->