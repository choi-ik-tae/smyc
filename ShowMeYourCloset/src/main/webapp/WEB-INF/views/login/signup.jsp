<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Document</title>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
<!-- signin.css -->
<link rel="stylesheet" type="text/css" href="/css/signin.css">

<style>
* {box-sizing: border-box;}

</style>

<script type="text/javascript">
 window.history.forward();
 function noBack(){window.history.forward();}
</script>


</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<div class="container-fluid p-0">


		<div class="row">
			<div class="col-12 mt-5"></div>
			<div class="col-12 mt-5" style="text-align: center;">
				<h2>Sign Up</h2>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-8 col-md-8 col-lg-4 p-3 mb-3" style="margin:auto;background:rgba(255, 255, 255, 0.9); border-radius:20px;">
				<form action="${pageContext.request.contextPath}/member/signupProc" method="post" id="signupFrm">
					<div class="row">
						<div class="col-12">
							<div class="form-group">
								<label for="InputEmail">Email</label> <input type="email"
									name="email" class="form-control" id="InputEmail1"
									aria-describedby="emailHelp">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="form-group">
								<div class="row">
									<div class="col-6">
										<label for="InputPassword">Password</label> <input
											type="password" name="pw" class="form-control"
											id="InputPassword">
									</div>
									<div class="col-6">
										<label for="InputRePassword">Password Check</label> <input
											type="password" class="form-control" id="InputRePassword">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12"><span id="pwResult" style="font-size:13px;"></span></div>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="form-group">
								<label for="InputName">Name</label> <input type="text"
									name="name" class="form-control" id="InputName">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="form-group">

								<label for="InputNickName">NickName</label>
								<div class="row">
									<div class="col-9">
										<input type="text" name="nickname" class="form-control"
											id="InputNickName">
									</div>
									<div class="col-3">
										<button type="button" id="nickCheck" class="btn btn-info"
											style="width: 100%;">OVERLAP</button>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="form-group">
								<label for="secondPhone">Phone</label>
								<div class="row">
									<div class="col-4">
										<select class="custom-select" name="phone1">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="019">031</option>
										</select>
									</div>
									<div class="col-4">
										<input type="text" name="phone2" id="secondPhone"
											class="form-control">
									</div>
									<div class="col-4">
										<input type="text" name="phone3" id="thirdPhone"
											class="form-control">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="form-group">
								<label> Gender</label>
								<div class="custom-control custom-radio">
									<input type="radio" id="man" name="gender" value="M"
										class="custom-control-input gender"> <label
										class="custom-control-label" for="man">남자</label>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" id="woman" name="gender" value="W"
										class="custom-control-input gender"> <label
										class="custom-control-label" for="woman">여자</label>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-12" style="text-align: center">
							<button type="button" class="btn btn-info" id="signupBtn" style="width: 100%; height: 50px;">SIGN UP</button>
						</div>
					</div>

				</form>
			</div>
		</div>


	</div>
	
		
		<!-- 닉네임 중복 체크 -->
		<script>
			var nickNameCheck = false;
			$("#nickCheck").on("click",function(){
				nickNameCheck = true;
				$.ajax({
					url:"${pageContext.request.contextPath}/member/nickCheckProc",
					data:{
						nickname : $("#InputNickName").val()
					},
					type:"post"
				}).done(function(data){
					if(data == "done"){
						alert("사용가능한 닉네임 입니다");
					}else{
						alert("중복된 닉네임 입니다. 다른 닉네임을 사용해주세요.");
						nickNameCheck = false;
						$("#InputNickName").focus();
						
					}
				});
				
			})
		</script>
		
	 <!-- 유효성 검사! -->
        <script>
            
            $("#InputPassword").on("blur",function(){
                var pw = $("#InputPassword").val();
      
                var regex = /^[A-Za-z0-9]{6,12}$/;
                var result = regex.exec(pw);
      
                
                if(result==null){
                    $("#pwResult").text("* 영문자 포함 6자 이상 12자 이하")
                    .css("color","#bcbcbc");
                    $("#InputPassword").val("");
                    $("#InputPassword").focus();
                }else{
                     $("#pwResult").text("");
                }
                
            });
            
            $("#InputRePassword").on("keyup",function(){
                var pw = $("#InputPassword").val();
                var pwOk = $("#InputRePassword").val();
                
                if(pw == pwOk){
                    $("#pwResult").text("* 비밀번호가 일치합니다.")
                    .css("color","green");
                }else{
                     $("#pwResult").text("* 비밀번호가 일치하지 않습니다.")
                     .css("color","#ba5932");
                }
            })

            $("#signupBtn").on("click",function(){
                
                var pw = $("#InputPassword").val();
                var pwOk = $("#InputRePassword").val();
                var input = $("input");

                for(i=0;i<input.length;i++){
                    if($(input[i]).val()==""){
                        alert("빈칸을 모두 채워주세요");
                        return;
                    }
                }
                
                if(pw != pwOk){
                    alert("비밀번호가 일치 하지 않습니다");
                    $("#InputRePassword").val("");
                    $("#InputRePassword").fouse();
                    
                    return;
                }
                
                var radio = $(".gender");
              
                var check = 0;
                for(i=0;i<radio.length;i++){
                    if($(radio[i]).prop("checked")==true){
                        check =1;
                    }
                }
                
                if(check==0){
                    alert("성별을 선택하세요");
                    return;
                }
                
                if(nickNameCheck==false){
                	alert("닉네임 중복체크 필수~~~");
                	return;
                }
                
       
    			$("#signupFrm").submit();

            })

        </script>




</body>
</html>