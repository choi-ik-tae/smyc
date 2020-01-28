<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            .mainLogo{
                position:relative;
                height: 520px;
                color: white;
                font-size:50px;
                font-weight: 700;
                text-align: center;
            }
            #bk{

            }
            .mainLogo:after{
                display: block;
                position:absolute;
                top:0;
                left: 0;
                background-image:url('/imgs/bg/clothesLogo2.jpg');
                background-attachment: fixed; 
                height: 100%;
                width: 100%;
                z-index: -1;
                content: "";  
                background-size: 100% 100%;
            }
            .contents{
                height: 53px;
                line-height: 53px;
            }
            .container-fluid {width: 1903px;max-width: none !important;}
            /* 네비바 */
		    #title{font-size: 15px;color:dimgray;font-weight: 700;line-height: 100px;}
		    .navigator {background-color:white; border-bottom: 1px solid #bcbcbc;height:50px;width: 1903px;max-width: none !important;}
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
        </style>
    </head>
    <body>

      	<!-- 숨김 메뉴 -->
		<jsp:include page="../../standard/hideMenu.jsp"/>
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
            <div class="form-wrapper row m-0">
                 <div class="col-12 mainLogo" id="mainLogo">
			                    <p class="mainLogo" style="margin-top: 95px;"><span style="color:indianred;">H</span>ELP <span style="color:darkred;">B</span>OARD</p>
			                    <div class="p-3" style="font-size:18px; color:white; font-weight: 700; background: rgba(0,0,0,0.7); width: 500px; margin: auto; border-radius: 10px;">
			                        <span style="display: block;">코디에 자신이 없어도 괜찮아요!</span>
			                        <span style="display: block;">자유롭게 대화를 나누며 <span style="color:indianred">코디를 완성</span> 시키세요</span>
			                        <span style="display: block;">또 친구들의 코디를 도와주세요!</span>
			                        <span style="display: block;">친구들에게 자신의 <span style="color:darkred">센스</span>를 뽐내보세요</span>
			                    </div>
			      </div>
            </div>
            <form action="${pageContext.request.contextPath}/board/helpUploadProc.do" method="post" id="inputFrm"> 
            <div class="row m-0" style="background: white">
                <div class="col-7  mt-2 mb-2 p-3" style="margin:auto;border-radius: 10px; font-size:12px;">
                    <span class="mb-1" style="display: block; font-weight: 600; font-size: 15px;"> * Help 게시판 등록 이용 설명</span>
                    <span style="display: block">1. 다른 사용자들에게 내 옷장 안 옷들로 코디 도움을 요청하는 게시판 입니다.</span>
                    <span style="display: block">2. <span style="color:indianred; font-weight: 600;">코디 도움 요청</span>에 벗어난 글 혹은 잡담의 글은 <span style="color:indianred; font-weight: 600;">삼가</span>해 주세요.</span>
                    <span style="display: block">3. 비공개로 설정한 옷장은 다른 사람들이 볼 수 없으나, <span style="color:indianred; font-weight: 600;">공개 설정한 옷장은 다른 사용자들에게도 공개 됩니다.</span> </span>
                    <span style="display: block">4. 옷 등록 시 비공개로 설정한 옷은 공개된 옷장안에 등록되어 있다 하더라도 다른 사용자에게 공개되지 않습니다. 옷이 공개되기를 원치 않는다면 글 등록 전 <span style="color:indianred; font-weight: 600;">MYPAGE-CLOSET</span>에서 공개 설정을 변경하시기를 바랍니다.  </span>
                    <span style="display: block">5. 반복적인 중복글은 <span style="color:indianred; font-weight: 600;">사이트 이용 금지</span> 사유에 포함됩니다. </span>
                    <span style="display: block">6. 광고 혹은 스팸 게시글은 <span style="color:indianred; font-weight: 600;">강제 삭제</span> 사유에 포함 됩니다. 주의해 주십시오.</span>

                </div>
                
	                <div class="col-7 form-title mt-1 mb-1 p-4" style="margin:auto ;border : 1px solid #bcbcbc;border-radius: 10px; text-align: center;">     	
	                        <div class="form-row form-group">
	                            <div class="col-2">
	                                <label for="title">글 제목</label>
	                            </div>
	                            <div class="col-10"> 
	                                <input type="text" class="form-control" id="title" name="title">
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <textarea class="form-control" style="resize: none;" rows="20" name="contents" id="contents"></textarea>
	                        </div>
	                </div>
	                <div class="col-7 mt-2 mb-2 p-3" style="margin:auto;border-radius: 10px; font-size:12px; text-align: right;">
	                    <button id="uploadBtn" class="btn btn-info" type="button">도움 요청하기</button>
	                </div>
            </div> 
             </form>
            <jsp:include page="../../standard/boardFooter.jsp"/>	
        </div>

		<!--  숨김메뉴 스크립트 -->
        <script>
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
        <script>
        	$("#uploadBtn").on("click",function(){
        		console.log($("#title").val());
        		console.log($("#contents").val());
        		if($("#title").val() == "" || $("#contents").val() == ""){
        			alert("게시글의 제목과 내용을 제대로 입력해주세요!");
        			return;
        		}
        		$("#inputFrm").submit();    		
        	})
           
        </script>
    </body>
</html>