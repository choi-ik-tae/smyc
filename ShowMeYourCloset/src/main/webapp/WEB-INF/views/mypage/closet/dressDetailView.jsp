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
	.container-fulid {width: 1900px;max-width: none !important;}
    *{box-sizing: border-box;font-family: 'Noto Sans KR', sans-serif;}
    html,body{height: 100%;}    
    #preview{width:300px;height: 300px;}
    .borderDelete{border: 0px;}
    .logo{font-size: 15pt;}
    #top{height: 80px;background-color:white;border-bottom: 1px solid gray; width: 1920px;max-width: none !important;}
    #bottom{background-color:white;border-top: 1px solid gray; width: 100%;height: 150px;}
    #bottom-logo{height: 150px; line-height: 150px;}
    #bottom-contents{font-size: 10pt;color: gray;}
	.nav-font{font-size: 10pt; font-weight: 800;}
    .nav-link:hover{cursor: pointer;}
    .nav-item>a{color: black; font-size: 15pt;}
</style>
</head>
<body>
    <div class="container-fulid text-center">
        <!-- 헤더 -->
    	<jsp:include page="../../standard/header.jsp" />
    	<!-- 빈공간 메꾸기 -->
    	<div class="row m-0" style="height:80px;"></div>
    	<div class="row m-0">
    	<div class="col-5 m-auto">
    	<form action="${pageContext.request.contextPath}/closet/dressUploadProc" enctype="multipart/form-data" method="post">
			<div class="row m-2">
				<div class="col-auto m-auto p-0 align-items-center" id="preview">
                    <img class='w-100 h-100' src="${img.path}">
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="closet" class="m-0 ">옷장</label>
				</div>
				<div class="col-10">
					<input id="closet" class="w-100 form-control bg-white" name="closet" type="text" value="${closet.name}" readonly>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="name" class="m-0 ">옷 이름</label>
				</div>
				<div class="col-10">
					<input id="name" class="w-100 form-control bg-white" name="name" type="text" value="${info.name}" readonly>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">카테고리</label>
				</div>
				<div class="col-10">
					<input id="category" class="w-100 form-control bg-white" name="category" type="text" value="" readonly>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">계절</label>
				</div>
				<!-- 계절 -->
                <div class="col-10 text-center">
					<div class="btn-group-toggle" data-toggle="buttons">
						<label class="btn btn-sm btn-outline-dark borderDelete" id="spring">
							<input type="checkbox" name="season" value="spring" disabled><span style="font-weight:800;">봄</span>
						</label>
						<label class="btn btn-sm btn-outline-dark borderDelete" id="summer">
							<input type="checkbox" name="season" value="summer" disabled><span style="font-weight:800;">여름</span>
						</label>
						<label class="btn btn-sm btn-outline-dark borderDelete" id="fall">
							<input type="checkbox" name="season" value="fall" disabled><span style="font-weight:800;">가을</span>
						</label>
						<label class="btn btn-sm btn-outline-dark borderDelete" id="winter">
							<input type="checkbox" name="season" value="winter" disabled><span style="font-weight:800;">겨울</span>
						</label>
					</div>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">공개여부</label>
				</div>
				<!-- 공개여부 -->
				<div class="col-10">
					<div class="btn-group-toggle" data-toggle="buttons">
						<label class="btn btn-sm btn-outline-dark borderDelete" id="Y">
							<input id="btnY" type="checkbox" name="pub" value="Y" disabled><span style="font-weight:800;">YES</span>
						</label>
						<label class="btn btn-sm btn-outline-dark borderDelete" id="N">
							<input id="btnN" type="checkbox" name="pub" value="N" disabled><span style="font-weight:800;">NO</span>
						</label>
					</div>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="price" class="m-0 ">가격</label>
				</div>
				<div class="col-10">
					<input id="price" class="w-100 form-control bg-white" name="price" type="text" value="${info.price}" readonly>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="buy_date" class="m-0 ">구매일자</label>
				</div>
				<div class="col-10">
					<c:choose>
					<c:when test="${day eq null}">
						<input class="w-100 form-control bg-white" type="text" readonly>
					</c:when>
					<c:otherwise>
						<input id="buy_date" class="w-100 form-control bg-white" name="buy_date" type="date" min="1950-01-01" max="2030-12-31" value="${day}" readonly>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">메모</label>
				</div>
				<div class="col-10">
					<textarea class="form-control bg-white" rows="5" style="resize: none" name="memo" id="memo" readonly>${info.memo}</textarea>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-12 m-3">
					<button id="toModify" type="button" class="btn btn-outline-dark">수정하기</button>
					<button id="toDelete" type="button" class="btn btn-outline-dark">삭제하기</button>
					<button id="toHome" type="button" class="btn btn-outline-dark">돌아가기</button>
				</div>
			</div>
		</form>
		</div>
		</div>
		<!-- 푸터 -->
    	<jsp:include page="../../standard/footer.jsp" />
	</div>
		<form action="${pageContext.request.contextPath}/closet/dressDelete" method="post" id="frm">
			<input type="hidden" name="no" value="${info.no}">
		</form>
    <c:choose>
    	<c:when test="${not empty info.pub}">
    		<script>
    			if($("#btn${info.pub}").val() == '${info.pub}'){
    				$("#btn${info.pub}").prop("checked",true);
	                $("#${info.pub}").addClass("active");
    			}
    		</script>
    	</c:when>
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
	                $("#${season}").addClass("active");
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