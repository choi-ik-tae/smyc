<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    </head>
    <style>

        #target{height:770px;}
        .advisor-notify span{display: block; font-size:13px;}
        .category-title{text-align: center;font-size: 30px; font-weight: 700;}
        .container{position:absolute;left:50%; transform: translate(-50%);}
        .categoryDiv>div{position:absolute; width: 220px; z-index: 1; border-radius: 10px; background:rgba(188, 188, 188,0.7); font-size: 20px; font-weight: 700;}
        .Top{height: 180px;top:240px;left: 174px; line-height: 180px;}
        .Pants{height: 230px;top:430px;left: 174px; line-height: 230px;}
        .Shoes{height: 120px;top:670px; left: 174px; line-height: 120px;}
        .Acc{height: 100px; top:180px; line-height: 100px;}
        .noneDiv {width:150px;height:150px;display:inline-block;padding:5px;}
		.noneDiv>img{width:100%;height:100%;}
		.categoryImgDiv{width:150px;height:150px;display:inline-block;padding:5px;}
		.categoryImgDiv>img{width:100%;height:100%;}
		.loadImg{width:100%; height:100%;}
    </style>
    <body>
        <div class="container">
            <div class="categoryDiv">
                <div class="category Top text-center" id="Top">
                	<c:choose>
                		<c:when test="${dto.top==null}">
                			TOP
                		</c:when>
                		<c:otherwise>
                			<img src="${dto.top}" class="loadImg">
                		</c:otherwise>
                	</c:choose>
                </div>
                <div class="category Pants text-center" id="Pants">
                	<c:choose>
                		<c:when test="${dto.pants==null}">
                			PANTS
                		</c:when>
                		<c:otherwise>
                			<img src="${dto.pants}" class="loadImg">
                		</c:otherwise>
                	</c:choose>
                </div>
                <div class="category Shoes text-center" id="Shoes">
                	<c:choose>
                		<c:when test="${dto.shoes==null}">
                			SHOES
                		</c:when>
                		<c:otherwise>
                			<img src="${dto.shoes}" class="loadImg">
                		</c:otherwise>
                	</c:choose>
                </div>
                <div class="category Acc text-center" style="width: 150px;" id="Acc">
                	<c:choose>
                		<c:when test="${dto.acc==null}">
                			ACC
                		</c:when>
                		<c:otherwise>
                			<img src="${dto.acc}" class="loadImg">
                		</c:otherwise>
                	</c:choose>
                </div>
            </div>
            <div class="row mt-2 mb-3">
                <div class="col-8 advisor-notify" style="margin:auto;">
                    <span>* 이용방법 *</span>
                    <span> 1. 다른 친구의 옷으로 캐릭터를 코디해주세요!</span>
                    <span> 2. 각 카테고리를 클릭하면 친구가 등록한 옷이 화면에 나타납니다.</span>
                    <span>화면에 뜬 옷을 클릭하면 캐릭터가 옷을 입습니다.</span>
                    <span>3. 비방 및 욕설은 계정 정지 사유에 해당됩니다.</span>
                </div>
            </div>
            <div class="row">
                <div class="col-6" style="text-align: center; border: 1px solid #bcbcbc;">
                	<c:choose>
                		<c:when test="${gender == 'M'}">
                			<img src="/imgs/shilouette/man.png" id="target">
                		</c:when>
                		<c:otherwise>
                			<img src="/imgs/shilouette/woman.png" id="target">
                		</c:otherwise>
                	</c:choose>
                    
                </div>
                <div class="col-6 p-2" style="border: 1px solid #bcbcbc;">
                    <div class="row">
                        <div class="col-12">
                    
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 category-title">
                            <span>TOP</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 categoryMenu">

                        </div>
                    </div>

                </div>
            </div>
            <c:if test="${writer == email}">
	            <div class="row">
	            	<div class="col-12">
	            		<button id="selectThis" class="btn btn-info">채택하기</button>
	            	</div>
	            </div>
            </c:if>

                <div class="row">
                    <div class="col-12">
                        <div class="row mt-2 mb-2">
                            <div class="col-12">
                                <label>제목</label>
                                <input type="text" class="form-control" name="title" id="title" value="${dto.title}" disabled>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 mt-2 mb-3">
                                <textarea class="form-control" style="resize: none;" rows="15" name="contents" id="contents"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mb-5">
                    <div class="col-12" style="text-align: left;">
                        <button class="btn btn-info" type="button" id="advisorUploadBtn">등록하기</button>
                    </div>
                </div>
           
        </div> 
        <script>
        	$("#selectThis").on("click",function(){
        		var result = confirm("정말 채택하시겠습니까?");
        		
        		if(result){
        			$.ajax({
        				url:"${pageContext.request.contextPath}/advisor/choiceThisAdvisor",
        				data:{
        					no:"${dto.no}"
        				}
        			})
        		}
        	})
        </script>
       

    </body>
</html>