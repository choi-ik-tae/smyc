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
                    <img class='w-100 h-100' src="${img.path}">
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="closet" class="m-0 ">옷장</label>
				</div>
				<div class="col-10">
					<input id="closet" class="w-100 form-control" name="closet" type="text" value="${closet.name}" readonly>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="name" class="m-0 ">옷 이름</label>
				</div>
				<div class="col-10">
					<input id="name" class="w-100 form-control" name="name" type="text" value="${info.name}" readonly>
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
                        <label class="form-check-label" for="n">NO</label>
					</div>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="price" class="m-0 ">가격</label>
				</div>
				<div class="col-10">
					<input id="price" class="w-100 form-control" name="price" type="text" value="${info.price}" readonly>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="buy_date" class="m-0 ">구매일자</label>
				</div>
				<div class="col-10">
					<c:choose>
					<c:when test="${day eq null}">
						<input class="w-100 form-control" type="text" readonly>
					</c:when>
					<c:otherwise>
						<input id="buy_date" class="w-100 form-control" name="buy_date" type="date" min="1950-01-01" max="2030-12-31" value="${day}" readonly>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">메모</label>
				</div>
				<div class="col-10">
					<textarea class="form-control" rows="5" style="resize: none" name="memo" id="memo" readonly>${info.memo}</textarea>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-12 align-self-center">
					<button id="toModify" type="button" class="btn btn-outline-dark">수정하기</button>
					<button id="toDelete" type="button" class="btn btn-outline-dark">삭제하기</button>
					<button id="toHome" type="button" class="btn btn-outline-dark">돌아가기</button>
				</div>
			</div>
		</form>
		<form action="${pageContext.request.contextPath}/closet/dressDelete" method="post" id="frm">
			<input type="hidden" name="no" value="${info.no}">
		</form>
		<!-- 푸터 -->
    </div>
    <c:choose>
	    <c:when test="${info.pub eq 'Y'}"><script>$("#y").prop("checked",true);</script></c:when>
	    <c:when test="${info.pub eq 'N'}"><script>$("#n").prop("checked",true);</script></c:when>
    </c:choose>
    <c:choose>
    	<c:when test="${info.category eq 'Top'}"><script>$("#category").val("상의");</script></c:when>
	    <c:when test="${info.category eq 'Pants'}"><script>$("#category").val("하의");</script></c:when>
	    <c:when test="${info.category eq 'Shoes'}"><script>$("#category").val("신발");</script></c:when>
	    <c:when test="${info.category eq 'Acc'}"><script>$("#category").val("액세서리");</script></c:when>
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
		$("#toModify").on("click",function(){
			location.href="${pageContext.request.contextPath}/dressModify?no="+${info.no};
		});
		$("#toDelete").on("click",function(){
			var q = confirm("삭제 시 저장된 코디에 영향을 끼치게 됩니다. 정말 삭제하시겠습니까??");
			if(q) {
				$("#frm").submit();	
			}
		});
		$("#toHome").on("click",function(){
		   	location.href="${pageContext.request.contextPath}/myCloset"; 
		});
	</script>
</body>
</html>