<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta charset="UTF-8">
        <title>Document</title>

        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container-fuild">
            <hr>
            <div class="row">
                <div class="col-5" style="margin: auto; border:1px solid #bcbcbc; border-radius: 10px;">
                    <div class="row mt-3" style="border-bottom: 1px solid #bcbcbc;">
                        <div class="col-6">
                            <button id="findIDBtn" class="btn btn-info" style="width: 100%;">이메일 찾기</button>
                        </div>
                        <div class="col-6">
                            <button id="findPWBtn" class="btn btn-info"  style="width: 100%;">비밀번호 찾기</button>
                        </div>
                    </div>
                    <div class="row mt-2">
                      <div class="col-12 mt-2">
                          <p style="font-size:14px; font-weight: 700;">비밀번호 찾기</p>
                          <hr class="mb-0">
                          
                      </div>
                       <div class="col-12">
                          <p style="font-size: 12px; color:#bcbcbc;">* 가입한 이메일을 입력해주세요.</p> 
                       </div>
                        <div class="col-12" style="margin: auto">
                        <form action="${pageContext.request.contextPath}/member/findPWProc" id="findFrm">
                            <div class="form-group row">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-10">
                                    <input type="email" class="form-control" id="email" name="email">
                                </div>
                            </div>
                            <div class="form-group row mt-4">
                                <div class="col-5" style="margin: auto">
                                    <button  type="button" id="findBtn" class="btn btn-info" style="width: 100%;">FIND</button>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <div class="col-12" style="text-align: center;">
                                    <div id="findResult" class="m-2 p-1"  style=" border-radius: 10px;"></div>
                                </div>
                            </div>
						</form>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        
        <script>
        	$("#findIDBtn").on("click",function(){
        		location.href="${pageContext.request.contextPath}/idFind";
        	})
        	$("#findPWBtn").on("click",function(){
        		location.href="${pageContext.request.contextPath}/pwFind";
        	})
        	
        	$("#findBtn").on("click",function(){
        		
        		
        		
        		$.ajax({
        			url:"${pageContext.request.contextPath}/member/emailCheck",
        			data:{
        				email : $("#email").val()
        			}
        		}).done(function(data){
        			
        			console.log(data);
        			if(data == "fail"){
        				$("#findResult").text("가입된 이메일이 아닙니다.")
            			.css("background","lightyellow");	
        			}else {
        				$("#findFrm").submit();	
        			}
        		}).fail(function(){
        			alert("왜..?");
        		})
        	       	
        		
        	})
        </script>

    </body>
</html>