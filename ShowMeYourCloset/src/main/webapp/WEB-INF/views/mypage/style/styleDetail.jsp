<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
.imgBox {
	position: absolute;
	left: 250px;
	top: 68px;
}

.category {
	position: absolute;
	width: 200px;
	z-index: 1;
	border-radius: 10px;
	color: white;
	font-size: 28px;
	opacity: 0.9;
	background-color: darkgrey;
	text-align: center;
	background-color: darkgrey;
}

.Top {
	height: 200px;
	left: 350px;
	top: 260px;
}

.Pants {
	left: 350px;
	top: 470px;
	height: 210px;
}

.Shoes {
	left: 350px;
	top: 690px;
	height: 150px;
}

.Acc {
	top: 350px;
	left: 80px;
	height: 150px;
}

#shilouette {
	width: 400px;
}

.wrapper {
	position: absolute;
	border: 2px solid #bcbcbc;
	height: 1000px;
	width: 1350px;
	left: 300px;
	border-radius: 20px;
	z-index: -1;
}

.categoryImg {
	width: 100%;
	height: 100%;
}

.detailDress {
	position: absolute;
	height: 850px;
	width: 530px;
	left: 720px;
	top: 45px;
	border-radius: 10px;
	border: 1px solid #bcbcbc;
}

.imgDetail {
	max-width: 480px;
	max-height: 450px;
	z-index: 1;
	margin: auto;
	margin-top: 23px;
}
.imgDetail>img{
	max-width: 480px;
	max-height: 380px;
}


.infoDetail {
	margin-top :50px;
	width: 480px;
	height: 300px;
	z-index: 1;
	margin: auto;
}

.form-wrapper {
	position: absolute;
	left: 300px;
	top: 1010px;
	width: 1350px;
	border-radius: 20px;
	border: 2px solid #bcbcbc;
}

.checkLabel {
	background: dimgrey;
	color: white;
	border: 2px solid dimgrey;
}
</style>
</head>
<body>
	<div class="wrapper-all">
		<div class="wrapper">
			<div class="detailDress" style="text-align:center;">
				<div style="height:400px; line-height:400px;">
					<div class="imgDetail"></div>
				</div>
				<div>
					<div class="infoDetail">
						<label>옷 이름</label> 
						<input class="form-control" type="text" id="name" disabled> 
						<label>카테고리</label> 
						<input class="form-control" type="text" id="categoryInput" disabled>
						<label>공개여부</label> 
						<input class="form-control" type="text" id="pub" disabled> 
						<label>계절</label> 
						<input class="form-control" type="text" id="season" disabled> 
						<label>메모</label>
						<input class="form-control" type="text" id="memo" disabled>
					</div>
				</div>
			</div>
			<div class="category Top" id="Top">
				<c:if test="${dto.top !=null}">
					<img src="${dto.top}" onError="javascript:this.src='/imgs/shilouette/whiteBack.JPG'" class="categoryImg">
				</c:if>

			</div>
			<div class="category Pants" id="Pants">
				<c:if test="${dto.pants !=null }">
					<img src="${dto.pants}" onError="javascript:this.src='/imgs/shilouette/whiteBack.JPG'" class="categoryImg">
				</c:if>
			</div>
			<div class="category Shoes" id="Shoes">
				<c:if test="${dto.shoes != null}">
					<img src="${dto.shoes}" onError="javascript:this.src='/imgs/shilouette/whiteBack.JPG'" class="categoryImg">
				</c:if>
			</div>
			<div class="category Acc" id="Acc">
				<c:if test="${dto.acc !=null }">
					<img src="${dto.acc}" onError="javascript:this.src='/imgs/shilouette/whiteBack.JPG'" class="categoryImg">
				</c:if>
			</div>
			<div class="imgBox">
				<p style="text-align: center; font-size: 15px; color: #bcbcbc">*
					옷을 클릭하면 옷의 상세 정보가 나옵니다.</p>
				<c:choose>
					<c:when test="${gender == 'W'}">
						<img src="/imgs/shilouette/woman.png" id="shilouette">
					</c:when>
					<c:otherwise>
						<img src="/imgs/shilouette/man.png" id="shilouette">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="borderBtnBox"
				style="position: absolute; bottom: 20px; width: 100%; text-align: center">
				<span>
					<button id="toBoast" type="button" class="btn btn-secondary" style="width: 250px;">코디 자랑하기</button>
				</span>
			</div>
		</div>
		<div class="form-wrapper styleInfo">
			<div class="row">
				<div class="col-12 p-5">
					<label for="InputName">Style Name</label> 
					<input type="text" class="form-control" name="name" id="InputName" value="${dto.name}" disabled>
				</div>
				<div class="col-12 pl-5 pb-5">
					<label>Season</label>
					<div style="padding-left: 30px;">
						<div class="btn-group-toggle" data-toggle="buttons">
							<c:forEach items="${season}" var="s">
								<label class="btn checkLabel" id="${s}Label"> 
									<input type="checkbox" name="season" class="checkList" value="${s}" checked disabled> ${s}
								</label>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-12 pl-5 pb-5 pr-5">
					<label for="InputMemo">Memo</label>
					<textarea class="form-control" style="height: 150px; resize: none;" id="InputMemo" name="memo" disabled>${dto.memo}</textarea>
				</div>
			</div>
			<div class="row">
				<div class="col-12 pl-5 pb-5 pr-5">
					<span style="float: right;" class="m-1">
						<button type="button" id="styleModifyBtn" class="btn btn-secondary">코디 수정</button>
					</span> 
					<span style="float: left" class="m-1"> 
						<button type="button" class="btn btn-secondary" id="back">돌아가기</button>
					</span>
				</div>
			</div>
		</div>
	</div>
	<script>
		$("#back").on("click",function(){
			history.back();
		})
		$("#toBoast").on("click",function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/board/boastIsExist",
				data : { s_no : ${dto.no} }
			}).done(function(data) {
				if (data == 'be') {
					alert("이미 자랑한 스타일입니다!");
					return false;
				} else {
					location.href="${pageContext.request.contextPath}/board/boastUpload?no="+${dto.no};
				}
			});
		});
		$("#styleModifyBtn").on("click",function(){
			location.href="${pageContext.request.contextPath}/style/modifyPage?no="+${dto.no};
		});
		// 디테일 초기화
		var init = function() {
			$(".imgDetail").html("");
			$("#name").val("");
			$("#categoryInput").val("");
			$("#pub").val("");
			$("#season").val("");
			$("#memo").val("");
		}
	
		$(".category").on("click",function() {
			init();
			var src = $(this).children("img").attr("src");
			var img = $("<img onError='javascript:this.src='/imgs/shilouette/whiteBack.JPG''>");
			img.attr("src", src);
			$(".imgDetail").append(img);
			$.ajax({
				url : "${pageContext.request.contextPath}/closet/styleDetailDress",
				data : { path : src },
				dataType : "json"
			}).done(function(data) {
				if (data != null) {
					$("#name").val(data.name);
					$("#categoryInput").val(data.category);
					if (data.pub == 'Y') {
						$("#pub").val("공개");
					} else if (data.pub == 'N') {
						$("#pub").val("비공개");} 
					else { 
						$("#pub").val(data.pub);
					}
					$("#season").val(data.season);
					$("#memo").val(data.memo);
				}
			})
		});
	</script>
</body>
</html>