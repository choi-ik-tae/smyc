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
	.container {width: 1000px;max-width: none !important; margin-top:200px;}
    *{box-sizing: border-box;font-family: 'Noto Sans KR', sans-serif;}
    .preview{width:300px;height: 210px}
    body{background-image: url(imgs/bg/bg31.jpg);}
    #bg{background-color:white; border-radius: 10px;}
</style>
<script type="text/javascript">
 window.history.forward();
 function noBack(){window.history.forward();}
</script>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
    <div class="container text-center">
        <!-- 헤더 -->
        <div class="col-12 p-0" id="bg">
		<form action="${pageContext.request.contextPath}/closet/closetUploadProc" enctype="multipart/form-data" method="post">
			<div class="row m-2">
                <div class="col-12 mt-3">
					<div class="col-4 p-0 align-items-center preview d-inline-block">
						<label for="closet1">
					    	<img src="imgs/closet/closet1.png" class="w-100">
	                       	<input type="radio" name="img" id="closet1" value="closet1">
						</label>
					</div>
                    <div class="col-4 p-0 align-items-center preview d-inline-block">
	                    <label for="closet2">
	                        <img src="imgs/closet/closet2.png" class="w-100">
	                        <input type="radio" name="img" id="closet2" value="closet2">
	                    </label>
                    </div>
                    <div class="col-4 p-0 align-items-center preview d-inline-block">
	                    <label for="closet3">
	                        <img src="imgs/closet/closet3.png" class="w-100">
	                        <input type="radio" name="img" id="closet3" value="closet3">
	                    </label>
                    </div>
                </div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="name" class="m-0 ">옷장 이름</label>
				</div>
				<div class="col-10">
					<input id="name" class="w-100 form-control" name="name" type="text">
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="pub" class="m-0 ">공개여부</label>
				</div>
				<div class="col-10">
					<div class="form-check form-check-inline">
						<label class="form-check-label" for="y">
							<input class="form-check-input" type="radio" name="pub" id="y" value="Y"> YES
						</label>
					</div>
					<div class="form-check form-check-inline">
						<label class="form-check-label" for="n">
							<input class="form-check-input" type="radio" name="pub" id="n" value="N"> NO
						</label>
					</div>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="memo" class="m-0 ">메모</label>
				</div>
				<div class="col-10">
					<textarea class="form-control" rows="5" style="resize: none" name="memo" id="memo"></textarea>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-12 mb-3 align-self-center">
					<div class="row">
		                <div class="col-12">
			                <p>
								<span style="color:darkred">메모</span> 는 <span style="color:orangered">선택사항</span> 입니다.
			                </p>
		                </div>
	           	 	</div>
	           	 	<div class="row">
	           	 		<div class="col-12">
	           	 			<button id="toClosetUpload" type="submit" class="btn btn-outline-dark">등록하기</button>
							<button id="toHome" type="button" class="btn btn-outline-dark">돌아가기</button>
	           	 		</div>
	           	 	</div>
				</div>
			</div>
		</form>
		</div>
		<!-- 푸터 -->
    </div>
    <script>
		$("#name").on("blur",function(){
			var name = $("#name").val().length;
			if(name > 30){
				alert("30자 이내로 작성해주세요!");
				$("#name").val("");
			}
		});
		$("#memo").on("blur",function(){
			var name = $("#memo").val().length;
			if(name > 100){
				alert("100자 이내로 작성해주세요!");
				$("#memo").val("");
			}
		});
		$("#toClosetUpload").on("click",function(){
			var name = $("#name").val();
			var closetCk = 0;
			var pubCk = 0;
			
			// 이름 입력 검사
			if(name == "" || name == null) {
				alert("옷장 이름을 입력해주세요!");
	            return false;
			}
			// 옷장선택 여부 검사
	        $("input[name='img']").each(function(){
	        	if($(this).prop("checked") == true){
	        		closetCk += 1;
	            }
			});
	        if(closetCk == 0) {
	        	alert("옷장을 선택해주세요!");
	        	return false;
	        }
	        // 공개여부  체크검사
	        $("input[name='pub']").each(function(){
	        	if($(this).prop("checked") == true){
	        		pubCk += 1;
	        	}
	        })
	        if(pubCk == 0) {
	        	alert("공개여부를 선택해주세요!");
	       		return false;
	        }
	        console.log(pubCk)
	        console.log(closetCk)
		});
	    $("#toHome").on("click",function(){
	    	history.back();
		   	//location.href="${pageContext.request.contextPath}/"; 
		});
    </script>
</body>
</html>