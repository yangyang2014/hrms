<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script src="${APP_PATH}/static/js/echarts.simple.min.js"></script>
<script src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<link href="${APP_PATH}/static/css/job.css" rel="stylesheet">
<title>人力资源管理系统</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>岗位管理</h2>
				<ol class="breadcrumb">
					<li><a href="${APP_PATH}/home.jsp">Home</a></li>
					<li class="active">岗位管理</li>
					<li></li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<form class="form-inline">
					<div class="input-group">
						<span class="input-group-addon">部门</span> <select
							class="form-control" id="deptName">
							<option>部门1</option>
							<option>部门2</option>
							<option>部门3</option>
						</select>
					</div>
					<button class="btn btn-sm btn-info">新岗位</button>
					<button class="btn btn-sm btn-info">修改</button>
					<button class="btn btn-sm btn-info">删除</button>
				</form>
			</div>
			<div class="col-md-4">
				<form class="form-inline">

					<div class="form-group">

						<div class="input-group">
							<span class="input-group-addon">岗位</span><input type="text"
								class="form-control" id="jobName" placeholder="初级工程师">
						</div>
					</div>

					<button type="submit" class="btn btn-sm btn-primary">搜索</button>
				</form>
			</div>
		</div>
		<div class="row margin-top-sm">
			<table class="table table-condensed table-hover">
				<thead>
					<tr>
						<th><input type="checkbox"></th>
						<th>#</th>
						<th>岗位</th>
						<th>所属部门</th>
						<th>现人数/计划数</th>
						<th>成员</th>
						<th>基本薪水</th>

					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>

	</div>
	<script>
		$(document).ready(function() {
			getJobInfo();
		});

		function getJobInfo() {
			$.ajax({
				url : "${APP_PATH}/selectAllJob",

				success : function(result) {
					console.log(result);
					showJobs(result);
				}
			});

		}

		function showJobs(jobs) {
			var sum = 1;
			$.each(jobs, function(index, job) {
				var Tr = $("<tr></tr>").attr("class", "active");
				var TdCheckout = $("<td></td>").append(
						"<input type='checkbox'>");
				var TdSum = $("<td></td>").append(sum++);
				var TdJobName = $("<td></td>").append(job.jobname);
				var TdDeptName = $("<td></td>").append(job.deptno);
				var TdPersonNum = $("<td></td>").append(
						"job_person" + "/" + job.jobplannum);
				var TdPerson = $("<td></td>").append("暂无");
				var TdSalary = $("<td></td>").append("暂无");
				Tr.append(TdCheckout).append(TdSum).append(TdJobName).append(TdDeptName)
						.append(TdPersonNum).append(TdPerson).append(TdSalary);
				Tr.appendTo($("tbody"));
			});

		}
	</script>
</body>
</html>