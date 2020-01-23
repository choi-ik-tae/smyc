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
	.container {width: 800px;max-width: none !important;}
    *{box-sizing: border-box;font-family: 'Noto Sans KR', sans-serif;}
    html,body{height: 100%;}
    body {background-image: url(/imgs/bg/bg21.jpg);}
    #bg{background:rgba(255,255,255,1); border-radius: 10px;}
    #preview{width:300px;height: 300px;}
</style>
<script type="text/javascript">
 window.history.forward();
 function noBack(){window.history.forward();}
</script>
</head>
<body>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
    <div class="container mt-5 text-center">
        <!-- 헤더 -->
        <div class="col-12" id="bg">
		<form action="${pageContext.request.contextPath}/closet/dressModifyProc" enctype="multipart/form-data" method="post" id="frm">
			<input type="hidden" name="no" value="${info.no}">
			<div class="row m-2">
				<div class="col-auto m-auto p-0 align-items-center" id="preview">
					<img class='w-100 h-100' src="${infoImg.path}">
				</div>
			</div>
			<div class="row m-2">
				<div class="col-12">
					<button id="btnChangeImg" class="btn btn-outline-dark" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
						이미지 변경
		  			</button>
				</div>
				<div class="collapse col-12" id="collapseExample">
					<div class="card card-body p-0 border-0 mt-2">
						<div class="row">
							<div class="col-2 align-self-center">
								<label for="imgud" class="m-0 ">이미지</label>
							</div>
							<div class="col-10">
								<input id="imgud" class="form-control p-1" name="file" type="file" value="${infoImg.path}">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="imgud" class="m-0 ">옷장</label>
				</div>
				<div class="col-10">
					<!-- 여기 옷장 가져와서 뿌려야 함 -->
					<select class="custom-select" name="c_no">
						<c:choose>						
							<c:when test="${closet.size() > 0}">
								<c:forEach items="${closet}" var="clo">
									<option value="${clo.no}">${clo.name}</option>
								</c:forEach>
							</c:when>
						</c:choose>
					</select>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">옷 이름</label>
				</div>
				<div class="col-10">
					<input id="closet" class="w-100 form-control" name="name" type="text" value="${info.name}">
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">카테고리</label>
				</div>
				<div class="col-10">
					<select class="custom-select" name="category">
						<option value="Top">상의</option>
						<option value="Pants">하의</option>
						<option value="Shoes">신발</option>
						<option value="Acc">액세서리</option>
					</select>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">계절</label>
				</div>
				<div class="col-10">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="season" id="spring"
							value="spring"> <label class="form-check-label"
							for="spring">봄</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="season" id="summer"
							value="summer"> <label class="form-check-label"
							for="summer">여름</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="season" id="fall"
							value="fall"> <label class="form-check-label"
							for="fall">가을</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="season" id="winter"
							value="winter"> <label class="form-check-label"
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
						<input class="form-check-input" type="radio" name="pub" id="y" value="Y" required> <label class="form-check-label" for="y">YES</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="pub" id="n" value="N" required> <label class="form-check-label" for="n">NO</label>
					</div>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="price" class="m-0 ">가격</label>
				</div>
				<div class="col-10">
					<input id="price" class="w-100 form-control" name="price" type="text" value="${info.price}">
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="buy_date" class="m-0 ">구매일자</label>
				</div>
				<div class="col-10">
					<input id="buy_date" class="w-100 form-control" name="buy_date" type="date" min="1950-01-01" max="2030-12-31" value="${info.buy_date}">
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">메모</label>
				</div>
				<div class="col-10">
					<textarea class="form-control" rows="5" style="resize: none" name="memo" id="memo">${info.memo}</textarea>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-12 m-3">
					<button id="modify" type="button" class="btn btn-outline-dark">수정하기</button>
					<button id="toHome" type="button" class="btn btn-outline-dark">돌아가기</button>
				</div>
			</div>
		</form>
        </div>
		<!-- 푸터 -->
    </div>
    <c:choose>
	    <c:when test="${info.pub eq 'Y'}"><script>$("#y").prop("checked",true);</script></c:when>
	    <c:when test="${info.pub eq 'N'}"><script>$("#n").prop("checked",true);</script></c:when>
    </c:choose>
   	<c:forEach items="${season}" var="season">
    	<script>
	    	$("input[name=season]").each(function(){
	            if($(this).val() == '${season}') {
	                $(this).prop("checked",true);
	            }
	        });
    	</script>
    </c:forEach>
	<script>
		var check = 0;
		$("#btnChangeImg").on("click",function(){
			check = 1;
		});
		$("#modify").on("click",function(){
			var target = $("#imgud").val();
			if(check == 1) {
				if(target == "") {
					alert("이미지를 등록해 주세요!");
					return;
				}	
			}
			$("#frm").submit();
		});
		$("#toHome").on("click",function(){
		   	//location.href="${pageContext.request.contextPath}/";
		   	history.back();
		});
		// 등록 이미지 등록 미리보기
		function readInputFile(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#preview').html(
							"<img class='w-100 h-100' src="+ e.target.result +">");
				}
				reader.readAsDataURL(input.files[0]);
			} else {
				$('#preview').html("");
			}
		}
		$("#imgud").on('change', function() {
			readInputFile(this);
		});
	</script>
</body>
</html>