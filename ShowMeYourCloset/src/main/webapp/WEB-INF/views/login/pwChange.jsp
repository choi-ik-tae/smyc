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
                <div class="col-6" style="margin: auto; border:1px solid #bcbcbc; border-radius: 10px;">
                    <div class="row mt-2">
                        <div class="col-12 mt-2">
                            <p style="font-size:14px; font-weight: 700;">비밀번호 변경</p>
                            <hr>
                        </div> 
                        <div class="col-12" style="margin: auto">
                        	<form id="chageFrm" action="${pageContext.request.contextPath}/member/changePwProc" method="post">
                        	<input type="hidden" value="${email}" name="email">
                            <div class="form-group row">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Password</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="pw" name="pw">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPassword" class="col-sm-2 col-form-label">Password Ok</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="pwOk" name="pwOk">
                                </div>
                            </div>
                            <div class="form-group row mt-4">
                                <div class="col-5" style="margin: auto">
                                    <button type="button" id="cangeBtn" class="btn btn-info" style="width: 100%;">변경</button>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-12" style="text-align: center;">
                                    <div id="findResult" class="m-2 p-1"  style="border-radius: 10px;"></div>
                                </div>
                            </div>
							</form>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        
        <script>
        
        	var danger = 0;
        	$("#pw").on("blur",function(){
        		var pw = $("#pw").val();
        	      
                var regex = /^[A-Za-z0-9]{6,12}$/;
                var result = regex.exec(pw);
      
                
                if(result==null){
                    $("#findResult").text("영문자 포함 6자 이상 12자 이하")
                    .css("background","lightyellow")
                    .css("color","#ba5932")
                    .css("font-weight","700");;
                    $("#pw").val("");
                    $("#pw").focus();
                }else{
                     $("#findResult").text("");
                }
        	})
        	
        	$("#pwOk").on("keyup",function(){
                var pw = $("#pw").val();
                var pwOk = $("#pwOk").val();
                
                if(pw == pwOk){
                	$("#findResult").text("비밀번호가 일치합니다.")
                    .css("background","lightyellow")
                    .css("color","green")
                    .css("font-weight","700");
                	danger=0;
                }else{
                	$("#findResult").text("비밀번호가 일치하지 않습니다.")
                    .css("background","lightyellow")
                    .css("color","#ba5932")
                    .css("font-weight","700");
                	danger =1;
                }
            })
            
            $("#cangeBtn").on("click",function(){
            	if($("#pw").val() == "" || $("#pwOk").val()==""){
            		alert("비밀번호를 입력 해주세요.");
            		return;
            	}
            	
            	if(danger == 1){
            		alert("비밀번호를 다시 확인해 주세요.");
            		return;
            	}
            	
            	$("#chageFrm").submit();
            	
            })
        </script>


    </body>
</html>