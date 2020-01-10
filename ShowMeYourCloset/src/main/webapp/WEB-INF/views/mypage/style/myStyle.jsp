<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap"
	rel="stylesheet">

<style>
.card-Img-div {
	height: 300px;
}

.topImg {
	height: 40%;
}

.bottomImg {
	height: 60%;
}
</style>
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

				<div class="row mt-5" style="margin-top: 300px;">
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
								</div>
								<hr>
							</div>
						</div>

					</div>
				</div>
				<div class="row">
					<div class="col-12" style="text-align: center">
						<h3>My Style</h3>
						<hr style="width: 500px;">
					</div>
				</div>
				<div class="styleList p-2 mb-5" style="margin: auto; width: 1420px; border : 1px solid #bcbcbc; border-radius:10px;">
					<div class="row">
						<c:forEach var="dto" items="${styleList}">
							<div class="col-12 col-md-3 mt-2">
								<div class="card" style="width: 18rem; margin:auto;">
									<div class="card-Img-div">
										<c:choose>
											<c:when test="${dto.top == null}">
												<div class="card-img-top topImg" style="background:grey;"></div> 
											</c:when>
											<c:otherwise>
												<img src="${dto.top}" class="card-img-top topImg"> 
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${dto.top == null}">
												<div class="card-img-bottom bottomImg" style="background:grey;"></div> 
											</c:when>
											<c:otherwise>
												<img src="${dto.pants}" class="card-img-bottom bottomImg">
											</c:otherwise>
										</c:choose>
										
									</div>
									<div class="card-body">
										<h5 class="card-title">${dto.name}</h5>
										<p class="card-text">${dto.memo}</p>
									</div>
								</div>
							</div>	
						</c:forEach>
					</div>
				</div>
				<jsp:include page="../../standard/footer.jsp" />
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>