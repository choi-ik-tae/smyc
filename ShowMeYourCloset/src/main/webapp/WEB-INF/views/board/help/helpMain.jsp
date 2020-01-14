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
            .mainLogo:after{
                background-image:url('Img/clothesLogo2.jpg');
                display: block;
                position:absolute;
                top:0;
                left: 0;
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
        <div class="container-fuild">
            <div class="navigator row" style="background-color:white; height:100px;">
                <div class="col-1 menu" id="menuCheck">
                    Menu
                </div>
                <div class="col-7 title">
                    Title
                </div>
                <div class="col-4 search">
                </div>
            </div> 
            <div class="form-wrapper row">
                <div class="col-12 mainLogo" id="mainLogo">
                    <p style="margin-top: 95px;">Help Board</p>
                    <pre style="font-size:15px; color:white; font-weight: 700; background:white; background: rgba(0,0,0,0.5); width: 500px; margin: auto; border-radius: 10px;">

코디에 자신이 없어도 괜찮아요!
여기서 도움을 요청해보세요
내 옷으로 예쁘게 센스있게 꾸며보세요
오늘 점심은 떡볶이를 먹을 것이다.
크레이지 후라이.. 볶음밥 존맛탱구리...
그렇다 좀 더 글을 길게 쓰기 위함이다.
좀 예쁘게
                    </pre>

                </div>
            </div> 
            <div class="row">
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
                    <div class="row contents">
                        <div class="d-none d-md-block col-md-1">
                            1
                        </div>
                        <div class="col-8 col-sm-7 col-md-6" style="text-align: left;">
                            놀이동산 가는데 옷 입는거 도와주실 분~~
                        </div>
                        <div class="col-4 col-sm-3 col-md-2">
                            쁘띠때옹
                        </div>
                        <div class="d-none d-sm-block col-sm-2 col-md-1">20</div>
                        <div class="d-none d-md-block col-2">2020.01.14</div>
                    </div>

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
            $("#menuCheck").on("click",function(){
                $("#menuDiv").css("display","block");
            })
            $("#menuDiv").on("click",function(){
                $("#menuDiv").css("display","none");
            })
        </script>
    </body>
</html>