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
        .Top{height: 180px;top:240px;left: 168px; }
        .Pants{height: 230px;top:430px;left: 168px; }
        .Shoes{height: 120px;top:680px; left: 168px; }
        .Acc{height: 100px; top:200px; }
        .noneDiv {width:150px;height:150px;display:inline-block;padding:5px;}
		.noneDiv>img{max-width:150px;height:100%;}
		.categoryImgDiv{width:150px;height:150px;display:inline-block;padding:5px;}
		.categoryImgDiv>img{width:100%;height:100%;}
		.loadImg{width:100%; height:100%; opacity: 0.8;}
		.imgDetail {width:200px;height: 300px;z-index: 1;margin: auto;margin-top:120px; text-align:center}
		#dressInfo{ display: none;}
   		#dressInfoBlock{height: 770px;background-color: dimgray; opacity: 0.4;font-weight: 800;line-height: 770px;font-size: 15pt;}
   		.imgDetail>img{max-width:250px;}
		
		/* 네비바 */
	    #title{font-size: 15px;color:dimgray;font-weight: 700;line-height: 100px;}
	    .navigator {background-color:white; border-bottom: 1px solid #bcbcbc;height:50px;}
	    #bTitle{font-size: 15px;color:dimgray;font-weight: 700;line-height: 50px;}
	    #categoryTab{width: 20%; height: 100%;display:inline-block; font-weight: 800;}
	    #categoryBar{height: 80%;}
	    #searchBar{width: 20%; height: 100%; display: none; font-weight: 800; line-height: 50px; margin-top: 6px;}
	    #toSearch{height: 100%; font-weight: 800;display: none; margin-bottom:5px;}
	   	#menuIcon{ margin-top: 17px;}
	    .bar{position:relative; width: 30px;height: 3px;background: dimgray;}
	    #menuText{ line-height: 50px; }
	    #btnMenu:hover{cursor:pointer;}
	    /* 숨김메뉴 */
	    .menu{width: 100%;height: 100%;position:fixed;display: none;z-index: 5;}
	    .menubar{ background-color: white;}
	    .mainblock{ background: rgba(0,0,0,0.5);}
	    #menu-nickname {width:100%;height: 200px;line-height: 200px;font-size: 30pt;}
	    .borderDelete{border: 0px;}
		/* 	    푸터 */
	    #bottom{width: 100%;color:white;background: #5e5e5e; height: 150px;}
	    #bottom-logo{height: 150px; line-height: 150px;}
	    #bottom-contents{font-size: 10pt;color: white;}
	    .container-fuild{ width:1900px; max-width:none !important;}
	    
	    .mainLogo{
            	position:relative;
                color: white;
                font-size:50px;
                font-weight: 700;
                text-align: center;
            }
            .LogoDiv:after{
                display: block;
                position:absolute;
                top:0;
                left: 0;
                background-image:url('/imgs/bg/clothesLogo2.jpg');
                background-attachment: fixed; 
                height: 600px;
                width: 100%;
                z-index: -1;
                content: "";  
                background-size: 100% 100%;
            }
	   
    </style>
    <body>
    
    	<!-- 숨김 메뉴 -->
		<jsp:include page="../../standard/hideMenu.jsp"/>
        <div class="container-fuild fixed p-0 ">
        <!-- 네비 -->
		<div class="navigator fixed-top row m-0">
			<div class="col-1 p-0" id="btnMenu">
				<div class="row m-0" id="menuItem">
					<div class="col-4 p-0">
						<div class="row m-0">
							<div class="col-12" id="menuIcon">
								<div class="row m-0 mb-1 bar bar-one"></div>
								<div class="row m-0 mb-1 mt-1 bar bar-two"></div>
								<div class="row m-0 mb-1 bar bar-three"></div>
							</div>
						</div>
					</div>
					<div class="col-8 p-0 text-center d-none d-md-block" id="menuText">
						<span style="font-weight: 700; color: dimgray;">MENU</span>
					</div>
				</div>
			</div>
			<div class="col-10 p-0 d-none d-md-block text-center">
				<span id="bTitle">HELP BOARD</span>
			</div>
			<div id="searchBox" class="col-1 p-0 m-0"></div>
		</div>
		<!-- 상단 설명 -->
          <div class="row m-0 LogoDiv" style="height: 600px;">
                <div class="col-12">
                <!-- 위 메뉴 공백 채우기 -->
                <div class="row" style="margin-top: 100px;"></div>
                    <div class="col-12">
                        <div class="row">
                           <div class="col-12 mainLogo" id="mainLogo">
			                    <p class="mainLogo" style="margin-top: 95px;">HELP BOARD</p>
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
                    </div>
                </div>
            </div>
         <!-- 상단 설명 -->
		<div class="row m-0" style="height: 50px;"></div>
		<div class="col-12" style="margin:auto;">
		<div class="bean" style="height:50px;"></div>
		<div class="row">
			<div class="col-7" style="margin:auto">
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
            <div class="row mt-2 mb-2">
               <div class="col-12">
	               <label>제목</label>
	               <input type="text" class="form-control" name="title" id="title" value="${dto.title}" disabled>
               </div>
               <div class="col-12">
               		<span style="float:left;font-size:13px;">${dto.write_date}</span>
               		<span style="float:right; font-size:17px;font-weight: 700;">${dto.nickname }</span>
               </div>
             </div>
         
            <div class="row mt-3">
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
                <!-- 처음 페이지 접근시 생성 -->
				<div class="col-6 p-2 text-center" id="dressInfoBlock" style="border: 1px solid #bcbcbc;">
					<span style="color:white;">옷을 선택해 주세요</span>
				</div>
                <div class="col-6 p-2" id="dressInfo" style="border: 1px solid #bcbcbc;">
                    <div class="row">
                		<div class="col-12 imgDetail"></div>
                	</div>
                	<div class="row">
                		<div class="col-12">
                			<div class="row">
                				<div class="col-12">
                					<label>옷 이름</label> 
									<input class="form-control" type="text" id="name" disabled> 
                				</div>
                			</div>
                			<div class="row">	
                				<div class="col-12">
                					<label>카테고리</label> 
									<input class="form-control" type="text" id="categoryInput" disabled>
                				</div>
                			</div>
                			<div class="row">
                				<div class="col-12">
	                				<label>계절</label> 
									<input class="form-control" type="text" id="season" disabled>
								</div> 
                			</div>
 
                		</div>
                	</div>
                </div>
           </div>
            <c:if test="${writer == email}">
	            <div class="row">
	            	<c:choose>
	            		<c:when test="${dto.choice == 'N' }">
	            			<div class="col-12 mt-3" style="text-align:center">
			            		<button id="selectThis" class="btn btn-success" style="width:200px;">채택하기</button>
			            	</div>
	            		</c:when>
	            		<c:otherwise>
	            			<div class="col-12 mt-3" style="text-align:center">
			            		<button id="selectThis" class="btn btn-success" style="width:200px; background:#8a1b19;border:none; color:white">채택되었습니다</button>
			            	</div>
	            		</c:otherwise>
	            	</c:choose>
	            </div>
            </c:if>

                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-12 mt-3 mb-3">
                                <textarea class="form-control" style="resize: none;" rows="15" name="contents" id="contents" disabled>${dto.contents}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mb-5">
                    <div class="col-6" style="text-align: left;">
                        <button class="btn btn-info" type="button" id="back">목록</button>
                    </div>
                    <div class="col-6" style="text-align: right;">
                    <c:choose>
						<c:when test="${dto.email == email}">
							<span style="float:right" class="updateBtn deleteBtn ml-2"><button class="btn btn-info" type="button" id="back">삭제</button></span>
							<span style="float:right" class="updateBtn modifyBtn ml-2"><button class="btn btn-info" type="button" id="back">수정</button></span>
							<span style="float:right; display: none;" class="updateBtn modifyConfirm ml-2"><button class="btn btn-info" type="button" id="back">목록</button></span>
						</c:when>
						<c:otherwise>
							<span style="float:right" class="updateBtn notifyBtn ml-2"><button class="btn btn-info" type="button" id="back">신고</button></span>
						</c:otherwise>
					</c:choose>
					</div>
                </div>
                <form action="${pageContext.request.contextPath}/board/helpDetail" id="backFrm" method="post">
                	<input type="hidden" name="no" value="${dto.b_no }">
                	<input type="hidden" name="cpage" value="${cpage}">
                </form> 
          	 </div>
        </div> 
        </div>
        <jsp:include page="../../standard/boardFooter.jsp"/>			
        </div>
        
        <script>
        	$(".deleteBtn").on("click",function(){
        		var result = confirm("정말 삭제하시겠습니까?");
        		if(result){
        			location.href="${pageContext.request.contextPath}/advisor/deleteAdvisor?no=${dto.no}&b_no=${dto.b_no}";
        		}
        	})
        	$(".notifyBtn").on("click",function(){
        		if("${email}" == ""){
    				alert("로그인 후 이용가능한 기능입니다.");
    				return;
    			}
    			
    			var result = confirm("해당 게시글을 신고하시겠습니까?");
    			if(result){
    				$.ajax({
    					url:"${pageContext.request.contextPath}/notify/notifyProc.do",
    					data:{
    						category : "A",
    						c_no : "${dto.no}"
    					}
    				}).done(function(data){
    					
    					if(data == "good"){
    						alert("정상적으로 신고가 완료 되었습니다.");
    					}else{
    						alert("이미 신고한 댓글 입니다.");
    					}
    				})
    			}
        	})
        	$("#back").on("click",function(){
        		backFrm.submit();
        	})
        </script>
	<!--  숨김메뉴 스크립트 -->
        <script>
	        $("#btnMenu").on("click",function(){
	            $(".menu").css("display","flex");
	            $(".navigator").css("z-index","1");
	        });
	        $(".mainblock").on("click",function(){
	            $(".menu").css("display","none");
	        });
	        $("#closeMenu").on("click",function(){
	            $(".menu").css("display","none");
	        });
	        $("#btnSearch").on("click",function(){
	            $("#btnCloseSearch").css("display","flex");
	            $("#btnSearch").css("display","none");
	            $("#toSearch").css("display","inline-block");
	            $("#searchBar").css("display","inline-block");
	            $("#bTitle").css("display","none");
	            $("#categoryTab").css("display","none");
	        });
	        $("#btnCloseSearch").on("click",function(){
	            $("#btnSearch").css("display","flex");
	            $("#btnCloseSearch").css("display","none");
	            $("#toSearch").css("display","none");
	            $("#searchBar").css("display","none");
	            $("#bTitle").css("display","inline-block");
	            $("#categoryTab").css("display","inline-block");
	        });
        </script>
        <script>
	     // 디테일 초기화
			var init = function() {
				$(".imgDetail").html("");
				$("#name").val("");
				$("#categoryInput").val("");
				$("#season").val("");
			}
        	$(".category").on("click",function(){
        		$("#dressInfoBlock").css("display","none");
        		$("#dressInfo").css("display","block");
        		init();
        		var src = $(this).children("img").attr("src");
    			var img = $("<img onError='javascript:this.src='/imgs/shilouette/whiteBack.JPG''>");
    			img.attr("src", src);
    			$(".imgDetail").append(img);
    			$.ajax({
    				url : "${pageContext.request.contextPath}/closet/styleDetailDress",
    				data : { path : src },
    				dataType : "json"
    			}).done(function(data) {
    				if (data != null) {
    					$("#name").val(data.name);
    					$("#categoryInput").val(data.category);
    					$("#season").val(data.season);
    
    				}
    			})        		
        	});
        </script>
        <script>
//             채택하기 스크립트
        	var check = "${dto.choice}";
        	$("#selectThis").on("click",function(){   		
        		
        		if(check == "Y"){
        			var result = confirm("이미 채택 된 댓글 입니다. 채택을 해제 하시겠습니까?");
        			if(result){
        				check = 0;
        				$.ajax({
        					url:"${pageContext.request.contextPath}/advisor/choiceReturn",
        					data : {
        						no : "${dto.no}"
        					}
        				}).done(function(){
        					
        					$("#selectThis")
            				.css("background","")
            				.css("color","")
            				.css("border","")
            				.text("채택하기");
        					
        				})
        			}
        			return;
        		}else{
	        		var result = confirm("채택은 하나의 게시물만 가능 합니다. 정말 채택하시겠습니까?");
	        		
	        		if(result){
	        			check = 1;
	        			$.ajax({
	        				url:"${pageContext.request.contextPath}/advisor/choiceThisAdvisor",
	        				data:{
	        					no:"${dto.no}",
	        					b_no : "${dto.b_no}"
	        				}
	        			}).done(function(data){
	        				if(data == "fail"){
	        					alert("이미 채택 된 게시물이 존재합니다.");
	        				}else{
	        					$("#selectThis")
		        				.css("background","#8a1b19")
		        				.css("color","white")
		        				.css("border","none")
		        				.text("채택되었습니다");
	        				}
	        			})
	        		}
        		}
        	})
        </script>
       

    </body>
</html>