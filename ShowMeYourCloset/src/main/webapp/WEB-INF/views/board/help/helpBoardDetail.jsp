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
		* {box-sizing: border-box;font-family: 'Noto Sans KR', sans-serif;}
		.updateBtn:hover{cursor:pointer;}

		/* 네비바 */
	    #title{font-size: 15px;color:dimgray;font-weight: 700;line-height: 100px;}
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
	    /* 숨김메뉴 */
	    .menu{width: 100%;height: 100%;position:fixed;display: none;z-index: 5;}
	    .menubar{ background-color: white;}
	    .mainblock{ background: rgba(0,0,0,0.5);}
	    #menu-nickname {width:100%;height: 200px;line-height: 200px;font-size: 30pt;}
	    .borderDelete{border: 0px;}
		/* 	    푸터 */
	    #bottom{width: 100%;color:white;background: #5e5e5e; height: 150px;}
	    #bottom-logo{height: 150px; line-height: 150px;}
	    #bottom-contents{font-size: 10pt;color: white;}
	    
	     .mainLogo{
            	position:relative;
                color: white;
                font-size:50px;
                font-weight: 700;
                text-align: center;
            }
            .LogoDiv:after{
                display: block;
                position:absolute;
                top:0;
                left: 0;
                background-image:url('/imgs/bg/clothesLogo2.jpg');
                background-attachment: fixed; 
                height: 600px;
                width: 100%;
                z-index: -1;
                content: "";  
                background-size: 100% 100%;
            }
</style>

<body>

	<!-- 숨김 메뉴 -->
	<jsp:include page="../../standard/hideMenu.jsp"/>
	<!-- 본문 -->
	<div class="container-fuild p-0">
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
				<span id="bTitle">HELP BOARD</span>
			</div>
			<div id="searchBox" class="col-1 p-0 m-0"></div>
		</div>
		<!-- 상단 설명 -->
          <div class="row m-0 LogoDiv" style="height: 600px;">
                <div class="col-12">
                <!-- 위 메뉴 공백 채우기 -->
                <div class="row" style="margin-top: 100px;"></div>
                    <div class="col-12">
                        <div class="row">
                           <div class="col-12 mainLogo" id="mainLogo">
			                    <p class="mainLogo" style="margin-top: 95px;">HELP BOARD</p>
			                    <div class="p-3" style="font-size:15px; color:white; font-weight: 700; background: rgba(0,0,0,0.5); width: 500px; margin: auto; border-radius: 10px;">
			                        <span style="display: block;">코디에 자신이 없어도 괜찮아요!</span>
			                        <span style="display: block;">여기서 도움을 요청해보세요</span>
			                        <span style="display: block;">내 옷으로 예쁘게 센스있게 꾸며보세요</span>
			                        <span style="display: block;">오늘 점심은 떡볶이를 먹을 것이다.</span>
			                        <span style="display: block;">크레이지 후라이.. 볶음밥 존맛탱구리...</span>
			                        <span style="display: block;">그렇다 좀 더 글을 길게 쓰기 위함이다.</span>
			                        <span style="display: block;">좀 예쁘게</span>
			                    </div>
			                </div>
                        </div>
                    </div>
                </div>
            </div>
         <!-- 상단 설명 -->
		<div class="row m-0" style="height: 50px;"></div>
		<!-- 게시글 주루룩 -->
		<div class="row">
			<div class="col-12 col-md-6 form-title mt-4 mb-1 p-4"
				style="margin: auto; border-radius: 10px; border: 1px solid #bcbcbc;">
				<div class="row">
					<div class="col-12">
						<div class="titleDiv" style="border: 1px solid #bcbcbc; height: 40px; border-radius: 5px; text-align: center; line-height: 40px;">
							<span class="titleSpan">${dto.title}</span>
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
						<div class="contentsDiv p-2" style="border: 1px solid #bcbcbc; min-height: 300px; border-radius: 5px; white-space: pre;">${dto.contents}</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12" style="font-size: 13px;">
						<c:if test="${dto.email == email}">
							<span style="float:right" class="updateBtn deleteBtn ml-2">|&nbsp; 삭제  &nbsp;|</span>
							<span style="float:right" class="updateBtn modifyBtn ml-2">|&nbsp; 수정</span>
							<span style="float:right; display: none;" class="updateBtn modifyConfirm ml-2">|&nbsp; 수정확인</span>
						</c:if>
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
				<input type="hidden" name="cpage" value="${cpage}">
            </form>
            <form action="${pageContext.request.contextPath}/advisor/detailAdvisor" id="detailFrm" name="detailFrm" method="post">
            	<input type="hidden" name="writer">
            	<input type="hidden" name="no">
            	<input type="hidden" name="cpage" value="${cpage}">
            </form>
            <form action="${pageContext.request.contextPath}/board/modifyHelpBoard" id="boardModifyFrm" method="post">
            	<input type="hidden" name="title" id="inputTitle">
            	<input type="hidden" name="contents" id="inputContents">
            	<input type="hidden" name="no" id="no" value="${dto.no}">
            </form>
            <form action="${pageContext.request.contextPath}/board/helpBoard" id="boardBack" name="boardBack" method="post">
            	<input type="hidden" name="cpage" value="${cpage}">
            	<input type="hidden" name="target" value="${target}">
            </form>
		</div>
		<!-- 상단 설명 -->
		<div class="row m-0" style="height: 50px;"></div>

		<jsp:include page="../../standard/boardFooter.jsp"/>
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
	                      mobileWebUrl:"http://192.168.60.11/board/helpDetail?no=${dto.no}"   // 모바일 카카오톡에서 사용하는 웹 링크 URL
	                    , webUrl:"http://192.168.60.11/board/helpDetail?no=${dto.no}" // PC버전 카카오톡에서 사용하는 웹 링크 URL
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
	                        mobileWebUrl:"http://192.168.60.11/board/helpDetail?no=${dto.no}"   // 모바일 카카오톡에서 사용하는 웹 링크 URL
	                      , webUrl:"http://192.168.60.11/board/helpDetail?no=${dto.no}" // PC버전 카카오톡에서 사용하는 웹 링크 URL
	                    }
	                }
	            ]
	        });
	    }
	</script>
	<script>
		$(".modifyBtn").on("click",function(){
			$(".modifyConfirm").css("display","inline");
			$(".modifyBtn").css("display","none");
			$(".titleSpan").prop("contenteditable","true");
			$(".contentsDiv").prop("contenteditable","true");	
		})
		$(".modifyConfirm").on("click",function(){
			var result = confirm("수정을 진행 하시겠습니까?");
			if(result){
				if($(".titleSpan").text() == "" || $(".contentsDiv").html()== ""){
					alert("내용을 입력해주세요");
					return ;
				}
				var contents = $(".contentsDiv").html();
				contents = contents.replace(/<br>/gi, "\n"); 
				$("#inputTitle").val($(".titleSpan").text());
				$("#inputContents").val($(".contentsDiv").html());
				
				$("#boardModifyFrm").submit();
			}
			
		});
		$(".deleteBtn").on("click",function(){
			var result = confirm("정말 게시글을 삭제 하시겠습니까?");
			if(result){
				location.href="${pageContext.request.contextPath}/board/deleteHelpBoard?no=${dto.no}";
			}
		});
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