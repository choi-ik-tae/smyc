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
<!-- chart.js -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<style>
    *{box-sizing: border-box;font-family: 'Noto Sans KR', sans-serif;}
	.container{width: 1200px;max-width: none !important;height:600px; margin-top:100px;}
    #title{height:200px; line-height:200px; font-size:30pt; font-weight:800;}
    .borderDelete{border: 0px;}
    #toChart{height: 100px;}
    #toBlock{height: 100px;}
    .navi{border-bottom: 1px solid lightgray;font-weight: 800;font-size: 25pt; background-color:white;}
</style>
</head>
<body>
	<c:if test="${admin ==null }">
    		<script>
    			alert("나가시라구여!!!");
    			location.href="${pageContext.request.contextPath}/";
    		</script>
    	</c:if>
	<div class="container p-0">
        <div class="row navi m-0 fixed-top">
            <div class="col-12 text-center">
                SHOW ME YOUR CLOSET
            </div>
        </div>
		<div class="row m-0">
		    <div class="contents col-12">
		        <div class="row m-0">
                    <div class="col-12">
                       
                        <div class="row m-0">
                            <div class="col-12 text-center">
                               	<span style="font-size:15pt;font-weight:700">남녀성비 통계</span>
                            </div>
                        </div><hr>
                        <div class="row m-0">
                            <div class="col-12 text-center">
                                <canvas class="d-inline-block" id="memChart" width="500" height="500"></canvas>
                            </div>
                        </div><hr>
                        
                        <div class="row m-0">
                            <div class="col-12 text-center">
                               	<span style="font-size:15pt;font-weight:700">자랑게시판 조회수 순위</span>
                            </div>
                        </div><hr>
                        <div class="row m-0">
                            <div class="col-12 text-center">
                            	<canvas class="d-inline-block" id="boastViewChart" width="1000" height="500"></canvas>
                            </div>
                        </div><hr>
                        
                        <div class="row m-0">
                            <div class="col-12 text-center">
                               	<span style="font-size:15pt;font-weight:700">자랑게시판 좋아요 순위</span>
                            </div>
                        </div><hr>
                        <div class="row m-0">
                            <div class="col-12 text-center">
                            	<canvas class="d-inline-block" id="boastLikeChart" width="1000" height="500"></canvas>
                            </div>
                        </div><hr>
                        
                        <div class="row m-0">
                            <div class="col-12 text-center">
                               	<span style="font-size:15pt;font-weight:700">도움게시판 조회수</span>
                            </div>
                        </div><hr>
                        <div class="row m-0">
                            <div class="col-12 text-center">
                            	<canvas class="d-inline-block" id="HelpViewChart" width="1000" height="500"></canvas>
                            </div>
                        </div><hr>
                        
                    </div>
                </div>
		    </div>
		</div>
	</div>
	<script>
	var MchartData = ${memList};
	
	var BVchartLabels = ${boastTitle};
	var BVchartData = ${boastView};
	
	var BLchartLabels = ${boastTitleByLike};
	var BLchartData = ${boastViewByLike};
	
	var HVchartLabels = ${helpTitle};
	var HVchartData = ${helpView};
	
	var mct = document.getElementById('memChart');
	var memChart = new Chart(mct, {
		type: 'bar',
		data: {
			labels: ['총 회원', '남', '여'],
			datasets: [{
				label: '회원 수',
				data: MchartData,
				backgroundColor: [
					'rgba(75, 192, 192, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 99, 132, 0.2)'
				],
				borderColor: [
					'rgba(75, 192, 192, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 99, 132, 1)'
				],
				borderWidth: 2
			}]
		},
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});

	var bvct = document.getElementById('boastViewChart');
	var boastViewChart = new Chart(bvct, {
		type: 'bar',
		data: {
			labels: BVchartLabels,
			datasets: [{
				label: '조회 수',
				data: BVchartData,
				backgroundColor: [
					'rgba(75, 192, 192, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 99, 132, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 99, 132, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(153, 102, 255, 0.2)'
				],
				borderColor: [
					'rgba(75, 192, 192, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 99, 132, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 99, 132, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(153, 102, 255, 1)'
				],
				borderWidth: 2
			}]
		},
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});
	
	var blct = document.getElementById('boastLikeChart');
	var boastLikeChart = new Chart(blct, {
		type: 'bar',
		data: {
			labels: BLchartLabels,
			datasets: [{
				label: '좋아요 수',
				data: BLchartData,
				backgroundColor: [
					'rgba(75, 192, 192, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 99, 132, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 99, 132, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(153, 102, 255, 0.2)'
				],
				borderColor: [
					'rgba(75, 192, 192, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 99, 132, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 99, 132, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(153, 102, 255, 1)'
				],
				borderWidth: 2
			}]
		},
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});
	
	var hvct = document.getElementById('HelpViewChart');
	var HelpViewChart = new Chart(hvct, {
		type: 'bar',
		data: {
			labels: HVchartLabels,
			datasets: [{
				label: '조회 수',
				data: HVchartData,
				backgroundColor: [
					'rgba(75, 192, 192, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 99, 132, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 99, 132, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(153, 102, 255, 0.2)'
				],
				borderColor: [
					'rgba(75, 192, 192, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 99, 132, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 99, 132, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(153, 102, 255, 1)'
				],
				borderWidth: 2
			}]
		},
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});
    </script>
</body>
</html>