<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<!-- 카카오톡 공유  -->
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- Bootstap4 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>
/*    div{border: 1px solid black;}*/
* {
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
}

#bottom {
	width: 100%;
	height: 150px;
	color: white;
}

#bottom-logo {
	height: 150px;
	line-height: 150px;
}

#bottom-contents {
	font-size: 10pt;
	color: white;
}

.bar {
	position: relative;
	width: 30px;
	height: 3px;
	background: dimgray;
}

#title {
	font-size: 30px;
	color: dimgray;
	font-weight: 700;
	line-height: 100px;
}

#menuDiv {
	position: fixed;
	width: 100%;
	height: 100%;
	background: grey;
	z-index: 2;
	background: rgba(0, 0, 0, 0.5);
	display: none;
}

.InfoMenu {
	position: fixed;
	width: 380px;
	height: 100%;
	background: white;
	z-index: 3
}

.navigator {
	background-color: white;
	border-bottom: 1px solid #bcbcbc;
	height: 100px;
}

#menuIcon {
	margin-top: 43px;
}

.menu {
	width: 100%;
	height: 100%;
	position: fixed;
	display: none;
	z-index: 5;
}

.menubar {
	background-color: white;
}

.mainblock {
	background: rgba(0, 0, 0, 0.5);
}

#menu-nickname {
	width: 100%;
	height: 200px;
	line-height: 200px;
	font-size: 30pt;
}

#boast {
	border: 1px solid white;
	border-radius: 10px;
	position: absolute;
	background: rgba(255, 255, 255, 0.9);
	width: 1000px;
	height: 300px;
	transform: translate(44%, 40%);
}

#boastTitle {
	font-size: 40pt;
	font-weight: 800;
}

#searchBox>div {
	border: 1px solid black;
	border-radius: 5px;
	width: 90px;
}

#searchBar {
	width: 95%;
	height: 80%;
	margin-top: 10px;
	display: none;
}

.borderDelete {
	border: 0px;
}

.gotoDetail {
	text-decoration: none;
	color: black;
	width: 100%;
	height: 100%;
}

.gotoDetail:hover {
	text-decoration: none !important;
	color: black;
}

.title {
	font-size: 28px;
	color: dimgray;
	font-weight: 700;
	line-height: 95px;
}
</style>

<body>

	<!-- 숨김 메뉴 -->
	<div class="container-fulid p-0">
		<div class="row m-0 menu">
			<div class="p-0 menubar" style="width: 23%;">
				<div class="row m-0">
					<div class="col-12 p-2">
						<button id="closeMenu" type="button"
							class="btn btn-outline-dark form-control">close</button>
					</div>
				</div>
				<div class="row m-0">
					<div class="col-12 text-center" id="menu-nickname">
						<c:choose>
							<c:when test="${email==null }">
								<span>로그인을 해주세요</span>
							</c:when>
							<c:otherwise>
								<span>${nick}</span>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<hr>
				<div class="row m-0">
					<div class="col-12">내 정보</div>
				</div>
				<hr>
				<div class="row m-0 myinfoMenu">
					<div class="col-12">
						<div class="row">
							<button type="button"
								class="btn borderDelete btn-outline-dark form-control">내가
								쓴 글</button>
						</div>
						<div class="row">
							<button type="button"
								class="btn borderDelete btn-outline-dark form-control">내가
								쓴 댓글</button>
						</div>
						<div class="row">
							<button type="button"
								class="btn borderDelete btn-outline-dark form-control">마이
								페이지</button>
						</div>
					</div>
				</div>
				<hr>
				<div class="row m-0">
					<div class="col-12">게시판</div>
				</div>
				<hr>
				<div class="row m-0">
					<div class="col-12">
						<div class="row">
							<button type="button"
								class="btn borderDelete btn-outline-dark form-control">메인
								페이지</button>
						</div>
						<div class="row">
							<button type="button"
								class="btn borderDelete btn-outline-dark form-control">자랑
								게시판</button>
						</div>
						<div class="row">
							<button type="button"
								class="btn borderDelete btn-outline-dark form-control">도움
								게시판</button>
						</div>
					</div>
				</div>
			</div>
			<div class="p-0 mainblock" style="width: 77%;"></div>
		</div>
	</div>
	<!-- 본문 -->
	<div class="container-fuild p-0">
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
			<div id="searchBox" class="col-1 p-0 m-0"></div>
		</div>
		<!-- 상단 설명 -->
		<div class="row m-0" style="height: 100px;"></div>
		<!-- 게시글 주루룩 -->
		<div class="row">
			<div class="col-12 col-md-6 form-title mt-4 mb-1 p-4"
				style="margin: auto; border-radius: 10px; border: 1px solid #bcbcbc;">
				<div class="row">
					<div class="col-12">
						<div class="titleDiv"
							style="border: 1px solid #bcbcbc; height: 40px; border-radius: 5px; text-align: center; line-height: 40px;">
							<span>${dto.title}</span>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<span style="float: right;">${dto.nickname}</span>

					</div>
				</div>
				<div class="row">
					<div class="col-12 mt-2">
						<div class="contentsDiv p-2"
							style="border: 1px solid #bcbcbc; min-height: 300px; border-radius: 5px; white-space: pre;">${dto.contents}</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12" style="font-size: 13px;">
						<span style="float:right" class="ml-2">조회수 ${dto.views }</span> 
						<span style="float:right">${dto.write_date } </span>
						<span style="float:center;"><a id="facebook-link-btn" href="javascript:shareFacebook()"><img src="/imgs/btn/facebookLogo.png" style="width:44px;"></a></span>
						<span>
							<a id="kakao-link-btn" href="javascript:shareKakaotalk()">
								<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" style="width:30px;"/>
							</a>
						</span>
					</div>
				</div>
				<div class="row">
					<div class="col-12 mt-2 mb-2" style="text-align: center;">
						<button id="styleComentBtn" class="btn btn-outline-info"
							style="width: 150px;">코디 도움</button>
						<button id="nomalComentBtn" class="btn btn-outline-info"
							style="width: 150px;">댓글</button>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<iframe class="commentDiv" id="commentFrm" src="${pageContext.request.contextPath}/advisor/helpStyleComent?b_no=${dto.no}&writer=${dto.email}" scrolling="no"style="border: 1px solid #bcbcbc; width: 100%; border-radius: 5px;"></iframe>
					</div>
				</div>

			</div>
			<form action="${pageContext.request.contextPath}/advisor/advisorUpload" id="hiddenFrm" name="hiddenFrm" method="post">
				<input type="hidden" name="writer">
				<input type="hidden" name="b_no">
            </form>
            <form action="${pageContext.request.contextPath}/advisor/detailAdvisor" id="detailFrm" name="detailFrm" method="post">
            	<input type="hidden" name="writer">
            	<input type="hidden" name="no">
            </form>
		</div>
		<!-- 상단 설명 -->
		<div class="row m-0" style="height: 50px;"></div>

		<div class="row m-0">
			<div class="col-12" id="bottom"
				style="background: #5e5e5e; height: 250px;">
				<div class="row mt-5" style="margin: auto;">
					<div class="col-2" id="bottom-logo">Show Your Closet</div>
					<div class="col-10 align-self-center" id="bottom-contents">
						<div class="row">서울 중구 남대문로 120 대일빌딩 3층 F Class (주) In Sync</div>
						<div class="row">Copyright © 2020 InSync Inc. 모든 권리 보유.</div>
						<div class="row">
							대표전화&nbsp;&#124;&nbsp;010-8854-8699&nbsp;&#124;&nbsp;010-8077-1131
						</div>
						<div class="row">
							<a href="#">개인정보 처리방침</a>&nbsp;&#124;&nbsp; <a href="#">약관</a>&nbsp;&#124;&nbsp;
							<a href="#">법적 고지</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
	    function shareKakaotalk() {
	        Kakao.init("76739d4448358439889bc56445fa8633");      // 사용할 앱의 JavaScript 키를 설정
	        Kakao.Link.sendDefault({
	              objectType:"feed"
	            , content : {
	                  title:"[SHOW YOUR CLOSET]"  // 콘텐츠의 타이틀
	                , description:"${dto.nickname}의 코디를 도와주세요!"   // 콘텐츠 상세설명
	                , imageUrl:"/imgs/shilouette/default_tshirt.png"   // 썸네일 이미지
	                , link : {
	                      mobileWebUrl:"http://192.168.60.54/board/helpDetail?no=${dto.no}"   // 모바일 카카오톡에서 사용하는 웹 링크 URL
	                    , webUrl:"http://192.168.60.54/board/helpDetail?no=${dto.no}" // PC버전 카카오톡에서 사용하는 웹 링크 URL
	                }
	            }
	            , social : {
	                  likeCount:0       // LIKE 개수
	                , commentCount:0    // 댓글 개수
	                , sharedCount:0     // 공유 회수
	            }
	            , buttons : [
	                {
	                      title:"코디 도와주러 가기"    // 버튼 제목
	                    , link : {
	                        mobileWebUrl:"http://192.168.60.54/board/helpDetail?no=${dto.no}"   // 모바일 카카오톡에서 사용하는 웹 링크 URL
	                      , webUrl:"http://192.168.60.54/board/helpDetail?no=${dto.no}" // PC버전 카카오톡에서 사용하는 웹 링크 URL
	                    }
	                }
	            ]
	        });
	    }
	</script>
	<script>
		var format = function() {
			var args = Array.prototype.slice.call(arguments, 1);
			return arguments[0].replace(/\{(\d+)\}/g, function(match, index) {
				return args[index];
			});
		};
		function shareFacebook() {
			var url = "http://192.168.60.54/style/detailStyle?no=${dto.no}";
			var title = "[SHOW YOUR CLOSET] ${dto.nickname}님의 도움 요청글입니다.";
			var description = "TESTTEST할거예요~~";
			var topImgUrl = "";
			var bottomImgUrl = "";
			
			$('head').append('<meta property="og:url" content="'+url+'" />');
			$('head').append('<meta property="og:type" content="article" />');
			$('head').append('<meta property="og:title" content="'+title+'" />');
			$('head').append('<meta property="og:description" content="'+description+'" />');
			$('head').append('<meta property="og:image" content="/imgs/shilouette/default_tshirt.png" />');
			
			var linkUrl = window.location.href;
			window.open('http://www.facebook.com/sharer.php?u='+ encodeURIComponent(linkUrl));
			
		};
		$(document).ready(function() {

			var lastHeight = 0;
			var curHeight = 0;
			var targetFrame = $('#commentFrm'); // custome id 입력

			$("#commentFrm").on('load', function() {
				curHeight = targetFrame.contents().find('body').height();
				targetFrame.css('height', curHeight + 'px');
			});

			setInterval(function() {
				curHeight = targetFrame.contents().find('body').height();
				if (curHeight != lastHeight) {
					targetFrame.css('height', (lastHeight = curHeight) + 'px');
				}
			}, 500);

		});

		$("#styleComentBtn").on("click",function() {
			$(".commentDiv").attr("src","${pageContext.request.contextPath}/advisor/helpStyleComent?b_no=${dto.no}&writer=${dto.email}");
			});
		$("#nomalComentBtn").on("click",function() {
			$(".commentDiv").attr("src","${pageContext.request.contextPath}/comments/helpBoardComments?b_no=${dto.no}");
			});
		$("#btnMenu").on("click", function() {
			$(".menu").css("display", "flex");
			$(".navigator").css("z-index", "1");
		});
		$(".mainblock").on("click", function() {
			$(".menu").css("display", "none");
		});
		$("#closeMenu").on("click", function() {
			$(".menu").css("display", "none");
		});
	</script>
</body>
</html>