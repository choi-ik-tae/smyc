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
		.imgDetail {width:200px;height: 300px;z-index: 1;margin: auto;margin-top:80px; text-align:center}
		#dressInfo{ display: none;}
   		#dressInfoBlock{height: 770px;background-color: dimgray; opacity: 0.4;font-weight: 800;line-height: 770px;font-size: 15pt;}
   		.imgDetail>img{max-width:250px; max-height:300px;}
		
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
			                    <p class="mainLogo" style="margin-top: 95px;"><span style="color:indianred;">H</span>ELP <span style="color:darkred;">B</span>OARD</p>
			                    <div class="p-3" style="font-size:18px; color:white; font-weight: 700; background: rgba(0,0,0,0.7); width: 500px; margin: auto; border-radius: 10px;">
			                        <span style="display: block;">코디에 자신이 없어도 괜찮아요!</span>
			                        <span style="display: block;">자유롭게 대화를 나누며 <span style="color:indianred">코디를 완성</span> 시키세요</span>
			                        <span style="display: block;">또 친구들의 코디를 도와주세요!</span>
			                        <span style="display: block;">친구들에게 자신의 <span style="color:darkred">센스</span>를 뽐내보세요</span>
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
                			<img src="${dto.top}" onError="javascript:this.src='/imgs/shilouette/whiteBack.JPG'" class="loadImg">
                		</c:otherwise>
                	</c:choose>
                </div>
                <div class="category Pants text-center" id="Pants">
                	<c:choose>
                		<c:when test="${dto.pants==null}">
                			PANTS
                		</c:when>
                		<c:otherwise>
                			<img src="${dto.pants}" onError="javascript:this.src='/imgs/shilouette/whiteBack.JPG'" class="loadImg">
                		</c:otherwise>
                	</c:choose>
                </div>
                <div class="category Shoes text-center" id="Shoes">
                	<c:choose>
                		<c:when test="${dto.shoes==null}">
                			SHOES
                		</c:when>
                		<c:otherwise>
                			<img src="${dto.shoes}" onError="javascript:this.src='/imgs/shilouette/whiteBack.JPG'" class="loadImg">
                		</c:otherwise>
                	</c:choose>
                </div>
                <div class="category Acc text-center" style="width: 150px;" id="Acc">
                	<c:choose>
                		<c:when test="${dto.acc==null}">
                			ACC
                		</c:when>
                		<c:otherwise>
                			<img src="${dto.acc}" onError="javascript:this.src='/imgs/shilouette/whiteBack.JPG'" class="loadImg">
                		</c:otherwise>
                	</c:choose>
                </div>
            </div>
          <form action="${pageContext.request.contextPath}/advisor/advisorModifyProc" method="post" id="uploadFrm">
            <div class="row mt-2 mb-2">
               <div class="col-12">
	               <label>제목</label>
	               <input type="text" class="form-control" name="title" id="title" value="${dto.title}">
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
				<div class="col-6 p-2" style="border: 1px solid #bcbcbc;">
                    <div class="row">
                        <div class="col-12">
                            <select class="form-control" id="closet" name="closet" onchange="changeClosetSelect()">
                                <c:forEach var="closetDTO" items="${closetList}">
									<option value="${closetDTO.no}" >${closetDTO.name}</option>
								</c:forEach>
                            </select>
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
                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-12 mt-3 mb-3">
                                <textarea class="form-control" style="resize: none;" rows="15" name="contents" id="contents">${dto.contents}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mb-5">
                    <div class="col-6" style="text-align: left;">
                        <button class="btn btn-info" type="button" id="back">돌아가기</button>
                    </div>
                    <div class="col-6" style="text-align: right;">
                    <c:choose>
						<c:when test="${dto.email == email}">
							<span style="float:right" class="updateBtn modifyBtn ml-2"><button class="btn btn-info" type="button" id="advisorModifyBtn">수정</button></span>
						</c:when>
					</c:choose>
					</div>
                </div>
                
            		<input type="hidden" name="cpage" value="${cpage}">
            		<input type="hidden" name="top" id="topHidden">
	            	<input type="hidden" name="pants" id="pantsHidden">
	            	<input type="hidden" name="shoes" id="shoseHidden">
	            	<input type="hidden" name="acc" id="accHidden">
	            	<input type="hidden" name="b_no" value="${dto.b_no}">
	            	<input type="hidden" name="no" value="${dto.no}">
	            </form>
                
          	 </div>
        </div> 
        </div>
        <jsp:include page="../../standard/boardFooter.jsp"/>			
        </div>
        <script>
        $("#advisorModifyBtn").on("click",function(){
    		var topSrc= $(".Top").children("img").attr("src");
    		var pantsSrc= $(".Pants").children("img").attr("src");
    		var shoseSrc= $(".Shoes").children("img").attr("src");
    		var accSrc = $(".Acc").children("img").attr("src");
    		
    		
    		if( topSrc == null && pantsSrc==null && shoseSrc==null && accSrc ==null){
    			alert("하나 이상 옷을 선택해주세요");
    			return;
    		}
    		
    		if( $("#title").val() == ""){
    			alert("제목을 적어주세요");
    			return;
    		}
    		
    		if($("#contents").val()==""){
    			alert("내용을 입력해주세요");
    			return;
    		}
    		
    		$("#topHidden").val(topSrc);
    		$("#pantsHidden").val(pantsSrc);
    		$("#shoseHidden").val(shoseSrc);
    		$("#accHidden").val(accSrc);
    		
    		var result = confirm("수정을 완료 하시겠습니까?");
    		
    		if(result){
    			$("#uploadFrm").submit();
    		}
    		
    	
    	})
        </script>
        
        <script>
         	var category_id = null;
         	var writer = "${writer}";
         	
         	
         	// 메뉴 초기화
        	var divInit = function(){
        		$(".categoryMenu").html("");
        		var div = $("<div class='noneDiv'>");
        		var img = $("<img src='/imgs/shilouette/none.png'>")
        		div.append(img);
        		$(".categoryMenu").append(div);
        	}
         	
        	// 동적 바인딩 이벤트 (끌어온 이미지 클릭 이벤트) 
        	$("body").on("click",".categoryImgDiv",function(){
        		var src= $(this).children("img").attr("src");
         		var img = $("<img class='loadImg' id='"+category_id+"Img'>");
        		img.attr("src",src);
        		
        		$("."+category_id).css("opacity","0.9").css("line-height","0px");
        		$("."+category_id).html(img);
        	})
        	
        	// 카테고리 로고 띄워주기
        	$("body").on("click",".noneDiv",function(){
        		var height = $("."+category_id).css("height");
        		$("."+category_id).html("");
        		$("."+category_id).text(category_id.toUpperCase()).css("opacity","0.7").css("line-height",height);
        	})
        
	     	// 옷장 변경 이벤트
			var changeClosetSelect = function(){
	     		
				divInit();
	
				var closet = $("#closet option:selected").val();
				
				if(category_id == null){
					category_id ="Top";
				}
				selectDressAll(category_id , closet,writer);
			}
	     	
			// 카테고리 클릭이나 옷장 변경 시  실행되는 ajax
         	var selectDressAll = function(category , closet, writer){
				console.log(category);
				console.log(closet);
				console.log(writer);
         		
         		$.ajax({
            		url:"${pageContext.request.contextPath}/advisor/selectCategoryMenu",
            		data:{
            			category : category,
            			c_no : closet,
            			writer: writer
            		},
            		dataType:"json"
            	}).done(function(data){        
            		for(i=0;i<data.length;i++){
            			var div=$("<div class='categoryImgDiv'>")
            			var img = $("<img>");
            			img.attr("src",data[i].file);
            			div.append(img);
            			$(".categoryMenu").append(div);
            		}         		
            		
            	}).fail(function(){
            		console.log("fail");            		
            	})
         		
         	}
	     	
            $(".category").on("click",function(){
                var id = $(this).attr("id");
                $(".category-title").text(id.toUpperCase());
                
                category_id= id;
				var closet = $("#closet").val();
            	
				divInit();
				
            	selectDressAll(category_id, closet, writer);
                
                $(".categoryMenu").css("opacity","0")
                .animate({'opacity':1},300);
            })
            
        </script>
        
        <script>
        	$(".modifyBtn").on("click",function(){
        		$("#modifyFrm").submit();
        	})
        	
        	
        	$("#back").on("click",function(){
        		history.back();
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
        

       

    </body>
</html>