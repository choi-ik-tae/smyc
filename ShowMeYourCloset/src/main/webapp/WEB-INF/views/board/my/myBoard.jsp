<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	.container-fluid {width: 1903px;max-width: none !important;}
   *{box-sizing: border-box;font-family: 'Noto Sans KR', sans-serif;}
    #bk{background-image:url('/imgs/bg/bg10.jpg');background-attachment: fixed;}
    #bottom{width: 100%;color:white;background: #5e5e5e; height: 150px;}
    #bottom-logo{height: 150px; line-height: 150px;}
    #bottom-contents{font-size: 10pt;color: white;}
    /* 숨김메뉴 */
    .menu{width: 1903px;height: 100%;position:fixed;display: none;z-index: 5;}
    .menubar{ background-color: white;}
    .mainblock{ background: rgba(0,0,0,0.5);}
    #menu-nickname {width:100%;height: 200px;line-height: 200px;font-size: 30pt;}
    /* 자랑게시판 상단 */
    #boast{border: 1px solid white;border-radius: 10px;position: absolute;background:rgba(255,255,255,0.9);width: 1000px;height: 300px;transform: translate(44%,40%);}
    #boastText{font-size: 20pt; font-weight: 800;line-height: 300px;}
    .borderDelete{border: 0px;}
    #boast>div>div>p{font-size: 20pt; font-weight: 800;}
    .boardItem{display: none;}
    .boardItem:hover{cursor:pointer;}
    .img-top{height: 50%; max-width:240px;}
    .img-bottom{height: 50%; max-width:240px;}
    .card-img-box{height: 300px;}
    #load{display:none;}    
    .contents{cursor:pointer;}
    /* 네비바 */
    #title{font-size: 15px;color:dimgray;font-weight: 700;line-height: 100px;width: 1903px;}
    .navigator {background-color:white; border-bottom: 1px solid #bcbcbc;height:50px;}
    #bTitle{font-size: 15px;color:dimgray;font-weight: 700;line-height: 50px;}
    #categoryTab{width: 20%; height: 100%;display:inline-block; font-weight: 800;}
    #categoryBar{height: 80%;}
    #searchBar{width: 20%; height: 100%; display: none; font-weight: 800; line-height: 50px; margin-top: 6px;}
    #toSearch{height: 100%; font-weight: 800;display: none; margin-bottom:5px;}
   	#menuIcon{ margin-top: 17px;}
    .bar{position:relative; width: 30px;height: 3px;background: dimgray;}
    #menuText{ line-height: 50px; }
    #btnMenu:hover{cursor:pointer;}
    .line{border: 1px solid lightgray;}
</style>
<script>
	$(function() {
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
	<script>
		alert("로그인을 해주세요");
		location.href="${pageContext.request.contextPath}/";
	</script>
</c:when>
<c:otherwise>
    <!-- 숨김 메뉴 -->
	<jsp:include page="../../standard/hideMenu.jsp"/>
	<!-- 본문 -->
	<div class="container-fluid p-0" id="bk">
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
					<div class="col-8 p-0 text-center d-none d-md-block">
						<span id="menuText" style="font-weight: 700; color: dimgray;">MENU</span>
					</div>
				</div>
			</div>
			<div class="col-10 p-0 d-none d-md-block text-center">
                <div class="row m-0">
	                <div class="col-12" id="categoryBar">
	                	<span id="bTitle" class="mr-3">MY BOARD</span>
                        <input type="text" class="form-control" id="searchBar" name="target" placeholder="검색할 단어를 입력하세요">
                        <button id="toSearch" type="button" class="btn btn btn-outline-dark">검색</button>
	                </div>
            	</div>
			</div>
			<div id="searchBox" class="col-1 p-0 m-0">
				<div class="row" style="margin-top: 4px; border:0px;">
					<div id="btnSearch" class="col-12 p-0">
						<img src="/imgs/btn/btnSearch.png" style="width: 40px; border-radius: 5px;">
					</div>
					<div id="btnCloseSearch" class="p-0" style="background-color: black; display: none;width: 40px; border-radius: 5px;">
						<img src="/imgs/btn/btnSearchClose.png" class="p-1" style="width: 40px;">
					</div>
				</div>
			</div>
		</div>
		<!-- 상단 설명 -->
		<div class="row m-0" style="height: 300px;">
			<div class="col-12">
				<!-- 위 메뉴 공백 채우기 -->
				<div class="row" style="margin-top: 50px;"></div>
				
			</div>
		</div>
		<!-- 게시글 주루룩 -->
        <div class="row m-0 bg-white">
        	<div class="col-12">
        		<div class="row">
        			<div class="col-7 m-auto">
        				<div class="row mt-5">
        					<div class="col-12" style="font-size:30px; font-weight:700; text-align:center;">
        						HELP BOARD
        						<hr class="mt-0" style="width:300px;">
        					</div>
        				</div>
        				<div class="row" style="height: 40px; line-height: 35px; border-top : 1px solid #bcbcbc; border-bottom: 1px solid #bcbcbc;font-size:17px; font-weight:600;">
	                        <div class="d-none d-md-block col-md-1">
	                            NO
	                        </div>
	                        <div class="col-8 col-sm-7 col-md-6">
	                            TITLE
	                        </div>
	                        <div class="col-4 col-sm-3 col-md-2">
	                            NICKNAME
	                        </div>
	                        <div class="d-none d-sm-block col-sm-2 col-md-1">VIEW</div>
	                        <div class="d-none d-md-block col-2">DATE</div>
                   	 	</div>
                   	 	
                   	 	<c:choose>
                   	 		<c:when test="${helpList.size() == null || helpList.size() == 0}">
                   	 			<div class="row">
                   	 				<div class="col-12  mt-3 mb-3" style="text-align:center; font-weight:700;">
                   	 					<span>작성한 도움 글이 없습니다.</span>
                   	 				</div>
                   	 			</div>
                   	 		</c:when>
                   	 		<c:otherwise>
                   	 			<c:forEach items="${helpList}" var="dto">
				                    <div class="row contents mt-2 mb-2" style="border-radius:10px;" onclick="detailHelp(${dto.no})">
				                        <div class="d-none d-md-block col-md-1">
				                            ${dto.no}
				                        </div>
				                        <div class="col-8 col-sm-7 col-md-6" style="text-align: left;">
				                            ${dto.title}
				                        </div>
				                        <div class="col-4 col-sm-3 col-md-2">
				                            ${dto.nickname }
				                        </div>
				                        <div class="d-none d-sm-block col-sm-2 col-md-1">${dto.views}</div>
				                        <div class="d-none d-md-block col-2">${dto.write_date}</div>
				                    </div>
		                    
		                    	</c:forEach>
                   	 		</c:otherwise>
                   	 	</c:choose>
                   	 	
        			</div>
        		</div>
        		<div class="row mb-5">
        			<div class="col-9 m-auto">
        				<div class="row">
        					<div class="col-12 " style="font-size:30px; font-weight:700; text-align:center; margin-top: 130px;">
        						<span>BOAST BOARD</span>
        						<hr class="mt-0" style="width:300px;">
        					</div>
        				</div>
						<div class="row card-deck m-auto" id="boardList">
        				<c:choose>
						<c:when test="${boastList.size() <= 0}">
					
                   	 		<div class="col-12 mt-3 mb-3" style="text-align:center; font-weight:700;">
                   	 			<span>작성한 자랑 글이 없습니다.</span>
                   	 		</div>
                   	 		
						</c:when>
						<c:otherwise>
							<c:forEach var="i" begin="0" end="${boastList.size() - 1}">
							<!-- 반복 시작 -->
							<div class="col-3 mb-4 mt-4 boardItem" id="boast${boastList.get(i).no}">
								<div class="card">
									<div class="card-img-box" style="text-align:center;">
										<c:choose>
											<c:when test="${styleList.get(i).top == null}">
												<div class="card-img-top img-top" style="background: white;"></div>
											</c:when>
											<c:otherwise>
												<img src="${styleList.get(i).top}" class="card-img-top img-top">
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${styleList.get(i).pants == null}">
												<div class="card-img-top img-bottom" style="background: white;"></div>
											</c:when>
											<c:otherwise>
												<img src="${styleList.get(i).pants}" class="card-img-top img-bottom">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="card-body"><hr>
										<h5 class="card-title text-center">${boastList.get(i).title}</h5>
										<p class="card-text text-right">
											<span style="font-weight: 800;">${likeList.get(i)}</span>&nbsp;&nbsp;<img src="/imgs/btn/like_after.png" style="width: 20px;" class="pb-1">
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
    
   
    <form action = "${pageContext.request.contextPath}/board/boastDetailView" method="post" id="detailFrm">
    	<input type="hidden" name="Dtarget" id="detailTarget" value="">
    	<input type="hidden" name="back" value="my">
    </form>
    <form action="${pageContext.request.contextPath}/board/helpDetail" method="post" id="helpdetailFrm">
        <input type="hidden" name="no" id="no">
        <input type="hidden" name="target" value="my">
     </form>
    <script>    	
	    var detailHelp = function(no){
	    	console.log(no)
	  		$("#no").val(no);
 	  		$("#helpdetailFrm").submit();
	  	}
	    $("#btnMenu").on("mouseover",function(){
	        $(".bar").css("background-color","black");
	        $("#menuText").css("color","black");
	    });
	    $("#btnMenu").on("mouseout",function(){
	        $(".bar").css("background-color","dimgray");
	        $("#menuText").css("color","dimgray");
	    });
	    $("#categoryTab").on("change",function(){
	    	$("#AlignTarget").val($("#categoryTab option:selected").val());
	    	$("#alignFrm").submit();
		});
    	$(".boardItem").on("click",function(){
    		$("#detailTarget").val($(this).attr("id"));
    		$("#detailFrm").submit();
    	});
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
            $("#toSearch").css("display","inline-block");
            $("#searchBar").css("display","inline-block");
            $("#bTitle").css("display","none");
            $("#categoryTab").css("display","none");
        });
        $("#btnCloseSearch").on("click",function(){
            $("#btnSearch").css("display","flex");
            $("#btnCloseSearch").css("display","none");
            $("#toSearch").css("display","none");
            $("#searchBar").css("display","none");
            $("#bTitle").css("display","inline-block");
            $("#categoryTab").css("display","inline-block");
        });
    </script>
</c:otherwise>
</c:choose>
</body>
</html>