<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
    *{box-sizing: border-box;font-family: 'Noto Sans KR', sans-serif;}
    html,body{height: 100%;}
    body {display: -ms-flexbox;display: flex;-ms-flex-align: center;align-items: center;}
    #preview{width:300px;height: 300px;}
</style>
</head>
<body>
    <div class="container text-center">
        <!-- 헤더 -->
        
		<form action="${pageContext.request.contextPath}/closet/dressUploadProc" enctype="multipart/form-data" method="post">
			<div class="row m-2">
				<div class="col-auto m-auto p-0 align-items-center" style="border: 1px solid gray;" id="preview">
                    <img class='w-100 h-100' src="">
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="imgud" class="m-0 ">옷장</label>
				</div>
				<div class="col-10">
					<input id="" class="w-100 form-control" name="closet" type="text" value="" readonly>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">옷 이름</label>
				</div>
				<div class="col-10">
					<input id="" class="w-100 form-control" name="name" type="text" value="" readonly>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">카테고리</label>
				</div>
				<div class="col-10">
					<input id="category" class="w-100 form-control" name="category" type="text" value="" readonly>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">계절</label>
				</div>
				<div class="col-10">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="season" id="spring"
							value="spring" disabled> <label class="form-check-label"
							for="spring">봄</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="season" id="summer"
							value="summer" disabled> <label class="form-check-label"
							for="summer">여름</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="season" id="fall"
							value="fall" disabled> <label class="form-check-label"
							for="fall">가을</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="season" id="winter"
							value="winter" disabled> <label class="form-check-label"
							for="winter">겨울</label>
					</div>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">공개여부</label>
				</div>
				<div class="col-10">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="pub" id="y" value="Y" required disabled>
						<label class="form-check-label" for="y">YES</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="pub" id="n" value="N" required disabled>
                        <label class="form-check-label" for="n" disabled>NO</label>
					</div>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="price" class="m-0 ">가격</label>
				</div>
				<div class="col-10">
					<input id="price" class="w-100 form-control" name="price" type="text" readonly>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="buy_date" class="m-0 ">구매일자</label>
				</div>
				<div class="col-10">
					<input id="buy_date" class="w-100 form-control" name="buy_date" type="date" min="1950-01-01" max="2030-12-31" value="" readonly>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">메모</label>
				</div>
				<div class="col-10">
					<textarea class="form-control" rows="5" style="resize: none" name="memo" id="memo" readonly></textarea>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-12 align-self-center">
					<button id="toModify" class="btn btn-outline-secondary">수정하기</button>
					<button id="toDelete" class="btn btn-outline-secondary">삭제하기</button>
				</div>
			</div>
		</form>

		<!-- 푸터 -->
    </div>
	<script>
		$("#toModify").on("click",function(){
			location.href="${pageContext.request.contextPath}/dressModify";
		});
		$("#toDelete").on("click",function(){
			location.href="${pageContext.request.contextPath}/dressDelete";
		});
	</script>
</body>
</html>