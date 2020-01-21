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
/*    div{border: 1px solid black;}*/
	.container-fulid {width: 1890px;max-width: none !important;}
    *{box-sizing: border-box;font-family: 'Noto Sans KR', sans-serif;}
    
    #menuIcon{ margin-top: 17px;}
    .bar{position:relative; width: 30px;height: 3px;background: dimgray;}
    #menuText{ line-height: 50px; }
    #bTitle{font-size: 15px;color:dimgray;font-weight: 700;line-height: 50px;}
    #categoryTab{width: 20%; height: 100%;display:inline-block; font-weight: 800;}
    #categoryBar{height: 80%;}
    #searchBar{width: 20%; height: 100%; display: none; font-weight: 800; line-height: 50px; margin-top: 6px;}
    #toSearch{height: 100%; font-weight: 800;display: none; margin-bottom:5px;}
    
    .InfoMenu {position:fixed;width: 380px; height: 100%;background: white; z-index: 3}
   	#title{font-size: 30px;color:dimgray;font-weight: 700;line-height: 100px;}
    .navigator {background-color:white; border-bottom: 1px solid #bcbcbc;height:50px;}
    .menu{width: 100%;height: 100%;position:fixed;display: none;z-index: 5; top:0px;}
    .menubar{ background-color: white;}
    .mainblock{ background: rgba(0,0,0,0.5);}
    #menu-nickname {width:100%;height: 200px;line-height: 200px;font-size: 30pt;}
    #bottom{width: 100%;color:white;background: #5e5e5e; height: 150px;}
    #bottom-logo{height: 150px; line-height: 150px;}
    #bottom-contents{font-size: 10pt;color: white;}
    #searchBox>div{border: 1px solid black; border-radius: 5px; width:90px;}
    .borderDelete{border: 0px;}
    #dressStyle{height: 800px;}
    #dressInfo{height: 800px; font-size: 10pt; font-weight: 800; display: none;}
    #dressInfoBlock{height: 800px;background-color: dimgray; opacity: 0.4;font-weight: 800;line-height: 800px;font-size: 20pt;}
    #dressTop{background:rgba(100,100,100,0.5); position:absolute; border-radius: 20px; top:130px; left: 158px; width: 200px; height: 200px; color: white;}
    #dressPants{background:rgba(100,100,100,0.5); position:absolute; border-radius: 20px; top:340px; left: 158px; width: 200px; height: 200px; color: white;}
    #dressShoes{background:rgba(100,100,100,0.5); position:absolute; border-radius: 20px; top:550px; left: 158px; width: 200px; height: 150px; color: white;}
    #dressAcc{background:rgba(100,100,100,0.5); position:absolute; border-radius: 20px; top:350px; left: 10px; width: 130px; height: 130px; color: white;}
    #dressImg{height: 400px; margin-top: 60px;}
    .dImgs{width:100%;height:100%;opacity:0.8;border-radius:20px;}
    .btnLike:hover{cursor:pointer}
    #comments{border:1px solid lightgray;border-radius: 5px;}
    .space{margin-top:80px;margin-bottom:25px; margin-left:0px; margin-right:0px;}
</style>
</head>
<body>
    <c:choose>
    <c:when test="${email == null}">
    	<script>
    		alert("로그인 하세요");
    		location.href="${pageContext.request.contextPath}/";
    	</script>
    </c:when>
    <c:otherwise>
	<!-- 숨김 메뉴 -->
	<jsp:include page="../../standard/hideMenu.jsp"/>
	<!-- 본문 -->
    <div class="container-fulid p-0">
		<!-- 네비 -->
		<div class="navigator fixed-top row m-0">
			<div class="col-1 p-0" id="btnMenu">
				<div class="row m-0" id="menuItem">
					<div class="col-4 p-0">
						<div class="row m-0">
							<div class="col-12" id="menuIcon">
								<div class="row m-0 mb-1 bar bar-one"></div>
								<div class="row m-0 mb-1 mt-1 bar bar-two"></div>
								<div class="row m-0 mb-1 bar bar-three"></div>
							</div>
						</div>
					</div>
					<div class="col-8 p-0 text-center d-none d-md-block" id="menuText">
						<span style="font-weight: 700; color: dimgray;">MENU</span>
					</div>
				</div>
			</div>
			<div class="col-10 p-0 d-none d-md-block text-center">
				<span id="bTitle">BOAST BOARD</span>
			</div>
			<div id="searchBox" class="col-1 p-0 m-0"></div>
		</div>
            <!-- 본문 -->
            <div class="row space">
                <div class="col-6 m-auto">
                    <div class="row">
                    <!-- 옷 이미지 -->
                        <div class="col-6 p-0 card" id="dressStyle">
                        	<c:choose>
                        	<c:when test="${gender == 'M'}">
                        		<img src="/imgs/shilouette/man.png" class="card-img pl-5">
                        	</c:when>
                        	<c:otherwise>
                        		<img src="/imgs/shilouette/woman.png" class="card-img pl-5">
                        	</c:otherwise>
                        	</c:choose>
                            
                            <div class="row m-0">
                            <c:choose>
	                            <c:when test="${style.top == null}">
	                            	<div class="col-12 text-center" id="dressTop" style="line-height:200px;">Top</div>
	                            </c:when>
	                            <c:otherwise>
	                            	<div class="col-12 p-0 text-center items" id="dressTop">
	                            		<img src="${style.top}" class="dImgs" id="${style.top}">
	                            	</div>
	                            </c:otherwise>
                            </c:choose>
                            </div>
                            <div class="row m-0">
                            <c:choose>
	                            <c:when test="${style.pants == null}">
	                            	<div class="col-12 text-center" id="dressPants" style="line-height:200px;">Pants</div>
	                            </c:when>
	                            <c:otherwise>
	                            	<div class="col-12 p-0 text-center items" id="dressPants">
	                            		<img src="${style.pants}" class="dImgs" id="${style.pants}">
	                            	</div>
	                            </c:otherwise>
                            </c:choose>
                            </div>
                            <div class="row m-0">
                            <c:choose>
	                            <c:when test="${style.shoes == null}">
	                            	<div class="col-12 text-center" id="dressShoes" style="line-height:150px;">Shoes</div>
	                            </c:when>
	                            <c:otherwise>
	                            	<div class="col-12 p-0 text-center items" id="dressShoes">
	                            		<img src="${style.shoes}" class="dImgs" id="${style.shoes}">
	                            	</div>
	                            </c:otherwise>
                            </c:choose>
                            </div>
                            <div class="row m-0">
                            <c:choose>
	                            <c:when test="${style.acc == null}">
	                            	<div class="col-12 text-center" id="dressAcc" style="line-height:130px;">Acc</div>
	                            </c:when>
	                            <c:otherwise>
	                            	<div class="col-12 p-0 text-center items" id="dressAcc">
	                            		<img src="${style.acc}" class="dImgs" id="${style.acc}">
	                            	</div>
	                            </c:otherwise>
                            </c:choose>
                            </div>
                        </div>
					<!-- 옷 정보 -->
					<div class="col-6 card p-0" id="dressInfo">
						<div class="row m-0">
							<div class="col-12 p-4" id="dressImg">
								<img src="" id="imgDetail" class="p-0" style="width: 100%; height: 100%;">
							</div>
						</div>
						<div class="row m-0">
							<div class="col-12">
								<div class="row">
									<div class="col-3 text-center align-self-center">
										<label for="category" class="m-0">카테고리</label>
									</div>
									<div class="col-9">
										<input id="category" name="category" type="text" class="form-control bg-white" readonly>
									</div>
								</div>
								<div class="row mt-2">
									<div class="col-3 text-center align-self-center">
										<label for="name" class="m-0">옷 이름</label>
									</div>
									<div class="col-9">
										<input id="name" name="name" type="text" class="form-control bg-white" readonly>
									</div>
								</div>
								<div class="row mt-2">
									<div class="col-3 text-center">
										<label for="" class="m-0 ">계절</label>
									</div>
									<div class="col-9 text-center">
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="checkbox" name="season"
												id="spring" value="spring" disabled> <label
												class="form-check-label" for="spring">봄</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="checkbox" name="season"
												id="summer" value="summer" disabled> <label
												class="form-check-label" for="summer">여름</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="checkbox" name="season"
												id="fall" value="fall" disabled> <label
												class="form-check-label" for="fall">가을</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="checkbox" name="season"
												id="winter" value="winter" disabled> <label
												class="form-check-label" for="winter">겨울</label>
										</div>
									</div>
								</div>
								<div class="row mt-2">
									<div class="col-3 text-center align-self-center">
										<label for="memo" class="m-0">메모</label>
									</div>
									<div class="col-9">
										<textarea name="memo" id="memo" rows="5"
											class="form-control bg-white" style="resize: none;" readonly></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 처음 페이지 접근시 생성 -->
					<div class="col-6 card p-0 text-center" id="dressInfoBlock">
					    <span style="color:white;">옷을 선택해 주세요</span>
					</div>
				</div>
				<!-- 계절 -->
				<div class="row mt-3">
	                <div class="col-12 text-center">
						<div class="btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-sm btn-outline-dark borderDelete" id="Sspring">
								<input type="checkbox" name="Sseason" value="spring" disabled><span style="font-weight:800;">봄</span>
							</label>
							<label class="btn btn-sm btn-outline-dark borderDelete" id="Ssummer">
								<input type="checkbox" name="Sseason" value="summer" disabled><span style="font-weight:800;">여름</span>
							</label>
							<label class="btn btn-sm btn-outline-dark borderDelete" id="Sfall">
								<input type="checkbox" name="Sseason" value="fall" disabled><span style="font-weight:800;">가을</span>
							</label>
							<label class="btn btn-sm btn-outline-dark borderDelete" id="Swinter">
								<input type="checkbox" name="Sseason" value="winter" disabled><span style="font-weight:800;">겨울</span>
							</label>
						</div>
					</div>
				</div>
				<!-- 글 수정 -->
				<form action="${pageContext.request.contextPath}/board/boastModifyProc" method="post" id="boastModifyProcFrm">
					<input type="hidden" name="no" value="${boast.no}">
					<div class="row mt-3">
						<div class="col-12 p-0">
							<div class="row">
								<div class="col-12 text-center">
									<input id="bTitle" name="bTitle" type="text" class="form-control bg-white borderDelete p-0" value="${boast.title}">
								</div>
							</div><hr class="m-0">
							<div class="row mt-2">
								<div class="col-6 text-left align-self-center">
									<label for="" class="m-0" style="font-weight:800;">${boast.nickname}</label>
								</div>
								<div class="col-6 text-right align-self-center">
									<label for="" class="m-0" style="font-weight:800;">${boast.write_date}</label>
								</div>
							</div><hr class="m-0 mt-2">
							<div class="row mt-2">
								<div class="col-12">
									<textarea name="contents" id="contents" rows="15" class="form-control bg-white borderDelete p-0" style="resize: none;">${boast.contents}</textarea>
								</div>
							</div><hr class="m-0">
							<div class="row mt-2">
								<div class="col-6 text-left">
									<button id="toBack" type="button" class="btn btn-sm btn-outline-dark">돌아가기</button>
									<button id="toBoastModify" type="button" class="btn btn-sm btn-outline-dark">수정</button>
								</div>
								<div class="col-6 text-right">
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
            </div>
            <!-- 푸터 -->
			<jsp:include page="../../standard/boardFooter.jsp"/>			
    </div>
    <c:forEach items="${season}" var="season">
    	<script>
	    	$("input[name=Sseason]").each(function(){
	            if($(this).val() == '${season}') {
	                $(this).prop("checked",true);
	                $("#S${season}").addClass("active");
	            }
	        });
    	</script>
    </c:forEach>
    <script>
    	$("#toBoastModify").on("click",function(){
			$("#boastModifyProcFrm").submit();
    	});
    	$("#toBack").on("click",function(){
    		history.back();
    	});
    	$(".dImgs").on("click",function(){
    		console.log($(this).attr("id"));
    		$.ajax({
    			url:"${pageContext.request.contextPath}/board/selectDressInfo",
    			method:"POST",
    			data:{
    				path:$(this).attr("id")
    			},
    			dataType:"json"
    		}).done(function(data){
    			$("#dressInfoBlock").css("display","none");
    			$("#dressInfo").css("display","block");
    			var cd = data[0].dressInfo.category;
    			var category = "";
    			    			    			
    			if(cd == 'Top') { category = '상의' }
    			else if(cd == 'Pants') { category = '하의' }
    			else if(cd == 'Shoes') { category = '신발' }
    			else { category = '액세서리' }
    			
    			$("#imgDetail").attr("src",data[0].dressImg.path);
    			$("#category").val(category);
    			$("#name").val(data[0].dressInfo.name);
    			$("#memo").val(data[0].dressInfo.memo);
				
    			// 체크 하기전에 상태 초기화
    			$("input[name=season]").each(function(){
    	            $(this).prop("checked",false);
    	        });
    			// 맞는 값 체크
    			for(var i = 0;i < data[0].season.length; i++) {
    				if($("#"+data[0].season[i]).val() == data[0].season[i]) {
    					$("#"+data[0].season[i]).prop("checked",true);
    				}
    			}
    		}).fail(function(data){
    			console.log("실패")
    		});
    	})
        $("#btnMenu").on("click",function(){
            $(".menu").css("display","flex");
            $(".navigator").css("z-index","1");
        });
        $(".mainblock").on("click",function(){
            $(".menu").css("display","none");
        });
        $("#closeMenu").on("click",function(){
            $(".menu").css("display","none");
        });
        $("#btnSearch").on("click",function(){
            $("#btnCloseSearch").css("display","flex");
            $("#btnSearch").css("display","none");
            $("#categoryBar").css("display","inline-block");
            $("#title").css("display","none");
            $("#menuItem").css("display","none");
        });
        $("#btnCloseSearch").on("click",function(){
            $("#btnSearch").css("display","flex");
            $("#btnCloseSearch").css("display","none");
            $("#categoryBar").css("display","none");
            $("#title").css("display","inline");
            $("#menuItem").css("display","flex");
        });
    </script>
    </c:otherwise>
    </c:choose>
</body>
</html>