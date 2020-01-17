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
/*    div{border: 1px solid black;}*/
   *{box-sizing: border-box;font-family: 'Noto Sans KR', sans-serif;}
    #bk{background-image:url('/imgs/bg/bg8.jpg');background-attachment: fixed; }
    #bottom{width: 100%;color:white;background: #5e5e5e; height: 150px;}
    #bottom-logo{height: 150px; line-height: 150px;}
    #bottom-contents{font-size: 10pt;color: white;}
    .bar{position:relative; width: 30px;height: 3px;background: dimgray;}
    #title{font-size: 30px;color:dimgray;font-weight: 700;line-height: 100px;}
    #menuDiv{position:fixed;width: 100%;height: 100%;background: grey;z-index: 2;background: rgba(0,0,0,0.5); display: none;}
    .InfoMenu {position:fixed;width: 380px; height: 100%;background: white; z-index: 3}
    .navigator {background-color:white; border-bottom: 1px solid #bcbcbc;height:100px;}
    #menuIcon{ margin-top: 43px;}
    .menu{width: 100%;height: 100%;position:fixed;display: none;z-index: 5;}
    .menubar{ background-color: white;}
    .mainblock{ background: rgba(0,0,0,0.5);}
    #menu-nickname {width:100%;height: 200px;line-height: 200px;font-size: 30pt;}
    #boast{border: 1px solid white;border-radius: 10px;position: absolute;background:rgba(255,255,255,0.9);width: 1000px;height: 300px;transform: translate(44%,40%);}
    #boastTitle{font-size: 40pt;font-weight: 800;}
    #searchBox>div{border: 1px solid black; border-radius: 5px; width:90px;}
    #searchBar{width: 95%; height: 80%; margin-top:10px; display: none;}
    .borderDelete{border: 0px;}
    #boast>div>div>p{font-size: 20pt; font-weight: 800;}
    .boardItem{display: none;}
    .img-top{height: 50%;}
    .img-bottom{height: 50%;}
    .card-img-box{height: 300px;}
    #load{display:none;}
</style>
<script>
	$(function() {
		console.log($(".boardItem:hidden").length)
		console.log($(".boardItem").length)
		// 숨겨진 아이템이 1개 이상일 때 버튼 생성
		if($(".boardItem").length == 9) {
			$("#load").css("display","inline-block");
		}
		$(".boardItem").slice(0, 8).show(); // 8 개까지 먼저 출력
		$(this).css("display", "flex");
		$("#load").click(function(e) { // click event for load more
			e.preventDefault();
			$(".boardItem:hidden").slice(0, 4).show(); // 클릭 할 때 마다 4개씩 더 출력
			if ($(".boardItem:hidden").length == 0) { // check if any hidden divs still exist
				$(this).css("display", "none");
			}
		});
	});
</script>
    </head>
    <body>
<c:choose>
<c:when test="${email ==null }">
	로그인을 하십시오.
</c:when>
<c:otherwise>
    <!-- 숨김 메뉴 -->
	<jsp:include page="../../standard/hideMenu.jsp"/>
	<!-- 본문 -->
	<div class="container-fuild p-0" id="bk">
		<!-- 네비 -->
		<div class="navigator fixed-top row m-0">
			<div class="col-1 p-0" id="btnMenu">
				<div class="row m-0">
					<div class="col-4 p-0">
						<div class="row m-0">
							<div class="col-12" id="menuIcon">
								<div class="row m-0 mb-1 bar bar-one"></div>
								<div class="row m-0 mb-1 mt-1 bar bar-two"></div>
								<div class="row m-0 mb-1 bar bar-three"></div>
							</div>
						</div>
					</div>
					<div class="col-8 p-0 text-center d-none d-md-block"
						style="height: 100px; line-height: 100px;">
						<span style="font-size: 20pt; font-weight: 700; color: dimgray;">MENU</span>
					</div>
				</div>
			</div>
			<div class="col-10 p-0 d-none d-md-block text-center">
				<span id="title">SHOW YOUR CLOSET</span> <input type="text"
					class="form-control" id="searchBar" name="target"
					placeholder="검색할 단어를 입력하세요">
			</div>
			<div id="searchBox" class="col-1 p-0 m-0">
				<div class="row" style="margin-top: 4px;">
					<div id="btnSearch" class="col-12 p-0">
						<img class="w-100" src="/imgs/btn/btnSearch.png">
					</div>
					<div id="btnCloseSearch" class="col-12 p-0"
						style="background-color: black; display: none;">
						<img class="p-3 w-100" src="/imgs/btn/btnSearchClose.png">
					</div>
				</div>
			</div>
		</div>
		<!-- 상단 설명 -->
		<div class="row m-0" style="height: 600px;">
			<div class="col-12">
				<!-- 위 메뉴 공백 채우기 -->
				<div class="row" style="margin-top: 100px;"></div>
				<div class="col-12">
					<div class="row">
						<div class="col-12" id="boast">
							<div class="row">
								<div class="col-12 mt-4 text-center" id="boastTitle">
									<span style="color: indianred">S</span>tyle <span
										style="color: darkred">B</span>oast
								</div>
							</div>
							<div class="row mt-4">
								<div class="col-12 text-center">
									<p class="mt-3">
										당신의 <span style="color: indianred">스타일</span>을
									</p>
									<p>
										<span style="color: darkred">자랑</span>해 보세요!
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 게시글 주루룩 -->
		<div class="row m-0 bg-white">
			<div class="col-12">
				<div class="row">
					<!-- 아이템 4개 씩 출력 -->
					<div class="col-9 m-auto">
						<div class="row card-deck m-auto" id="boardList">
						<c:choose>
						<c:when test="${styleList.size() <= 0}">
							등록된 게시물이 없습니다.
						</c:when>
						<c:otherwise>
							<c:forEach items="${styleList}" var="style">
							<!-- 반복 시작 -->
							<div class="col-3 mb-4 mt-4 boardItem">
								<div class="card">
									<div class="card-img-box">
										<c:choose>
											<c:when test="${style.top == null}">
												<div class="card-img-top img-top" style="background: white;"></div>
											</c:when>
											<c:otherwise>
												<img src="${style.top}" class="card-img-top w-100 img-top">
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${style.pants == null}">
												<div class="card-img-top img-bottom" style="background: white;"></div>
											</c:when>
											<c:otherwise>
												<img src="${style.pants}" class="card-img-top w-100 img-bottom">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="card-body"><hr>
										<h5 class="card-title text-center">${style.name}</h5>
										<p class="card-text text-right">
											<span style="font-weight: 800;">1234</span>&nbsp;&nbsp;<img src="/imgs/btn/like_after.png" style="width: 20px;" class="pb-1">
										</p>
									</div>
								</div>
							</div>
							</c:forEach>
							<!-- -->
						</c:otherwise>
						</c:choose>
							<!-- 더 보기 버튼 -->
							<div class="col-12 mb-3 text-center">
								<a id="load" class="btn btn-outline-dark">Load More</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 푸터 -->
    <jsp:include page="../../standard/boardFooter.jsp" />
    
    <script>        
        $("#btnMenu").on("click",function(){
            $(".menu").css("display","flex");
            $(".navigator").css("z-index","1");
        })
        $(".mainblock").on("click",function(){
            $(".menu").css("display","none");
        })
        $("#closeMenu").on("click",function(){
            $(".menu").css("display","none");
        })
        $("#btnSearch").on("click",function(){
            $("#btnCloseSearch").css("display","flex");
            $("#btnSearch").css("display","none");
            $("#searchBar").css("display","inline-block");
            $("#title").css("display","none");
        })
        $("#btnCloseSearch").on("click",function(){
            $("#btnSearch").css("display","flex");
            $("#btnCloseSearch").css("display","none");
            $("#searchBar").css("display","none");
            $("#title").css("display","inline");
        })
    </script>
</c:otherwise>
</c:choose>
    </body>
</html>