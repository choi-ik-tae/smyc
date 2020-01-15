<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
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
            #bottom{width: 100%;height: 150px; color:white;}
            #bottom-logo{height: 150px; line-height: 150px;}
            #bottom-contents{font-size: 10pt;color: white;}
            .myinfoMenu>div{
                height: 54px;
            }
            .myinfoMenu>div>button{
                width: 100%;
                height: 1005;
            }
            .boardMenu>div>button{
                width: 100%;
                height: 100%;
            }
            .boardMenu>div{
                height: 54px;
            }
            #menu-nickname{
                height: 180px;
                text-align: center;
                line-height: 180px;
                color:darkslategrey;
                font-weight: 700;
                font-size: 25px;
            }
            .bar{
                position:relative;
                width: 30px;
                height: 3px;
                background: dimgray;
            }
            .bar-one{
                top:35px;
            }
            .bar-two{
                top:39px;
            }
            .bar-three{
                top:43px;
            }
            .menuIcon{
                line-height: 85px;
                font-size:21px;
                font-weight: 700;
                color:dimgray;
            }
            .menu:hover{
                background:rgba(255,255,255,0.1);
            }
            .title{
                font-size: 28px;
                color:dimgray;
                font-weight: 700;
                line-height: 95px;
            }
            #closeBtn{
                display: none; 
                background: white; 
                font-size: 50px; 
                text-align: center; 
                font-weight: 700; 
                color:black; 
                height: 90px; 
                width: 90px; 
                padding-top:8px; 
                margin:4px; 
                border-radius: 3px;
            }
            .gotoDetail{
            	text-decoration: none;
                color: black;
                width:100%;
                hegiht:100%;
            }
            .gotoDetail:hover{
            	text-decoration: none !important;
            	color : black;
            	background:grey;           	
            }
        </style>
    </head>
    <body>

        <div id="menuDiv" class="InfoMenu-container" style="position:absolute; width: 100%; height: 100%; background: grey; z-index: 2; background: rgba(0,0,0,0.5);display: none;">
            <div class="InfoMenu" style="position:fixed;width: 380px; height: 100%; background: white; z-index: 3">
                <div class="row mt-2">
                    <div class="col-12">
                        close X
                    </div>
                </div>
                <div class="row" >
                    <div class="col-12" id="menu-nickname">
                        쁘띠 때옹
                    </div>
                </div>
                <div style="height: 40px; line-height: 38px;">
                    내 정보 보기
                </div>
                <div class="row myinfoMenu">
                    <div class="col-12">
                        <button class="btn">내가 쓴 글 보기</button>
                    </div>
                    <div class="col-12" >
                        <button class="btn"> 내가 쓴 댓글 보기</button>
                    </div>
                    <div class="col-12" >
                        <button class="btn">MyPage</button>
                    </div>

                </div>
                <div style="height: 40px; line-height: 38px;">
                    게시판 이동
                </div>
                <div class="row boardMenu">
                    <div class="col-12" >
                        <button class="btn"> HOME</button>
                    </div>
                    <div class="col-12" >
                        <button class="btn">BoardBoard</button>
                    </div>
                    <div class="col-12">
                        <button class="btn">HelpBoard</button>
                    </div>


                </div>
            </div>

        </div>
        <div class="container-fuild" id="bk">
            <div class="navigator row" style="background-color:white; height:100px;">
                <div class="col-1 menu pl-4" id="menuCheck">
                    <div class="row" style="height: 100px;">
                        <div class="bar-Container col-4">
                            <div class="bar bar-one"></div>
                            <div class="bar bar-two"></div>
                            <div class="bar bar-three"></div>
                        </div>
                        <div class="menuIcon d-none d-md-block col-6">
                            MENU    
                        </div>
                    </div>

                </div>
                <div class="d-none d-md-block col-10 title">
                    <div class="searchDiv row" style="height: 0px; overflow: hidden;">
                        <div class="col-1" style="text-align: center;">
                            검색
                        </div>
                        <div class="col-11 pb-0">
                            <input type="text" class="form-control" style="width: 100%;height: 98%;" placeholder="검색할 단어를 입력하세요">
                        </div>
                    </div>
                    <div class="row">
                        <div class="LogoDiv col-12"  style="text-align: center;">
                            SHOW YOUR CLOSET
                        </div>
                    </div>                    
                </div>
                <div class="col-1" >
                    <div id="searchBtn" style="background: white; width: 100; height: 100px;">
                        <img src="/imgs/btn/searchIcon4.png" style="width: 100px; height: 100%;">
                    </div>
                    <div id="closeBtn">X</div>
                </div>
            </div> 
            <div class="form-wrapper row">
                <div class="col-12 mainLogo" id="mainLogo">
                    <p style="margin-top: 95px;">Help Board</p>
                    <div class="p-3" style="font-size:15px; color:white; font-weight: 700; background: rgba(0,0,0,0.5); width: 500px; margin: auto; border-radius: 10px;">

                        <span style="display: block;">코디에 자신이 없어도 괜찮아요!</span>
                        <span style="display: block;">여기서 도움을 요청해보세요</span>
                        <span style="display: block;">내 옷으로 예쁘게 센스있게 꾸며보세요</span>
                        <span style="display: block;">오늘 점심은 떡볶이를 먹을 것이다.</span>
                        <span style="display: block;">크레이지 후라이.. 볶음밥 존맛탱구리...</span>
                        <span style="display: block;">그렇다 좀 더 글을 길게 쓰기 위함이다.</span>
                        좀 예쁘게
                    </div>

                </div>
            </div> 
            <div class="row" style="background: white">
                <div class="col-10 mt-5" style="margin:auto; text-align: right;">
                    <button class="btn btn-info" style="width: 130px;">도움 요청</button>
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
                    1 2 3 4 5 6 7 8
                </div>

            </div> 
            <div class="row">
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
            $("#searchBtn").on("click",function(){
                $(".LogoDiv").css("display","none");
                $(".searchDiv").css("height","100px");
                $("#searchBtn").css("display","none");
                $("#closeBtn").css("display","block");
            })
            $("#closeBtn").on("click",function(){
                $(".LogoDiv").css("display","block");
                $(".searchDiv").css("height","0px");
                $("#searchBtn").css("display","block");
                $("#closeBtn").css("display","none");      
            })
            $("#menuCheck").on("click",function(){
                $("#menuDiv").css("display","block");
            })
            $("#menuDiv").on("click",function(){
                $("#menuDiv").css("display","none");
            })
        </script>
    </body>
</html>