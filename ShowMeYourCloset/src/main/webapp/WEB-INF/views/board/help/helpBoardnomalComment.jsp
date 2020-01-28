<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<!-- Bootstap4 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
.commentRowContainer{border-bottom: 1px solid #bcbcbc;}
.commentInfo{text-align: right; color:#bcbcbc; font-size:13px;}
.commentDelete:hover{cursor: pointer}
</style>
</head>
<body>
	<div class="container-fuild">
			<div class="commnetInput-Div row mt-3 pb-4 p-2" style="border-bottom: 1px solid #bcbcbc;">
				<div class="col-10">
					<input type="text" class="form-control" id="commentInput">
				</div>
				<div class="col-2" style="text-align: center;">
					<button class="btn btn-info" style="width: 100%;" id="commentsInputBtn">등록</button>
				</div>
			</div>
		<div class="row m-0" style="min-height: 420px;">
			<c:if test="${list.size() == 0}">
				<div class="col-12 commentDiv" id="init" style="text-align : center; line-height:420px;">
					<span>등록된 댓글이 없습니다.</span>
				</div>
			</c:if>
			<div class="col-12 commentDiv" id="continue">
			<c:forEach items="${list }" var="dto">
				
					<div class="row p-2 commentRowContainer">
						<div class="col-7">
							<span>${dto.contents}</span>
						</div>
						<div class="col-2">
							<span>${dto.nickname}</span>
						</div>
						<div class="col-2">
							<span>${dto.write_date }</span>
						</div>
						<div class="col-1 commentInfo">
							<c:choose>
								<c:when test="${email eq dto.email}">
									<span class="commentDelete" onclick="commentDelete('${dto.no}')">삭제 </span>
								</c:when>
								<c:otherwise>
									<span class="commentNotify" onclick="commentNodify('${dto.no}','${dto.nickname}')">신고</span>	
								</c:otherwise>
							</c:choose>
							
						</div>
					</div>
			</c:forEach>
			</div>

		</div>

		<div class="bin" style="height:30px;"></div>
	</div>
	
	<script>
			
		var commentDelete = function(no){
			console.log(no);
			location.href="${pageContext.request.contextPath}/comments/deleteCommentsProc?no="+no+"&b_no=${b_no}";		
		}
		
		var commentNodify = function(no, nick){
			
			if("${email}" == ""){
				alert("로그인 후 이용가능한 기능입니다.");
				return;
			}
			
			var result = confirm(nick+"님을 신고하시겠습니까?");
			if(result){
				$.ajax({
					url:"${pageContext.request.contextPath}/notify/notifyProc.do",
					data:{
						category : "C",
						c_no : no
					}
				}).done(function(data){
					
					if(data == "good"){
						alert("정상적으로 신고가 완료 되었습니다.");
					}else{
						alert("이미 신고한 댓글 입니다.");
					}
				})
			}
			
		}
	
		$("#commentsInputBtn").on("click",function(){
			var contents = $("#commentInput").val();
			
			if(contents == ""){
				alert("댓글을 입력해주세요.");
				return;
			}
			
			if("${email}" == ""){
				alert("로그인을 해주세요.");
				$("#commentInput").val("");
				return ;
			}
			
			$.ajax({
				url:"${pageContext.request.contextPath}/comments/commentUpload",
				data:{
					b_no : "${b_no}",
					contents : contents
				},
				type:"post"
			}).done(function(){
				location.href="${pageContext.request.contextPath}/comments/helpBoardComments?b_no=${b_no}";
				$("#commentInput").val("");
				
			})
		})
	</script>

</body>
</html>