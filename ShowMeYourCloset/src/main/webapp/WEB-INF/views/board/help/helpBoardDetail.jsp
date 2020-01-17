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
                
                        </div>
                    </div>
                    <!-- 상단 설명 -->
                    <div class="row m-0" style="height: 100px; background:#bcbcbc;">

                    </div>
                    <!-- 게시글 주루룩 -->
                    <div class="row" style="background: #bcbcbc;">

                        <div class="col-10 form-title mt-1 mb-1 p-4" style="margin:auto ;border-radius: 10px; background: white;">
                            <div class="row">
                                <div class="col-12">
                                    <div class="titleDiv" style="border: 1px solid #bcbcbc; height: 40px; border-radius: 5px; text-align: center; line-height: 40px;">
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
                                    <div class="contentsDiv p-2" style="border :1px solid #bcbcbc; min-height: 300px; border-radius: 5px; white-space:pre; ">${dto.contents}</div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12" style="font-size: 13px; text-align: right;">
                                    <span class="mr-2">조회수 ${dto.views }</span>
                                    <span>
                                        ${dto.write_date }
                                    </span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 mt-2" style="text-align: center;">
                                    <button id="styleComentBtn" class="btn btn-outline-info" style="width: 150px;">코디 도움</button>
                                    <button id="nomalComentBtn" class="btn btn-outline-info" style="width: 150px;">댓글</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12" >
                                    <iframe class="comentDiv" src="${pageContext.request.contextPath}/advisor/helpStyleComent?b_no=${dto.no}" style="border : 1px solid #bcbcbc; width: 100%; min-height: 500px; border-radius: 5px;" ></iframe>
                                </div>
                            </div>

                        </div>
                    </div> 
                    <!-- 상단 설명 -->
                    <div class="row m-0" style="height: 50px; background:#bcbcbc;">

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
                    $("#styleComentBtn").on("click",function(){
                        $(".comentDiv").attr("src","${pageContext.request.contextPath}/advisor/helpStyleComent?b_no=${dto.no}");
                    })
                    $("#nomalComentBtn").on("click",function(){
                        $(".comentDiv").attr("src","${pageContext.request.contextPath}/comments/helpBoardComments");
                    })
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
                </script>
            </body>
        </html>