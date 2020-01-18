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
	.container-fulid {width: 1890px;max-width: none !important;}
    *{box-sizing: border-box;font-family: 'Noto Sans KR', sans-serif;}
    html,body{height: 100%;}
    body {display: -ms-flexbox;display: flex;-ms-flex-align: center;align-items: center;}
    .preview{width:300px;height: 210px}
</style>
<script type="text/javascript">
 window.history.forward();
 function noBack(){window.history.forward();}
</script>
</head>
<body>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
    <div class="container text-center">
        <!-- 헤더 -->
        
		<form action="${pageContext.request.contextPath}/closet/closetUploadProc" enctype="multipart/form-data" method="post">
			<div class="row m-2">
                <div class="col-12">
                    <label for="closet1">
				        <div class="col-auto m-auto p-0 align-items-center preview">
				            <img src="imgs/closet/closet1.png" class="w-100">
				        </div>
                        <input type="radio" name="img" id="closet1" value="closet1" required>
                    </label>

                    <label for="closet2">
                        <div class="col-auto m-auto p-0 align-items-center preview">
                            <img src="imgs/closet/closet2.png" class="w-100">
                        </div>
                        <input type="radio" name="img" id="closet2" value="closet2" required>
                    </label>

                    <label for="closet3">
                        <div class="col-auto m-auto p-0 align-items-center preview">
                            <img src="imgs/closet/closet3.png" class="w-100">
                        </div>
                        <input type="radio" name="img" id="closet3" value="closet3" required>
                    </label>
                </div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">옷장 이름</label>
				</div>
				<div class="col-10">
					<input id="name" class="w-100 form-control" name="name" type="text">
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">공개여부</label>
				</div>
				<div class="col-10">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="pub" id="y"
							value="Y"> <label class="form-check-label" for="y">YES</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="pub" id="n"
							value="N"> <label class="form-check-label" for="n">NO</label>
					</div>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">메모</label>
				</div>
				<div class="col-10">
					<textarea class="form-control" rows="5" style="resize: none" name="memo" id="memo"></textarea>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-12 align-self-center">
					<button class="btn btn-outline-dark">등록하기</button>
					<button id="toHome" type="button" class="btn btn-outline-dark">돌아가기</button>
				</div>
			</div>
		</form>

		<!-- 푸터 -->
    </div>
    <script>
	    $("#toHome").on("click",function(){
	    	history.back();
		   	//location.href="${pageContext.request.contextPath}/"; 
		});
    </script>
</body>
</html>