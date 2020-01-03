<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- Animate.css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<link rel="stylesheet" href="animate.min.css">
<!-- index.css -->
<link rel="stylesheet" type="text/css" href="/css/index.css">
</head>
<body>
<a href="#firstPage"><img id="toTop" src="/imgs/ta1.png" style="width: 60px"></a>
<div class="container-fluid p-0">
    <div class="row fixed-top align-items-center" id="top">
        <div class="col-2 text-center">
            <label class="m-0 logo">Show Your Closet</label>
        </div>
        <div class="col-10">
        <ul class="nav justify-content-end">
            <li class="nav-item">
                <a class="nav-link" href="#">Home</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">CoordiBoard</a>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="#">Boast</a>
                  <a class="dropdown-item" href="#">Help</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Mypage</a>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="#">MyInfo</a>
                  <a class="dropdown-item" href="#">Closet</a>
                  <a class="dropdown-item" href="#">Coordi</a>
                </div>
            </li>
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
                <div class="row text-center reposition">
                     <div class="col-4">
                        <label class="circleBtn">
                            <img id="btnCoordi" src="/imgs/btnClothes.png">
                            <label class="mt-4">옷 등록</label>
                        </label>
                     </div>
                     <div class="col-4">
                        <label class="circleBtn">
                            <img id="btnBoast" src="/imgs/btnCoordi.png">
                            <label class="mt-4">코디 등록</label>
                        </label>
                     </div>
                     <div class="col-4">
                         <label class="circleBtn">
                            <img id="btnHelp" src="/imgs/btnHelp_color.png">
                            <label class="mt-4">옷장 등록</label>
                        </label>
                    </div>
                </div>
                <div class="row" id="bottom">
                    <div class="col-2">
                        Logo
                    </div>
                    <div class="col-10">
                        Copyright
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
<script>
    $("#toTop").on("click",function(){
//        location.href="index.html";
    });
</script>
</body>
</html>