<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


        <style>
            .imgBox{
                position:absolute;
                left:250px;
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
            .top{
                height: 200px;
                line-height: 180px;
                left: 350px;
                top:210px;
            }
            .pants{
                left: 350px;
                top: 420px;
                height: 210px;
                line-height: 210px;
            }
            .shose{
                left: 350px;
                top: 640px;
                height: 150px;
                line-height: 150px;
            }
            .acc{
                top:300px;
                left: 80px;
                height: 150px;
                line-height: 150px;
            }
            .categoryMenu{
                position:absolute;
                display: none;
                height: 780px;
                width: 558px;
                left: 950px;
                top:80px;
                border: 1px solid black;
                z-index:2;

            }
            #shilouette{
                width: 400px;
            }
            .wrapper{
                position: absolute;
                border: 2px solid #bcbcbc;
                height: 940px;
                width: 1350px;
                left: 300px;
                border-radius: 20px;

            }
            .form-wrapper{
                position:absolute;
                left: 300px;
                top:950px;
                border : 2px solid #bcbcbc;
                width: 1350px;
                border-radius: 20px;
            }
            .seasonBtn{
                margin-right: 2px;
                width: 80px;
                font-size:14px;
            }
            .categoryImgDiv{
			   width:150px;
			   height:150px;
			   border: 1px solid #bcbcbc;
			   display:inline-block;
			   padding:5px;
			}
			.categoryImgDiv>img{
			   width:100%;
			   height:100%;
			}
			.loadImg{
			   width:100%;
			   height:100%;
			}


        </style>

</head>
<body>
        <div class="wrapper-All">

            <div class="categoryMenu"></div>

            <div class="wrapper">

                <div class="category top" id="top">Top</div>
                <div class="category pants" id="pants">Pants</div>
                <div class="category shose" id="shose">Shose</div>
                <div class="category acc" id="acc">Acc</div>
                <div class="imgBox">
                    <img src="imgs/shilouette/man.png" id="shilouette">
                </div>

            </div>
            <form id="insertFrm" action="${pageContext.request.contextPath}/style/insertProc" method="post">
    				<input type="hidden" name="email" value="${email}">
	            	<input type="hidden" name="top" id="topHidden">
	            	<input type="hidden" name="pants" id="pantsHidden">
	            	<input type="hidden" name="shose" id="shoseHidden">
	            	<input type="hidden" name="acc" id="accHidden">
                <div class="form-wrapper">
                    <div class="row">
                        <div class="col-12 p-5">
                            <label for="InputName">Style Name</label>
                            <input type="text" class="form-control" name="name" id="InputName">
                        </div>
                        <div class="col-12 pl-5 pb-5">
                            <label>Season</label>
                            <div style="padding-left: 30px;">
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <button type="button" class="btn btn-secondary seasonBtn">봄</button>
                                    <button type="button" class="btn btn-secondary seasonBtn">여름</button>
                                    <button type="button" class="btn btn-secondary seasonBtn">가을</button>
                                    <button type="button" class="btn btn-secondary seasonBtn">
                                        겨울
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 pl-5 pb-5 pr-5">
                            <label for="InputMemo">Memo</label>
                            <textarea class="form-control" style="height: 150px; resize: none;" id="InputMemo" name="memo"></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 pl-5 pb-5 pr-5">
                           <span style="float: right;">
                                <button type="button" id="styleInsertBtn" class="btn btn-secondary">저장하기</button>
                            </span>
                            <span style="float: left">
                                <button type="button" class="btn btn-secondary">돌아가기</button>
                            </span>
                        </div>
                    </div>
                </div>
              
            </form>
        </div>
        
        <script>
        	$("#styleInsertBtn").on("click",function(){
        		var topSrc= $(".top").children("img").attr("src");
        		var pantsSrc= $(".pants").children("img").attr("src");
        		var shoseSrc= $(".shose").children("img").attr("src");
        		var accSrc = $(".acc").children("img").attr("src");
        		
        		console.log(topSrc);
        		
        		$("#topHidden").val(topSrc);
        		$("#pantsHidden").val(pantsSrc);
        		$("#shoseHidden").val(shoseSrc);
        		$("#accHidden").val(accSrc);
        		
        		$("#insertFrm").submit();
        	
        	})
        	
        </script>
        
        <!-- 코디 시키기 이벤트 -->
        <script>
        
        	// 메뉴 초기화
        	var divInit = function(){
        		$(".categoryMenu").html("");
        	}
        	
         	// 카테고리 아이디
        	var cid ="none";
         	
         	// 동적 바인딩 이벤트 (끌어온 이미지 클릭 이벤트) 
        	$("body").on("click",".categoryImgDiv",function(){
        		console.log(cid);
        		var src= $(this).children("img").attr("src");
         		var img = $("<img class='loadImg' id='"+cid+"Img'>");
        		img.attr("src",src);
        		
        		$("."+cid).css("opacity","1");
        		$("."+cid).html(img);
        		
        	})
        	
        	// 카테고리 div 클릭 이벤트
            $(".category").on("click",function(){
            	divInit();
            	
            	cid= $(this).attr("id");
            	
            	$.ajax({
            		url:"${pageContext.request.contextPath}/style/selectCategoryProc",
            		data:{
            			category : cid
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
                
                $(".categoryMenu").css("display","block")
                .css("opacity","0")
                .animate({'opacity':1},300);

            })

        </script>
</body>
</html>