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
	.container-fuild {width: 1903px;max-width: none !important;}
    *{box-sizing: border-box;font-family: 'Noto Sans KR', sans-serif;}
    .nav-font{font-size: 10pt; font-weight: 800;}
    .nav-item>a{color: black; font-size: 15pt;}
    .logo{font-size: 15pt;}
    #top{height: 80px;background-color:white;border-bottom: 1px solid gray;width: 1903px;max-width: none !important;}
    #bottom{background-color:white;border-top: 1px solid gray;width: 100%;height: 150px;}
    #bottom-logo{height: 150px; line-height: 150px;}
    #bottom-contents{font-size: 10pt;color: gray;}
    .nav-link:hover{cursor: pointer;}
</style>


</head>
<body>
	<div class="container-fuild">

		<!-- 헤더 -->
		<jsp:include page="../../standard/header.jsp" />

		<div class="row m-0 mt-5">
			<div class="col-12 mt-5">
				<div class="row">
					<div class="col-12 text-center">
						<h1 style="font-weight: 800;">My Page</h1>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-12 text-center">
						<div class="btn-group" role="group" aria-label="Basic example">
							<button id="toInfo" type="button" class="btn btn-outline-dark">Info</button>
							<button id="toCloset" type="button" class="btn btn-outline-dark">Closet</button>
							<button id="toStyle" type="button" class="btn btn-outline-dark">Style</button>
						</div>
						<hr>
					</div>
				</div>
			</div>
		</div>
		<div class="row m-0">
			<div class="col-12" style="text-align: center">
				<h3>MY INFO</h3>
				<hr style="width: 500px;">
			</div>
		</div>

		<c:choose>
			<c:when test="${result==0}">
				<div class="row m-0">
					<div class="col-sm-8 col-md-8 col-lg-4 p-3 mb-3" style="text-align:center; margin:auto; background: rgba(255, 255, 255, 0.9); border-radius: 20px;">
						<h4>비밀번호가 일치하지 않습니다.</h4>
					</div>
				</div>			
			</c:when>
			<c:otherwise>
			<div class="row m-0">
					<div class="col-sm-8 col-md-8 col-lg-4 p-3 mb-3"
						style="margin: auto; background: rgba(255, 255, 255, 0.9); border-radius: 20px;">
						<form
							action="${pageContext.request.contextPath}/member/modifyProc"
							method="post" id="modifyFrm">
							<div class="row">
								<div class="col-12">
									<div class="form-group">
										<label for="InputEmail">Email</label> <input readonly
											type="email" name="email" class="form-control"
											id="InputEmail1" aria-describedby="emailHelp" value="${dto.email}">
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
								<div class="col-12">
									<span id="pwResult" style="font-size: 13px;"></span>
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<div class="form-group">
										<label for="InputName">Name</label> <input type="text"
											name="name" class="form-control" id="InputName" value="${dto.name}">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<div class="form-group">

										<label for="InputNickName">NickName</label>
										<div class="row">
											<div class="col-12">
												<input type="text" name="nickname" class="form-control"
													id="InputNickName" value="${dto.nickname}" readonly>
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
											<div class="col-12">
												<input type="text" id="phone" name="phone" class="form-control" value="${dto.phone}">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<div class="form-group">
										<label> Gender</label> <input type="text" name="gender"
											class="form-control" readonly value="${dto.gender}">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-12" style="text-align: center">
									<button type="button" class="btn btn-info" id="modifyBtn"
										style="width: 100%; height: 50px;">Modify</button>
								</div>
							</div>
							<div class="row">
								<div class="col-12" style="text-align: right">
									<button id="withDrawBtn" type="button" class="btn" id="signupBtn"
										style="font-size:13px;">탈퇴하기</button>
								</div>
							</div>

						</form>
					</div>
				</div>

			</c:otherwise>
		</c:choose>
		<div class="row m-0">
			<div class="col-12">
				<!-- 푸터 -->
				<jsp:include page="../../standard/footer.jsp" />
			</div>
		</div>
	</div>
	
		<script>
			$("#toInfo").on("click",function(){
				location.href="${pageContext.request.contextPath}/myInfo";
			});
			$("#toCloset").on("click",function(){
				location.href="${pageContext.request.contextPath}/myCloset";	
			});
			$("#toStyle").on("click",function(){
				location.href="${pageContext.request.contextPath}/myStyle";
			});
		</script>
	
		<script>
			$("#withDrawBtn").on("click",function(){
				var result = confirm("정말 탈퇴 하시겠습니까?");
				if(result){
					location.href="${pageContext.request.contextPath}/member/withDrawProc";
				}
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

            $("#modifyBtn").on("click",function(){
                
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
       
    			$("#modifyFrm").submit();

            })

        </script>

</body>
</html>