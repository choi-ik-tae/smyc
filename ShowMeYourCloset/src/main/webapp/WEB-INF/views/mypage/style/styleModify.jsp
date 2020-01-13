<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap"
	rel="stylesheet">
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
	height: 940px;
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
	width: 480px;
	height: 450px;
	z-index: 1;
	margin: auto;
	margin-top: 23px;
}

.imgDetail>img {
	width: 100%;
	height: 100%;
}

.infoDetail {
	width: 480px;
	height: 300px;
	z-index: 1;
	margin: auto;
}

.form-wrapper {
	position: absolute;
	left: 300px;
	top: 950px;
	width: 1350px;
	border-radius: 20px;
	border: 2px solid #bcbcbc;
}


.categoryMenu {
	position: absolute;
	height: 780px;
	width: 530px;
	left: 950px;
	top: 80px;
	z-index: 2;
	border-radius: 10px;
	background: #e8dfd8;
}

.closetSelc {
	position: absolute;
	left: 770px;
	top: 30px;
}

.categoryImgDiv {
	width: 150px;
	height: 150px;
	display: inline-block;
	padding: 5px;
}

.noneDiv {
	width: 150px;
	height: 150px;
	display: inline-block;
	padding: 5px;
}

.noneDiv>img {
	width: 100%;
	height: 100%;
}

.categoryImgDiv>img {
	width: 100%;
	height: 100%;
}

.loadImg {
	width: 100%;
	height: 100%;
}

.checkLabel {
	background: darkgrey;
}
</style>
</head>
<body>
	<div class="wrapper-all">
		<div class="categoryMenu p-3"></div>
		<div class="wrapper">

			<div class="closetSelc" style="width: 300px;">
				<select class="form-control" id="closet" name="closet"
					onchange="changeClosetSelect()">
					<c:forEach var="closetDTO" items="${closetList}">
						<option value="${closetDTO.no}">${closetDTO.name}</option>
					</c:forEach>
				</select>
			</div>

			<div class="category Top" id="Top">
				<c:if test="${dto.top !=null}">
					<img src="${dto.top}" class="categoryImg" onError="javascript:this.src='/imgs/shilouette/none.png'" id="topImg">
				</c:if>
			</div>
			<div class="category Pants" id="Pants">
				<c:if test="${dto.pants !=null }">
					<img src="${dto.pants}" class="categoryImg" onError="javascript:this.src='/imgs/shilouette/none.png'" id="bottomImg">
				</c:if>
			</div>
			<div class="category Shoes" id="Shoes">
				<c:if test="${dto.shoes != null}">
					<img src="${dto.shoes}" class="categoryImg" onError="javascript:this.src='/imgs/shilouette/none.png'" id="shoesImg">
				</c:if>
			</div>
			<div class="category Acc" id="Acc">
				<c:if test="${dto.acc !=null }">
					<img src="${dto.acc}" class="categoryImg" onError="javascript:this.src='/imgs/shilouette/none.png'" id="accImg">
				</c:if>
			</div>
			<div class="imgBox">
				<p style="text-align: center; font-size: 15px; color: #bcbcbc">*
					옷을 클릭하면 카테고리 별 옷이 나옵니다.</p>
				<c:choose>
					<c:when test="${gender == 'W'}">
						<img src="/imgs/shilouette/woman.png" id="shilouette">
					</c:when>
					<c:otherwise>
						<img src="/imgs/shilouette/man.png" id="shilouette">
					</c:otherwise>
				</c:choose>
			</div>

		</div>
		<div class="form-wrapper styleInfo">
			<form id="modifyFrm" action="${pageContext.request.contextPath}/style/modifyProc" method="post">
				<input type="hidden" name="no" value="${dto.no}"> <input
					type="hidden" name="email" value="${email}"> <input
					type="hidden" name="top" id="topHidden"> <input
					type="hidden" name="pants" id="pantsHidden"> <input
					type="hidden" name="shoes" id="shoseHidden"> <input
					type="hidden" name="acc" id="accHidden">
				<div class="row">
					<div class="col-12 p-5">
						<label for="InputName">Style Name</label> <input type="text"
							class="form-control" name="name" id="InputName"
							value="${dto.name}">
					</div>
					<div class="col-12 pl-5 pb-5">
						<label>Season</label>
						<div style="padding-left: 30px;">
							<div class="btn-group-toggle" data-toggle="buttons">
								<label class="btn checkLabel" id="springLabel"> <input
									type="checkbox" name="season" class="checkList" id="spring"
									value="spring"> spring
								</label> <label class="btn checkLabel" id="summerLabel"> <input
									type="checkbox" name="season" class="checkList" id="summer"
									value="summer"> summer
								</label> <label class="btn checkLabel" id="fallLabel"> <input
									type="checkbox" name="season" class="checkList" id="fall"
									value="fall"> fall
								</label> <label class="btn checkLabel" id="winterLabel"> <input
									type="checkbox" name="season" class="checkList" id="winter"
									value="winter"> winter
								</label>
							</div>
						</div>
					</div>
					<div class="col-12 pl-5 pb-5 pr-5">
						<label for="InputMemo">Memo</label>
						<textarea class="form-control"
							style="height: 150px; resize: none;" id="InputMemo" name="memo">${dto.memo}</textarea>
					</div>
				</div>
				<div class="row">
					<div class="col-12 pl-5 pb-5 pr-5">
						<span class="m-1" style="float: right;">
							<button type="button" id="styleModifyBtn"
								class="btn btn-secondary">수정하기</button>
						</span> <span class="m-1" style="float: right;">
							<button type="button" id="styleDeleteBtn"
								class="btn btn-secondary">삭제하기</button>
						</span>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<script>
		$("#styleDeleteBtn").on("click",function(){
			var result = confirm("정말 삭제 하시겠습니까?");
			
			if(result){
				location.href="${pageContext.request.contextPath}/style/styleDelete?no="+${dto.no};
			}
		})
	</script>

	<c:forEach items="${season}" var="sea">
		<script>
			$("input[name=season]").each(
					function() {
						console.log($(this).val());
						console.log("받아온 계절"+'${sea}');
						if ($(this).val() == '${sea}') {
							$(this).prop("checked", true);
							$("#" + '${sea}' + "Label").css("background",
									"dimgrey").css("border",
									"2px solid dimgrey");
						}
					});
		</script>
	</c:forEach>
	<script>
		//코디 등록하기
		$("#styleModifyBtn").on("click", function() {
			var topSrc = $(".Top").children("img").attr("src");
			var pantsSrc = $(".Pants").children("img").attr("src");
			var shoseSrc = $(".Shoes").children("img").attr("src");
			var accSrc = $(".Acc").children("img").attr("src");

			$("#topHidden").val(topSrc);
			$("#pantsHidden").val(pantsSrc);
			$("#shoseHidden").val(shoseSrc);
			$("#accHidden").val(accSrc);

			$("#modifyFrm").submit();

		})
	</script>
	<script>
		//계절 선택
		$(".checkList").on(
				"change",
				function() {
					var checkid = $(this).attr("id");
					if ($(this).prop("checked")) {
						$("#" + checkid + "Label").css("background", "dimgrey")
								.css("border", "2px solid dimgrey");
					} else {
						$("#" + checkid + "Label")
								.css("background", "darkgrey").css("border",
										"none");
					}
				})
	</script>

	<!-- 코디 시키기 이벤트 -->
	<script>
		// 카테고리 아이디
		var cid = "Top";

		// 메뉴 초기화
		var divInit = function() {
			$(".categoryMenu").html("");

			var title = $("<div class='categoryTitle'>");
			title.html(cid).css("font-size", "28px").css("font-weight", "700");
			$(".categoryMenu").append(title);
			var div = $("<div class='noneDiv'>");
			var img = $("<img src='/imgs/shilouette/none.png'>")
			div.append(img);
			$(".categoryMenu").append(div);
		}

		// 동적 바인딩 이벤트 (끌어온 이미지 클릭 이벤트) 
		$("body").on("click", ".categoryImgDiv", function() {
			var src = $(this).children("img").attr("src");
			var img = $("<img class='loadImg' id='"+cid+"Img'>");
			img.attr("src", src);

			$("." + cid).css("opacity", "0.9").css("line-height", "0px");
			$("." + cid).html(img);

		})

		// 카테고리 로고 띄워주기
		$("body").on(
				"click",
				".noneDiv",
				function() {
					var height = $("." + cid).css("height");
					$("." + cid).html("");
					$("." + cid).text(cid).css("opacity", "0.7").css(
							"line-height", height);
				})

		// 카테고리 클릭이나 옷장 변경 시  실행되는 ajax
		var selectDressAll = function(category, closet) {
			$.ajax({
				url : "${pageContext.request.contextPath}/style/selectCategoryProc",
				data : {
					category : category,
					c_no : closet
					},
					dataType : "json"
					}).done(function(data) {
						for (i = 0; i < data.length; i++) {
							var div = $("<div class='categoryImgDiv'>");
							var img = $("<img>");
							img.attr("src", data[i].file);
							div.append(img);
							$(".categoryMenu").append(div);
							}
						}).fail(function() {
							console.log("fail");
						})
				}
		// 옷장 변경 이벤트
		var changeClosetSelect = function() {

			divInit();

			var closet = $("#closet option:selected").val();
			console.log(closet);
			if (cid == "none") {
				cid = "Top";
			}
			selectDressAll(cid, closet);

		}

		// 카테고리 div 클릭 이벤트
		$(".category").on("click", function() {

			cid = $(this).attr("id");
			var closet = $("#closet").val();

			divInit();

			selectDressAll(cid, closet);

			$(".categoryMenu").css("opacity", "0").animate({'opacity' : '1'}, 300);

		});
	</script>

</body>
</html>