<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${APP_PATH}/static/css/home.css" rel="stylesheet">

<title>人力资源管理系统</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12 top-margin-10">
				<h1>公司人事信息总览</h1>
				<ol class="breadcrumb">
					<li><a href="${APP_PATH}/home.jsp">Home</a></li>
				</ol>
				<div class="col-md-5 top-margin-sm">
					<h2>组织信息</h2>
					<div id="deptGraph" style="width: 400px; height: 300px;"></div>
				</div>
				<div class="col-md-5 top-margin-sm">
					<h2>公司人员</h2>
					<div id="empGenderGraph" style="width: 400px; height: 300px;"></div>
				</div>
				<div class="col-md-2 top-margin-sm">
					<h2>温馨提示</h2>
					<p>2018年6月6日</p>
					<p>暂无</p>
				</div>
			</div>
		</div>
	</div>
	<script src="${APP_PATH}/static/js/echarts.simple.min.js"></script>
	<script src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
	<script
		src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/static/js/home.js"></script>
	<script>
		$(function() {
			getDeptData();
			getEmpData();
		});

		function getDeptData() {
			$.ajax({
				url : "${APP_PATH}/getDeptments",
				type : "GET",
				success : function(result) {
					buildDeptGraph(result);
				}
			});
		}

		function getEmpData() {
			$.ajax({
				url:"${APP_PATH}/getEmpdataByGender",
				type:"GET",
				success: function(empData){
					console.log(empData);
					 buildEmpGraph(empData);
				}
			});
		};
	</script>
</body>
</html>