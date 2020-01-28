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
   
        <style>
       
		   *{box-sizing: border-box;font-family: 'Noto Sans KR', sans-serif;}
		     .gotoDetail{
            	text-decoration: none;
                color: black;
                width:100%;
                height:100%;
            }
            .gotoDetail:hover{
            	text-decoration: none !important;
            	color : black;        	
            }
            
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
                height: 100%;
                width: 100%;
                z-index: -1;
                content: "";  
                background-size: 100% 100%;
            }
            .container-fluid {width: 1903px;max-width: none !important;}
            /* 네비바 */
		    #title{font-size: 15px;color:dimgray;font-weight: 700;line-height: 100px;}
		    .navigator {background-color:white; border-bottom: 1px solid #bcbcbc;height:50px;width: 1903px;max-width: none !important;}
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
		    
		    .contents:hover{cursor:pointer;}
		</style>

    </head>
    <body>
    
    <!-- 숨김 메뉴 -->
	<jsp:include page="../../standard/hideMenu.jsp"/>
        <!-- 본문 -->    
        <div class="container-fluid p-0" id="bk">
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
			                        <span style="display: block;">자유롭게 대화를 나누며 코디를 완성</span>
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
            <!-- 게시글 주루룩 -->
            <div class="row m-0" style="background: white">
                <div class="col-8 mt-5 mb-2" style="margin:auto;">
        			<div class="row">
        				<div class="col-6">
		                	<div class="row" style="float:left;">
		                		<div class="col-9 pr-1">
		                			<input id="inputSearch" type="text" class="form-control m-0 p-0" style="width:300px; display:inline-block;">
		                		</div>
		                		<div class="col-3 pl-2">
		                			<button id="helpSearchBtn" class="btn btn-info m-0">search</button>
		                		</div>
		                	</div>
	                	</div>
	                	<div class="col-6">
		                	<span style="float:right;">
		                    	<button class="btn btn-info" id="helpUploadBtn" style="width: 130px;">도움 요청</button>
		                    </span>
	                    </div>
                    </div>		
                </div>
                <div class="col-8 form-title mt-1 mb-1 p-4" style="margin:auto ;border : 1px solid #bcbcbc;border-radius: 10px; text-align: center;">
                    <div class="row" style="height: 40px; line-height: 35px; border-bottom: 1px solid #bcbcbc;font-size:17px; font-weight:600;">
                        <div class="col-1">
                            NO
                        </div>
                        <div class="col-6">
                            TITLE
                        </div>
                        <div class="col-2">
                            NICKNAME
                        </div>
                        <div class="col-1">VIEW</div>
                        <div class="col-2">DATE</div>
                    </div>
					<c:forEach items="${list}" var="dto">
	                    <div class="row contents mt-2 mb-2" style="border-radius:10px;" onclick="detailHelp(${dto.no})">
	                        <div class="col-1">
	                            ${dto.no}
	                        </div>
	                        <div class="col-6" style="text-align: left;">
	                            ${dto.title}
	                        </div>
	                        <div class="col-2">
	                            ${dto.nickname }
	                        </div>
	                        <div class="col-1">${dto.views}</div>
	                        <div class="col-2">${dto.write_date}</div>
	                    </div>
                    
                    </c:forEach>
                </div>
                <div class="col-12 mt-2 mb-5"  style="text-align: center;">
                    ${page}
                </div>
                <form action="${pageContext.request.contextPath}/board/helpDetail" method="post" id="detailFrm">
                	<input type="hidden" name="no" id="no">
                	<input type="hidden" name="cpage" value="${cpage}">
               </form>

            </div> 
            
            <jsp:include page="../../standard/boardFooter.jsp"/>	
        </div>
        
        
      <script>
      	var detailHelp = function(no){
      		$("#no").val(no);
      		$("#detailFrm").submit();
      	}
      	$(".contents").on("mouseenter",function(){
      		console.log($(this).children());
      		$(this).children().css("background","rgba(188,188,188,0.2)");
      	});
      	$(".contents").on("mouseleave",function(){
      		console.log($(this).children());
      		$(this).children().css("background","");
      	});
    	$("#toSearch").on("click",function(){
    		var keyword = $("#searchBar").val();
    		$("#searchTarget").val(keyword);
    		$("#searchFrm").submit();
    	});
	    $("#btnMenu").on("mouseover",function(){
	        $(".bar").css("background-color","black");
	        $("#menuText").css("color","black");
	    });
	    $("#btnMenu").on("mouseout",function(){
	        $(".bar").css("background-color","dimgray");
	        $("#menuText").css("color","dimgray");
	    });
	    $("#categoryTab").on("change",function(){
	    	$("#AlignTarget").val($("#categoryTab option:selected").val());
	    	$("#alignFrm").submit();
		});
    	$(".boardItem").on("click",function(){
    		$("#detailTarget").val($(this).attr("id"));
    		$("#detailFrm").submit();
    	});
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
		    $("#helpSearchBtn").on("click",function(){
		        var search = $("#inputSearch").val();
		        location.href="${pageContext.request.contextPath}/board/helpSearch?search="+search;
		     })
			
            $("#helpUploadBtn").on("click",function(){
            	if('${email}' == ""){
            		alert("로그인을 해주세요!");
            		location.href="${pageContext.request.contextPath}/signin";
            	}else{
            		location.href="${pageContext.request.contextPath}/helpUpload";
            	}
            })
        </script>
    </body>
</html>