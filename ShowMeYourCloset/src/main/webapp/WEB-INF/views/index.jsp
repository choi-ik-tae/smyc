<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Show Your Closet</title>
<!-- fullPageScroll -->
<meta name="author" content="Alvaro Trigo Lopez" />
<meta name="description" content="fullPage very simple demo." />
<meta name="keywords"  content="fullpage,jquery,demo,simple" />
<meta name="Resource-type" content="Document" />
<link rel="stylesheet" type="text/css" href="/css/fullpage.css" />
<link rel="stylesheet" type="text/css" href="/css/examples.css" />
<!-- Bootstap4 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- index.css -->
<link rel="stylesheet" type="text/css" href="/css/index.css">
</head>
<body>
<a href="#firstPage"><img id="toTop" src="/imgs/btn/ta1.png" style="width: 60px"></a>
<div class="container-fluid p-0">

    <div class="row fixed-top align-items-center" id="top">
        <div class="col-2 text-center">
            <label class="m-0 logo">Show Your Closet</label>
        </div>
        <div class="col-10">
        <ul class="nav justify-content-end">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">StyleBoard</a>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="#">StyleBoast</a>
                  <a class="dropdown-item" href="#">StyleHelp</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">MyPage</a>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="#">Info</a>
                  <a class="dropdown-item" href="#">Closet</a>
                  <a class="dropdown-item" href="#">Style</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Login</a>
            </li>
            <!-- 로그인 후 회원가입 및 마이페이지 메뉴 추가 생성 -->
        </ul>
        </div>
    </div>
    <div class="row" id="fullpage">
        <div class="col-12 article p-0">
            <div class="col-12 section article-1" data-anchor="firstPage" id="section0">
                <h1 id="label1">
                    옷을 사진으로 등록해서 보다 편하게 옷장을 관리하세요!
                </h1>
            </div>
            <div class="col-12 section article-2" id="section1">
                <h1 id="label2">
                    등록한 옷으로 미리 <span style="color: brown">코디</span>를 하여 준비시간을 단축하세요!
                </h1>
            </div>
            <div class="col-12 section article-3" id="section2">
                <span id="label3">
                   <h1 class="text-left"><span style="color: brown">코디</span>에 자신이 없어도 걱정마세요!</h1>
                   <h1>사람들이 당신의 <span style="color: brown">코디</span>를 도와줄거예요!</h1>
                </span>
            </div>
            <div class="col-12 section article-4" id="section3">
                <span id="label4">
                    <h1 style="color: indianred">당신의 스타일을</h1>
                </span>
            </div>
            <div class="col-12 section article-5" id="section4">
                <span id="label4">
                    <h1 style="color: rosybrown;">바로 여기서</h1>
                    <h1 style="color: darkred">만들어보세요!</h1>
                </span>
            </div>
            <div class="col-12 section article-6" id="section5">
                <div class="row text-center reposition" id="btnBox">
                     <div class="col-4">
                        <label class="circleBtn">
                            <img class="mt-5" id="btnCoordi" src="/imgs/btn/btnClothes.png">
                            <label class="mt-2">옷 등록</label>
                        </label>
                     </div>
                     <div class="col-4">
                        <label class="circleBtn">
                            <img class="mt-5" id="btnBoast" src="/imgs/btn/btnStyle.png">
                            <label class="mt-2">코디 등록</label>
                        </label>
                     </div>
                     <div class="col-4">
                         <label class="circleBtn">
                            <img class="mt-5" id="btnHelp" src="/imgs/btn/btnCloset.png">
                            <label class="mt-2">옷장 등록</label>
                        </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12" id="bottom">
                        <div class="row">
                            <div class="col-2" id="bottom-logo">
                                Show Your Closet
                            </div>
                            <div class="col-10 align-self-center" id="bottom-contents">
                                <div class="row">
서울 중구 남대문로 120 대일빌딩 3층 F Class (주) In Sync
                                </div>
                                <div class="row">
Copyright © 2020 InSync Inc. 모든 권리 보유.
                                </div>
                                <div class="row">
대표전화&nbsp;&#124;&nbsp;010-8854-8699&nbsp;&#124;&nbsp;010-8077-1131
                                </div>
                                <div class="row">
                                    <a href="#">개인정보 처리방침</a>&nbsp;&#124;&nbsp;
                                    <a href="#">약관</a>&nbsp;&#124;&nbsp;
                                    <a href="#">법적 고지</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    
</div>
<script type="text/javascript" src="/js/fullpage.js"></script>
<script type="text/javascript">
	var myFullpage = new fullpage('#fullpage', {
        anchors:['firstPage', 'secondPage', 'thirdPage', 'fourthPage', 'fifthPage', 'sixthPage']
    });
</script>
</body>
</html>