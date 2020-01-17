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
		    #bk{
		        background-image:url('/imgs/bg/clothesLogo2.jpg');
		        background-attachment: fixed; 
		    }
		    #bottom{width: 100%;height: 150px; color:white;}
		    #bottom-logo{height: 150px; line-height: 150px;}
		    #bottom-contents{font-size: 10pt;color: white;}
		    .bar{
		        position:relative;
		        width: 30px;
		        height: 3px;
		        background: dimgray;
		    }
		    #title{
		        font-size: 30px;
		        color:dimgray;
		        font-weight: 700;
		        line-height: 100px;
		    }
		    #menuDiv{
		        position:fixed;
		        width: 100%;
		        height: 100%;
		        background: grey;
		        z-index: 2;
		        background: rgba(0,0,0,0.5);
		        display: none;
		    }
		    .InfoMenu {
		        position:fixed;
		        width: 380px;
		        height: 100%;
		        background: white;
		        z-index: 3
		    }
		    .navigator {
		        background-color:white;
		        border-bottom: 1px solid #bcbcbc;
		        height:100px;
		    }
		    #menuIcon{
		        margin-top: 43px;
		    }
		    .menu{
		        width: 100%;
		        height: 100%;
		        position:fixed;
		        display: none;
		        z-index: 5;
		    }
		    .menubar{ background-color: white;}
		    .mainblock{ background: rgba(0,0,0,0.5);}
		    #menu-nickname {
		        width:100%;
		        height: 200px;
		        line-height: 200px;
		        font-size: 30pt;
		    }
		    #boast{
		        border: 1px solid white;
		        border-radius: 10px;
		        position: absolute;
		        background:rgba(255,255,255,0.9);
		        width: 1000px;
		        height: 300px;
		        transform: translate(44%,40%);
		    }
		    #boastTitle{
		        font-size: 40pt;
		        font-weight: 800;
		    }
		    #searchBox>div{border: 1px solid black; border-radius: 5px; width:90px;}
		    #searchBar{width: 95%; height: 80%; margin-top:10px; display: none;}
		    .borderDelete{border: 0px;}
		     .gotoDetail{
            	text-decoration: none;
                color: black;
                width:100%;
                height:100%;
            }
            .gotoDetail:hover{
            	text-decoration: none !important;
            	color : black;        	
            }
            .title{
                font-size: 28px;
                color:dimgray;
                font-weight: 700;
                line-height: 95px;
            }
		</style>

    </head>
    <body>

  <!-- 숨김 메뉴 -->
    <div class="container-fulid p-0">
        <div class="row m-0 menu">
            <div class="p-0 menubar" style="width:23%;">
                <div class="row m-0">
                    <div class="col-12 p-2">
                        <button id="closeMenu" type="button" class="btn btn-outline-dark form-control">close</button>
                    </div>
                </div>
                <div class="row m-0" >
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
                </div><hr>
                <div class="row m-0">
                    <div class="col-12">
                        내 정보
                    </div>
                </div><hr>
                <div class="row m-0 myinfoMenu">
                    <div class="col-12">
                        <div class="row">
                            <button type="button" class="btn borderDelete btn-outline-dark form-control">내가 쓴 글</button>
                        </div>
                        <div class="row">
                            <button type="button" class="btn borderDelete btn-outline-dark form-control">내가 쓴 댓글</button>
                        </div>
                        <div class="row">
                            <button type="button" class="btn borderDelete btn-outline-dark form-control">마이 페이지</button>
                        </div>
                    </div>
                </div><hr>
                <div class="row m-0">
                    <div class="col-12">
                        게시판
                    </div>
                </div><hr>
                <div class="row m-0">
                   <div class="col-12">
                        <div class="row">
                            <button type="button" class="btn borderDelete btn-outline-dark form-control">메인 페이지</button>
                        </div>
                        <div class="row">
                            <button type="button" class="btn borderDelete btn-outline-dark form-control">자랑 게시판</button>
                        </div>
                        <div class="row">
                            <button type="button" class="btn borderDelete btn-outline-dark form-control">도움 게시판</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="p-0 mainblock" style="width:77%;"></div>
         </div>
    </div>
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
                        <div class="col-8 p-0 text-center d-none d-md-block" style="height: 100px; line-height: 100px;">
                            <span style="font-size: 20pt;font-weight: 700;color:dimgray;">MENU</span>
                        </div>
                    </div>
                </div>
                <div class="col-10 p-0 d-none d-md-block text-center">
                    <span id="title">SHOW YOUR CLOSET</span>
                    <input type="text" class="form-control" id="searchBar" name="target" placeholder="검색할 단어를 입력하세요">
                </div>
                <div id="searchBox" class="col-1 p-0 m-0">
                    <div class="row" style="margin-top: 4px;">
                        <div id="btnSearch" class="col-12 p-0">
                            <img class="w-100" src="/imgs/btn/btnSearch.png">
                        </div>
                        <div id="btnCloseSearch" class="col-12 p-0" style="background-color: black; display: none;">
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
                                        Style HELP
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 text-center">
                                        <p class="m-0">설명 주루룩</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 게시글 주루룩 -->
            <div class="row" style="background: white">
                <div class="col-10 mt-5" style="margin:auto; text-align: right;">
                    <button class="btn btn-info" id="helpUploadBtn" style="width: 130px;">도움 요청</button>
                </div>
                <div class="col-10 form-title mt-1 mb-1 p-4" style="margin:auto ;border : 1px solid #bcbcbc;border-radius: 10px; text-align: center;">
                    <div class="row" style="height: 40px; line-height: 35px; border-bottom: 1px solid #bcbcbc;">
                        <div class="d-none d-md-block col-md-1">
                            no
                        </div>
                        <div class="col-8 col-sm-7 col-md-6">
                            title
                        </div>
                        <div class="col-4 col-sm-3 col-md-2">
                            nick
                        </div>
                        <div class="d-none d-sm-block col-sm-2 col-md-1">hit</div>
                        <div class="d-none d-md-block col-2">date</div>
                    </div>
					<c:forEach items="${list}" var="dto">
	                    <div class="row contents">
	                        <div class="d-none d-md-block col-md-1">
	                            ${dto.no}
	                        </div>
	                        <div class="col-8 col-sm-7 col-md-6" style="text-align: left;">
	                            <a href="${pageContext.request.contextPath}/board/helpDetail?no=${dto.no}" class="gotoDetail">${dto.title}</a>
	                        </div>
	                        <div class="col-4 col-sm-3 col-md-2">
	                            ${dto.nickname }
	                        </div>
	                        <div class="d-none d-sm-block col-sm-2 col-md-1">${dto.views}</div>
	                        <div class="d-none d-md-block col-2">${dto.write_date}</div>
	                    </div>
                    
                    </c:forEach>
                </div>
                <div class="col-12 mt-2 mb-5"  style="text-align: center;">
                    ${page}
                </div>

            </div> 
            
            <div class="row m-0">
                <div class="col-12" id="bottom" style="background: #5e5e5e; height: 250px;">
                    <div class="row mt-5" style="margin:auto;">
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
            $("#helpUploadBtn").on("click",function(){
            	if('${email}' == ""){
            		alert("로그인을 해주세요!");
            		location.href="${pageContext.request.contextPath}/signin";
            	}else{
            		location.href="${pageContext.request.contextPath}/helpUpload";
            	}
            })
        </script>
    </body>
</html>