<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<!-- signin.css -->
<link rel="stylesheet" type="text/css" href="/css/signin.css">
<style>
	.form-pwConfirm {width: 100%;padding: 15px;margin: auto; background:rgba(255, 255, 255, 0.9); border-radius: 20px;}
</style>
</head>
<body>

	

		<div class="form-pwConfirm" style="width:400px;">
			<div class="row mb-3 p-2">
				<div class="col-12" style=" margin:auto;background:lightyellow; color:#595757;font-weight:700; text-align:center">
					해당 메일로 인증번호를 발송 했습니다.
				</div>
			</div>
			<div class="row">

				<div class="col-9 pr-0">
					<input class="form-control" type="text" id="pwconfirm" name="pwconfirm" placeholder="인증번호 입력"> 					
				</div>
				<div class="col-3 pl-1" style="font-size:13px; color:red; line-height:50px;">
					<span id="timer"></span>
				</div>
			</div>
			<div class="row">
				<div class="col-12" style="text-align:center">
					<button id="checkBtn" class="btn btn-info">확인</button>
				</div>
			</div>
	
		</div>
	

	
	<script>
	
		var pwOk = "${authkey}";
		function $ComTimer(){
		    //prototype extend
		}
	
		$ComTimer.prototype = {
		    comSecond : ""
		    , fnCallback : function(){}
		    , timer : ""
		    , domId : ""
		    , fnTimer : function(){
		        var m = Math.floor(this.comSecond / 60) + "분 " + (this.comSecond % 60) + "초";	// 남은 시간 계산
		        this.comSecond--;					// 1초씩 감소
		        this.domId.innerText = m;
		        if (this.comSecond < 0) {			// 시간이 종료 되었으면..
		            clearInterval(this.timer);		// 타이머 해제
		            alert("인증시간이 초과하였습니다. 다시 인증해주시기 바랍니다.");
		            pwOk = pwOk+"123sfe5w44tey55we5rew66Dont;";
		            
		        }
		    }
		    ,fnStop : function(){
		        clearInterval(this.timer);
		    }
		}
		
		
		 var AuthTimer = new $ComTimer()
		  AuthTimer.comSecond =600;
		  AuthTimer.fnCallback = function(){alert("다시인증을 시도해주세요.")}
		  AuthTimer.timer =  setInterval(function(){AuthTimer.fnTimer()},1000);
		  AuthTimer.domId = document.getElementById("timer");
		  

	</script>
	
	<script>		
		$("#checkBtn").on("click",function(){
			var pw = $("#pwconfirm").val();
		
			if(pw == pwOk){
				location.href="${pageContext.request.contextPath}/pwChange?email=${email}";
			}else{
				alert("불일치!");
			}
		});
		
		
	</script>

</body>
</html>