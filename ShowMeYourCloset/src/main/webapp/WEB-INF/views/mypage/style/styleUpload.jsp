<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstap4 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
        <style>
            .imgBox{
                position:absolute;
                left:550px;
                top:68px;
            }
            .category{
                position: absolute;
                width: 200px;
                z-index: 1;
                border-radius: 10px;
                color : white;
                font-size: 28px;
                background-color: darkgrey;
                opacity: 0.7;
                text-align: center;
            }
            .category:hover{
                background-color: grey;
            }
            .Top{
                height: 200px;
                line-height: 180px;
                left: 650px;
                top:210px;
            }
            .Pants{
                left: 650px;
                top: 420px;
                height: 210px;
                line-height: 210px;
            }
            .Shoes{
                left: 650px;
                top: 640px;
                height: 150px;
                line-height: 150px;
            }
            .Acc{
                top:300px;
                left: 380px;
                height: 150px;
                line-height: 150px;
            }
            .categoryMenu{
                position:absolute;
                height: 780px;
                width: 550px;
                left: 950px;
                top:160px;
                z-index:2;
                border-radius:10px;
                background:white;
                border : 1px solid #bcbcbc;
            }
            #shilouette{
                width: 400px;
            }
            .wrapper{
                position: absolute;
                height: 940px;
                min-width:100%;
                top:80px;
            }
            .form-wrapper{
                position:absolute;
                top:1530px;
                min-width: 100%;
            }
            .seasonBtn{
                margin-right: 2px;
                width: 80px;
                font-size:14px;
            }
            .categoryImgDiv{
			   width:150px;
			   height:150px;
			   display:inline-block;
			   padding:5px;
			}
			.noneDiv {
			   width:150px;
			   height:150px;
			   display:inline-block;
			   padding:5px;
			}
			.noneDiv>img{
				width:100%;
			    height:100%;
			}
			.categoryImgDiv>img{
			   width:100%;
			   height:100%;
			}
			.loadImg{
			   width:100%;
			   height:100%;
			}
			 .checkLabel{
                background: darkgrey;
            }
            .categoryTitle{
            	font-size:15px; 
            	text-align:center;
            }
            .closetSelc{
            	position:absolute;
            	left: 1070px;
            	top:30px;
            }
			#top{height: 80px;background-color:white;border-bottom: 1px solid gray;width: 1903px;max-width: none !important;}
			#bottom {background-color: white;border-top: 1px solid gray;width: 100%;height: 150px;}
		    #bottom-logo{height: 150px; line-height: 150px;}
		    #bottom-contents{font-size: 10pt;color: gray;}
		    .nav-item>a{color: black; font-size: 15pt;}
   			.logo{font-size: 15pt;}
   			.bg{background:rgba(255,255,255,1); border-radius: 10px;}
    		body{background-image: url(/imgs/bg/test3.jpg); background-attachment: fixed;  background-repeat:no-repeat;-webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover; background-size: cover;}
    		.form-wrapper{width: 1903px;max-width: none !important;}
        </style>
        
        <script type="text/javascript">
			 window.history.forward();
			 function noBack(){window.history.forward();}
		</script>

</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
        <div class="wrapper-All">
        	<!-- 헤더 -->
			<jsp:include page="../../standard/header.jsp" />

            <div class="categoryMenu p-3" >
            	
            </div>

            <div class="wrapper bg">
            
            	<div class="closetSelc" style="width:300px;">
					<select class="form-control" id="closet" name="closet" onchange="changeClosetSelect()">
						<c:forEach var="closetDTO" items="${closetList}">
							<option value="${closetDTO.no}" >${closetDTO.name}</option>
						</c:forEach>
					</select>
				</div>
	
                <div class="category Top" id="Top">Top</div>
                <div class="category Pants" id="Pants">Pants</div>
                <div class="category Shoes" id="Shoes">Shoes</div>
                <div class="category Acc" id="Acc">Acc</div>
                <div class="imgBox">
                <c:choose>
                	<c:when test="${gender == 'W'}">
                		  <img src="/imgs/shilouette/woman.png" id="shilouette">
                	</c:when>
                	<c:otherwise>
                		  <img src="/imgs/shilouette/man.png" id="shilouette">
                	</c:otherwise>
                </c:choose>
                </div>

            </div>
            <form id="insertFrm" action="${pageContext.request.contextPath}/style/insertProc" method="post">
    				<input type="hidden" name="email" value="${email}">
	            	<input type="hidden" name="top" id="topHidden">
	            	<input type="hidden" name="pants" id="pantsHidden">
	            	<input type="hidden" name="shoes" id="shoseHidden">
	            	<input type="hidden" name="acc" id="accHidden">
                <div class="form-wrapper bg">
                    <div class="row m-0">
                        <div class="col-7 p-5" style="margin:auto">
                            <label for="InputName">Style Name</label>
                            <input type="text" class="form-control" name="name" id="InputName">
                        </div>
                        <div class="col-7 pl-5 pb-5" style="margin:auto">
                            <label>Season</label>
                            <div style="padding-left: 30px;">
                                 <div class="btn-group-toggle" data-toggle="buttons">
					                <label class="btn checkLabel" id="springLabel">
					                    <input type="checkbox" name="season" class="checkList" id="spring" value="spring"> spring
					                </label>
					                <label class="btn checkLabel" id="summerLabel">
					                    <input type="checkbox" name="season" class="checkList" id="summer" value="summer"> summer
					                </label>
					                <label class="btn checkLabel" id="fallLabel">
					                    <input type="checkbox" name="season" class="checkList" id="fall" value="fall"> fall
					                </label>
					                <label class="btn checkLabel" id="winterLabel">
					                    <input type="checkbox" name="season" class="checkList" id="winter" value="winter"> winter
					                </label>
					            </div>
                            </div>
                        </div>
                        <div class="col-7 pl-5 pb-5 pr-5" style="margin:auto">
                            <label for="InputMemo">Memo</label>
                            <textarea class="form-control" style="height: 150px; resize: none;" id="InputMemo" name="memo"></textarea>
                        </div>
                    </div>
                    <div class="row m-0">
		                <div class="col-7" style="text-align:center; margin:auto">
							<span style="color:darkred">메모</span> 는 <span style="color:orangered">선택사항</span> 입니다.
		                </div>
	           	 	</div>
                    <div class="row m-0">
                        <div class="col-7 pl-5 pb-5 pr-5" style="margin:auto">
                           <span style="float: right;">
                                <button type="button" id="styleInsertBtn" class="btn btn-secondary">저장하기</button>
                            </span>
                            <span style="float: left">
                                <button type="button" class="btn btn-secondary" id="goBack">돌아가기</button>
                            </span>
                        </div>
                    </div>
                    <jsp:include page="../../standard/footer.jsp" />
                </div>             	     
            </form>
        </div>
		<script>
		
			$("#goBack").on("click",function(){
				history.back();
			})
				
		//계절 선택
            $(".checkList").on("change",function(){
                var checkid=$(this).attr("id");

                if($(this).prop("checked")){
                    $("#"+checkid+"Label").css("background","dimgrey")
                    .css("border","2px solid dimgrey");
                }else{
                    $("#"+checkid+"Label").css("background","darkgrey")
                    .css("border","none");
                }
            })
        </script>
        
        <script>
        //코디 등록하기
        	$("#styleInsertBtn").on("click",function(){
        		var topSrc= $(".Top").children("img").attr("src");
        		var pantsSrc= $(".Pants").children("img").attr("src");
        		var shoseSrc= $(".Shoes").children("img").attr("src");
        		var accSrc = $(".Acc").children("img").attr("src");
        		
        		
        		if( topSrc == null && pantsSrc==null && shoseSrc==null && accSrc ==null){
        			alert("하나 이상 옷을 선택해주세요");
        			return;
        		}
        		
        		if( $("#InputName").val() == ""){
        			alert("옷의 이름을 정해주세요");
        			return;
        		}
        		
        		var checkListBox = $("input[name=season]");
        		var checkFinish = 0;
        		for(var i=0;i<checkListBox.length;i++){
        			if($(checkListBox[i]).prop("checked") == true){
        				checkFinish =1;
        				break;
        			}
        		}
        		
        		if(checkFinish == 0){
        			alert("계절을 하나 이상 선택해주세요");
        			return;
        		}
        		
        		$("#topHidden").val(topSrc);
        		$("#pantsHidden").val(pantsSrc);
        		$("#shoseHidden").val(shoseSrc);
        		$("#accHidden").val(accSrc);
        		
        		$("#insertFrm").submit();
        	
        	})
        	
        </script>
        
        <!-- 코디 시키기 이벤트 -->
        <script>
    	
	     	// 카테고리 아이디
	    	var cid ="Top";
        
        	// 메뉴 초기화
        	var divInit = function(){
        		$(".categoryMenu").html("");
        		
        		var title = $("<div class='categoryTitle'>");
        		title.html(cid).css("font-size","28px").css("font-weight","700");
        		$(".categoryMenu").append(title);
        		var div = $("<div class='noneDiv'>");
        		var img = $("<img src='/imgs/shilouette/none.png'>")
        		div.append(img);
        		$(".categoryMenu").append(div);
        	}

         	
         	// 동적 바인딩 이벤트 (끌어온 이미지 클릭 이벤트) 
        	$("body").on("click",".categoryImgDiv",function(){
        		var src= $(this).children("img").attr("src");
         		var img = $("<img class='loadImg' id='"+cid+"Img'>");
        		img.attr("src",src);
        		
        		$("."+cid).css("opacity","0.9").css("line-height","0px");
        		$("."+cid).html(img);
        		
        	})
        	
        	// 카테고리 로고 띄워주기
        	$("body").on("click",".noneDiv",function(){
        		var height = $("."+cid).css("height");
        		$("."+cid).html("");
        		$("."+cid).text(cid).css("opacity","0.7").css("line-height",height);
        	})
        	
         	
        	// 카테고리 클릭이나 옷장 변경 시  실행되는 ajax
         	var selectDressAll = function(category , closet){
         		
         		$.ajax({
            		url:"${pageContext.request.contextPath}/style/selectCategoryProc",
            		data:{
            			category : category,
            			c_no : closet
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
         	
         	
         	// 옷장 변경 이벤트
			var changeClosetSelect = function(){
         		
				divInit();
	
				var closet = $("#closet option:selected").val();
				console.log(closet);
				if(cid == "none"){
					cid="Top";
				}
				selectDressAll(cid, closet);
				
			}
        	
        	
        	// 카테고리 div 클릭 이벤트
            $(".category").on("click",function(){
            	           	
            	cid= $(this).attr("id");
            	var closet = $("#closet").val();
            	
            	divInit();
            	
            	selectDressAll(cid, closet);
                
                $(".categoryMenu").css("opacity","0")
                .animate({'opacity':1},300);

            })

        </script>
</body>
</html>