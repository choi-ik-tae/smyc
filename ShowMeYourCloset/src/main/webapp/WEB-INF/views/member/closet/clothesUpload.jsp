<!DOCTYPE html>
<html>
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
    *{box-sizing: border-box;font-family: 'Noto Sans KR', sans-serif;}
    html,body{height: 100%;}
    body {display: -ms-flexbox;display: flex;-ms-flex-align: center;align-items: center;}
    #preview{width:300px;height: 300px;}
</style>
</head>
<body>
    <div class="container text-center">
        <!-- 헤더 -->
        
		<form action="${pageContext.request.contextPath}/member/clothesUpload" enctype="multipart/form-data" method="post">
			<div class="row m-2">
				<div class="col-auto m-auto p-0 align-items-center"
					style="border: 1px solid gray;" id="preview"></div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="imgud" class="m-0 ">이미지</label>
				</div>
				<div class="col-10">
					<input id="imgud" class="form-control p-1" name="file" type="file">
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">옷 이름</label>
				</div>
				<div class="col-10">
					<input id="" class="w-100 form-control" name="ctitle" type="text">
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">카테고리</label>
				</div>
				<div class="col-10">
					<input id="" class="w-100 form-control" name="category" type="text">
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">계절</label>
				</div>
				<div class="col-10">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="spring"
							value="option1"> <label class="form-check-label"
							for="spring">봄</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="summer"
							value="option2"> <label class="form-check-label"
							for="summer">여름</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="fall"
							value="option3"> <label class="form-check-label"
							for="fall">가을</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="winter"
							value="option3"> <label class="form-check-label"
							for="winter">겨울</label>
					</div>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">공개여부</label>
				</div>
				<div class="col-10">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="pub" id="y"
							value="option1"> <label class="form-check-label" for="y">YES</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="pub" id="n"
							value="option2"> <label class="form-check-label" for="n">NO</label>
					</div>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-2 align-self-center">
					<label for="" class="m-0 ">메모</label>
				</div>
				<div class="col-10">
					<textarea class="form-control" rows="5" style="resize: none" name="memo" id="memo"></textarea>
				</div>
			</div>
			<div class="row m-2">
				<div class="col-12 align-self-center">
					<button class="btn btn-outline-secondary">등록하기</button>
				</div>
			</div>
		</form>

		<!-- 푸터 -->
    </div>
<script>
	// 등록 이미지 등록 미리보기
	function readInputFile(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview').html(
						"<img class='w-100 h-100' src="+ e.target.result +">");
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$("#imgud").on('change', function() {
		readInputFile(this);
	});

	// 등록 이미지 삭제 ( input file reset )
	function resetInputFile($input, $preview) {
		var agent = navigator.userAgent.toLowerCase();
		if ((navigator.appName == 'Netscape' && navigator.userAgent
				.search('Trident') != -1)
				|| (agent.indexOf("msie") != -1)) {
			// ie 일때
			$input.replaceWith($input.clone(true));
			$preview.empty();
		} else {
			//other
			$input.val("");
			$preview.empty();
		}
	}
</script>
</body>
</html>