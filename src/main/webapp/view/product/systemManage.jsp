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
				<h2>系统管理</h2>
				<ol class="breadcrumb">
					<li>系统管理</li>
					<li class="active">角色分配</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<form class="form-inline">
					<div class="input-group">
						<span class="input-group-addon">部门</span> <select
							class="form-control departmentDisplay"
							id="deptNameSelectToSearch" onchange="getJobByChooseDept()">
							<option value="allDepts">全部</option>
						</select>
					</div>
				</form>
			</div>
			<div class="col-md-3">
				<button class="btn btn-sm btn-info" data-toggle="collapse"
					data-target="#addJobDiv">新岗位</button>
				<button id="deleteJob" class="btn btn-sm btn-info">删除</button>
				<button class="btn btn-sm btn-info" disabled="disabled">修改</button>

			</div>
			<div class="col-md-4 col-md-offset-3">
				<form class="form-inline">

					<div class="form-group">

						<div class="input-group">
							<span class="input-group-addon">岗位</span><input type="text"
								class="form-control" id="jobNameSearch" placeholder="初级工程师">
						</div>
					</div>

					<button type="submit"id="searchByJobName" class="btn btn-sm btn-primary">搜索</button>
				</form>
			</div>
		</div>
		<!-- 添加新岗位区域-->
		<div class="collapse row" id="addJobDiv">
			<div class="">
				<form class="form-inline" id="addJobForm">
					<div class="form-group">
						<label for="deptno">部门</label> <select
							class="form-control departmentDisplay" id="deptno" name="deptno">
						</select>
					</div>
					<div class="form-group">
						<label for="jobname">岗位名</label> <input type="text"
							class="form-control" id="jobname" name="jobname"
							placeholder="必须是中文，如 服务岗">
					</div>
					<div class="form-group">
						<label for="jobplannum">计划人数</label> <input type="text"
							class="form-control" id="jobplannum" name="jobplannum"
							placeholder="必须是数字，如 10">
					</div>
					<div class="form-group">
						<label for="salary">基本薪资</label> <input id="salary" name="salary"
							type="text" class="form-control" placeholder="该功能未开放" readonly>
					</div>
					<br />
					<hr />
					<div class="form-group">
						<label for="jobremark">职责</label>
						<textarea class="form-control" rows="2" style="width: 400px"
							id="jobremark" name="jobremark"></textarea>
						<button type="button" class="btn btn-info" id="saveJob">保存</button>
						<button type="button" class="btn" data-toggle="collapse"
							data-target="#addJobDiv">取消</button>
					</div>

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

</body>
</html>