<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Me Your Closet</title>
<!-- Bootstap4 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
    *{box-sizing: border-box;font-family: 'Noto Sans KR', sans-serif;}
    #closetImg{transform: translate(45%,5%); margin-bottom: 70px;}
    .nav-font{font-size: 10pt; font-weight: 800;}
    #dressBox>div>div{background:rgba(255, 255, 255, 0.2);border-radius: 5px;color: white;font-size: 20pt;font-weight: 800;}
    #accBox{position: absolute;left: 480px;top:50px;width:198px;height:500px;line-height: 500px; text-align: center;}
    #topBox{position: absolute;left: 690px;top:50px;width:269px;height:668px;line-height: 668px; text-align: center;}
    #pantsBox{position: absolute;left: 970px;top:50px;width:269px;height:668px;line-height: 668px; text-align: center;}
    #shoesBox{position: absolute;left: 1250px;top:50px;width:200px;height:500px;line-height: 500px; text-align: center;}
    .nav-item>a{color: black; font-size: 15pt;}
    .logo{font-size: 15pt;}
    #top{height: 80px;background-color:white;border-bottom: 1px solid gray;}
    #bottom{background-color:white;border-top: 1px solid gray;width: 100%;height: 150px;}
    #bottom-logo{height: 150px; line-height: 150px;}
    #bottom-contents{font-size: 10pt;color: gray;}
    .imgBox{position: relative; width:100%; height: 100%; overflow: auto; -ms-overflow-style: none;}
    .imgBox::-webkit-scrollbar {display:none;}
    .imgBox>img{border-radius: 20px;height: 130px;float: left;}
    .closetTag{position: relative;width: 100%;height: 50px;line-height: 50px;}
    .nav-link:hover{cursor: pointer;}
    input[name="targets"]{display: none;}
</style>
</head>
<script type="text/javascript">
 window.history.forward();
 function noBack(){window.history.forward();}
</script>
</head>
<body>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<div class="container-fuild">
	<div class="row mt-5" id="toTop">
        <div class="col-12 mt-5">
            <div class="row">
                <div class="col-12 text-center">
                    <h1 style="font-weight: 800;">${closet.name}</h1>    
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3 text-center m-auto">
                    <input type="text" class="form-control" id="closet" placeholder="변경할 옷장이름"><br>
					<fieldset style="border: 1px solid black" class="form-control text-left">
						<span class="ml-5 mr-4">디자인</span>
						<label for="d1" class="ml-2 mr-4">기본 <input type="radio" name="closetDesign" class="from-control" value="closet1" id="d1"></label> 
						<label for="d2" class="ml-2 mr-4">브라운 <input type="radio" name="closetDesign" class="from-control" value="closet2" id="d2"></label>
						<label for="d3" class="ml-2">베이지 <input type="radio" name="closetDesign" class="from-control" value="closet3" id="d3"></label>
					</fieldset>
                </div>
            </div>
        </div>
    </div>
	<div class="row" id="dressBox">
        <div class="col-12">
	        <img src="${pageContext.request.contextPath}/imgs/closet/${closet.img}.png" id="closetImg">
            <div id="topBox">
                <div class="imgBox text-left">
                <c:choose>
                	<c:when test="${topImgList.size() > 0}">
                	    <div class="closetTag text-center">TOP</div>
                		<c:forEach var="i" begin="0" end="${topList.size() - 1}">
                			<img src="${topImgList.get(i).path}" class="w-50 p-1 ckImg" id="target${topList.get(i).no}">
                			<input type="checkbox" name="targets" value="${topList.get(i).no}" id="target${topList.get(i).no}">
                		</c:forEach>
                	</c:when>
                	<c:otherwise>
                		<span class="d-block text-center">TOP</span>
                	</c:otherwise>
                </c:choose>
                </div>
            </div>
            <div id="pantsBox">
                <div class="imgBox text-left">
                <c:choose>
                	<c:when test="${pantsImgList.size() > 0}">
                	<div class="closetTag text-center">PANTS</div>
	                    <c:forEach var="i" begin="0" end="${pantsList.size() - 1}">
	                		<img src="${pantsImgList.get(i).path}" class="w-50 p-1 ckImg" id="target${pantsList.get(i).no}">
	                		<input type="checkbox" name="targets" value="${pantsList.get(i).no}" id="target${pantsList.get(i).no}">
	                	</c:forEach>
                	</c:when>
                	<c:otherwise>
                		<span class="d-block text-center">PANTS</span>
                	</c:otherwise>
                </c:choose>
                </div>
            </div>
            <div id="shoesBox">
                <div class="imgBox text-left">
                <c:choose>
                    <c:when test="${shoesImgList.size() > 0}">
                    <div class="closetTag text-center">SHOES</div>
	                    <c:forEach var="i" begin="0" end="${shoesList.size() - 1}">
	                		<img src="${shoesImgList.get(i).path}" class="w-50 p-1 ckImg" id="target${shoesList.get(i).no}">
	                		<input type="checkbox" name="targets" value="${shoesList.get(i).no}" id="target${shoesList.get(i).no}">
	                	</c:forEach>
                	</c:when>
                	<c:otherwise>
                		<span class="d-block text-center">SHOES</span>
                	</c:otherwise>
                </c:choose>
                </div>
            </div>
            <div id="accBox">
                <div class="imgBox text-left">
                <c:choose>
                    <c:when test="${accImgList.size() > 0}">
                    <div class="closetTag text-center">ACC</div>
	                    <c:forEach var="i" begin="0" end="${accList.size() - 1}">
	                		<img src="${accImgList.get(i).path}" class="w-50 p-1 ckImg" id="target${accList.get(i).no}">
	                		<input type="checkbox" name="targets" value="${accList.get(i).no}" id="target${accList.get(i).no}">
	                	</c:forEach>
                	</c:when>
                	<c:otherwise>
                		<span class="d-block text-center">ACC</span>
                	</c:otherwise>
                </c:choose>
                </div>
            </div>
        </div>
    </div><hr>
    <div class="row">
        <div class="col-12 text-center">
            <div class="row">
                <div class="col-12">
                <p><span style="color:palevioletred">변경할 이름</span> 을 미입력시 기존이름 그대로 변경되지 않습니다.</p>
                <p><span style="color:indianred">수정완료</span> 를 누를 시 선택한 옷들은 삭제 됩니다.</p>
                <p><span style="color:red">옷장삭제</span> 를 누를 시 옷장과 옷장안에 옷들까지 같이 삭제 됩니다.</p>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <button id="modify" type="button" class="btn btn-outline-dark">수정완료</button>
                    <button id="delete" type="button" class="btn btn-outline-dark">옷장삭제</button>
                    <button id="toBack" type="button" class="btn btn-outline-dark">돌아가기</button>
                </div>
            </div>
        </div>
    </div>
</div>
    <c:choose>
	    <c:when test="${closet.img eq 'closet1'}"><script>$("#d1").prop("checked",true);</script></c:when>
	    <c:when test="${closet.img eq 'closet2'}"><script>$("#d2").prop("checked",true);</script></c:when>
	    <c:when test="${closet.img eq 'closet3'}"><script>$("#d3").prop("checked",true);</script></c:when>
    </c:choose>
<script>
	$("input[name='closetDesign']").on("click",function(){
	    console.log($(this).val());
	    $("#closetImg").attr("src","/imgs/closet/"+$(this).val()+".png");
	});
	$("#toBack").on("click",function(){
	   	//location.href="${pageContext.request.contextPath}/";
	   	history.back();
	});
	var arr = [];
    $(".ckImg").on("click",function(){
        var target = arr.indexOf($(this).attr("id").substr(6,$(this).attr("id").length));
        if($(this).css("opacity") == 0.2){
             $(this).css("opacity","1");
             if(target > -1) {
                 arr.splice(target, 1);
             }
        } else {
             $(this).css("opacity","0.2");
             console.log(arr);
             arr.push($(this).attr("id").substr(6,$(this).attr("id").length));
        }
    });
    $("#modify").on("click",function(){
    	if($("#closet").val() == "") {
    		$("#closet").val("${closet.name}");	
    	}
    	location.href="${pageContext.request.contextPath}/closet/closetModifyProc?targets="+arr+"&no="+${closet.no}+"&closet="+$("#closet").val()+"&dg="+$("input[name='closetDesign']:checked").val();
    });
    $("#delete").on("click",function(){
    	location.href="${pageContext.request.contextPath}/closet/closetDeleteProc?no="+${closet.no};
    })
</script>
</body>
</html>