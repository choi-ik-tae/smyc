<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                text-decoration: none !important;
                color: black;
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
                </div>
            </div> 
            <div class="form-wrapper row">
                <div class="col-12 mainLogo" id="mainLogo">
                    <p style="margin-top: 95px;">HELP BOARD</p>
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
            <form action="${pageContext.request.contextPath}/board/helpUploadProc.do" method="post" id="inputFrm"> 
            <div class="row" style="background: white">
                <div class="col-10  mt-2 mb-2 p-3" style="margin:auto;border-radius: 10px; font-size:12px;">
                    <span class="mb-1" style="display: block; font-weight: 600; font-size: 15px;"> * Help 게시판 등록 이용 설명</span>
                    <span style="display: block">1. 다른 사용자들에게 내 옷장 안 옷들로 코디 도움을 요청하는 게시판 입니다.</span>
                    <span style="display: block">2. <span style="color:indianred; font-weight: 600;">코디 도움 요청</span>에 벗어난 글 혹은 잡담의 글은 <span style="color:indianred; font-weight: 600;">삼가</span>해 주세요.</span>
                    <span style="display: block">3. 비공개로 설정한 옷장은 다른 사람들이 볼 수 없으나, <span style="color:indianred; font-weight: 600;">공개 설정한 옷장은 다른 사용자들에게도 공개 됩니다.</span> </span>
                    <span style="display: block">4. 옷 등록 시 비공개로 설정한 옷은 공개된 옷장안에 등록되어 있다 하더라도 다른 사용자에게 공개되지 않습니다. 옷이 공개되기를 원치 않는다면 글 등록 전 <span style="color:indianred; font-weight: 600;">MYPAGE-CLOSET</span>에서 공개 설정을 변경하시기를 바랍니다.  </span>
                    <span style="display: block">5. 반복적인 중복글은 <span style="color:indianred; font-weight: 600;">사이트 이용 금지</span> 사유에 포함됩니다. </span>
                    <span style="display: block">6. 광고 혹은 스팸 게시글은 <span style="color:indianred; font-weight: 600;">강제 삭제</span> 사유에 포함 됩니다. 주의해 주십시오.</span>

                </div>
                
	                <div class="col-10 form-title mt-1 mb-1 p-4" style="margin:auto ;border : 1px solid #bcbcbc;border-radius: 10px; text-align: center;">     	
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
	                <div class="col-10  mt-2 mb-2 p-3" style="margin:auto;border-radius: 10px; font-size:12px; text-align: right;">
	                    <button id="uploadBtn" class="btn btn-info" type="button">도움 요청하기</button>
	                </div>
            </div> 
             </form>
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
        	$("#uploadBtn").on("click",function(){
        		console.log($("#title").val());
        		console.log($("#contents").val());
        		if($("#title").val() == "" || $("#contents").val() == ""){
        			alert("게시글의 제목과 내용을 제대로 입력해주세요!");
        			return;
        		}
        		$("#inputFrm").submit();    		
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