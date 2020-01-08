<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstap4 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
	<c:choose>
		<c:when test="${email ==null }">
			로그인을 하십시오.
		</c:when>
		<c:otherwise>
			<div class="container-fuild">
    
    <!-- 헤더 -->
    <jsp:include page="../../standard/header.jsp" />
    
	<div class="row mt-5">
        <div class="col-12 mt-5">
            <div class="row">
                <div class="col-12 text-center">
                    <h1 style="font-weight: 800;">My Page</h1>    
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12 text-center">
                    <div class="btn-group" role="group" aria-label="Basic example">
                      <button type="button" class="btn btn-outline-dark">Info</button>
                      <button type="button" class="btn btn-outline-dark">Closet</button>
                      <button type="button" class="btn btn-outline-dark">Style</button>
                    </div><hr>
                </div>   
            </div>
        </div>
    </div>
    <div class="row" id="dressBox">
        <div class="col-12">
        <c:choose>
        <c:when test=${list.size() == 0}>
            <img src="imgs/closet/closet1.png" id="closet">
            <div id="topBox">
                TOP
            </div>
            <div id="pantsBox">
                PANTS
            </div>
            <div id="shoesBox">
                SHOES
            </div>
            <div id="accBox">
                ACC
            </div>
        </c:when>
        <c:when test=${"list.size() > 0"}>
            <img src="imgs/closet/closet1.png" id="closet">
            <div id="topBox">
                <div class="imgBox text-left">
                    <img src="" class="w-50">
                </div>
            </div>
            <div id="pantsBox">
                <div class="imgBox text-left">
                    <img src="" class="w-50">
                </div>
            </div>
            <div id="shoesBox">
                <div class="imgBox text-left">
                    <img src="" class="w-50">
                </div>
            </div>
            <div id="accBox">
                <div class="imgBox text-left">
                    <img src="" class="w-50">
                </div>
            </div>
        </c:when>
        </c:choose>
        </div>
    </div><hr>
    <div class="row">
        <div class="col-8 m-auto p-0">
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link" href="#"><span class="nav-font">All</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#"><span class="nav-font">Top</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#"><span class="nav-font">Pants</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#"><span class="nav-font">Shose</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#"><span class="nav-font">Acc</span></a>
              </li>
            </ul>
        </div>
    </div>
    <div class="row mt-1 mb-5">
		<div class="col-8 m-auto p-0 item-page">
		
        <!-- 파일 가져와서 뿌려주면 됨. 반복문사용 -->
	    <div class="row row-cols-3 m-auto">
	      <div class="col-4 mb-4 mt-4">
	        <div class="card h-100">
	          <img src="imgs/bg/bg1.jpg" class="card-img-top" alt="...">
	          <div class="card-body">
	            <h5 class="card-title">Card title</h5>
	            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	          </div>
	        </div>
	      </div>
	      <div class="col-4 mb-4 mt-4">
	        <div class="card h-100">
	          <img src="imgs/bg/bg2.jpg" class="card-img-top" alt="...">
	          <div class="card-body">
	            <h5 class="card-title">Card title</h5>
	            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	          </div>
	        </div>
	      </div>
	      <div class="col-4 mb-4 mt-4">
	        <div class="card h-100">
	          <img src="imgs/bg/bg3.jpg" class="card-img-top" alt="...">
	          <div class="card-body">
	            <h5 class="card-title">Card title</h5>
	            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	          </div>
	        </div>
	      </div>
	    </div>

		</div>
    </div>
    
    <!-- 푸터 -->
    <jsp:include page="../../standard/footer.jsp" />
</div>
		</c:otherwise>
	</c:choose>
	
</body>
</html>