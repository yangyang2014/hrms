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
	<script>
		/* 初始化页面是获取job信息 和部门信息 */
		$(document).ready(function() {
			getJobInfo();
			getDeptInfo();
			/* 保存按钮点击事件 */
			$("#saveJob").click(function() {
				var datas = $("#addJobForm").serializeArray();
				console.log(datas);
				var isValidated = validate(datas);//验证数据是否合法
				if (isValidated) {
					saveJobs(datas);//保存
				} else {
					showReminder("你的输入有误");//显示提示
				}

			});
			/* 删除按钮点击事件 */
			$("#deleteJob").click(function() {
				var checkboxs = $(".checkbox");
				var jobs="";
			   /* 循环，构建删除的jobId字符串 */
				$.each(checkboxs, function(index, checkbox) {
					
					if (checkbox.checked) {
						jobs += "_"+$(checkbox).val();
					}
				});
				if (jobs.length == 0) {
					alert("您未选择需要删除的岗位");
				} else {
					deleteJobs(jobs);//删除选中的岗位,并显示
				}
			});
			/* 搜索按钮点击事件 */
			$("#searchByJobName").click(function(){
				var jobName =  $("#jobNameSearch").val();
				searchByJobName(jobName);
			});

		});
		/*  获取岗位信息*/
		function getJobInfo() {
			$.ajax({
				url : "${APP_PATH}/selectAllJob",
				success : function(result) {
					showJobs(result);
				}
			});
		}
		/*渲染岗位信息  */
		function showJobs(jobs) {
			$("tbody").empty();
			var sum = 1;
			$.each(jobs, function(index, job) {
				var Tr = $("<tr></tr>").attr("class", "active");
				var TdCheckbox = $("<td></td>").append(
						$("<input type='checkbox'>").attr("value", job.jobid)
								.attr("class", "checkbox"));
				var TdSum = $("<td></td>").append(sum++);
				var TdJobName = $("<td></td>").append(job.jobname);
				var TdDeptName = $("<td></td>").append(job.deptno);
				var TdPersonNum = $("<td></td>").append(
						"job_person" + "/" + job.jobplannum);
				var TdPerson = $("<td></td>").append("暂无");
				var TdSalary = $("<td></td>").append("暂无");
				Tr.append(TdCheckbox).append(TdSum).append(TdJobName).append(
						TdDeptName).append(TdPersonNum).append(TdPerson)
						.append(TdSalary);
				Tr.appendTo($("tbody"));
			});
		}

		/*  获取部门信息*/
		function getDeptInfo() {
			$.ajax({
				url : "${APP_PATH}/getDeptments",
				success : function(result) {
					console.log(result);
					showDepts(result.extend.departments);
				}
			});
		}

		/* 渲染部门信息到下拉框 */
		function showDepts(departments) {
			$.each(departments, function(index, department) {
				$(".departmentDisplay").append(
						$("<option></option>").append(department.name).attr(
								"value", department.number));
			});
		}

		/*保存新增的岗位信息  */
		function saveJobs(jobInfo) {
			alert("save-------");
			$.ajax({
				url : "${APP_PATH}/addJob",
				data : jobInfo,
				success : function(result) {
					console.log(result);
					alert("成功新增一个岗位");
					getJobInfo();
					$("#addJobForm input").val("");

				}
			});
		}

		/*验证数据是否合法  */
		function validate(datas) {
			for (index in datas) {
				var name = datas[index].name;
				var value = datas[index].value;
				if (name == "jobname") {
					var regChina = /^[\u4e00-\u9fa5]{1,}$/;
					if (!regChina.exec(value)) {
						return false;
					}
				}
				if (name == "jobplannum") {
					var regNum = /^[1-9][0-9]*$/;
					if (!regNum.exec(value)) {
						return false;
					}
				}
			}
			return true;
		}
		/*显示提醒信息 */
		function showReminder(reminder) {
			alert(reminder);
		}
		/*根据下拉框选择的部门，获取相应的岗位信息  */
		function getJobByChooseDept() {
			var deptNO = $("#deptNameSelectToSearch option:selected").val();
			$.ajax({
				url : "${APP_PATH}/selectJobByDept",
				type: "post",
				data : "deptNO=" + deptNO,
				success : function(jobs) {
					showJobs(jobs);
				}
			});
		}
		/* 删除岗位  */
		function deleteJobs(jobs){
			$.ajax({
				url : "${APP_PATH}/deleteJobs",
				data : "jobs="+jobs,
				success : function(result) {
					showReminder("删除成功");
					getJobInfo();
				}
			});
		}
		/* 搜索某个岗位 */
		function searchByJobName(jobName){
			$.ajax({
				url:"${APP_PATH}/deleteJobs",
				data:"jobname="+jobName,
				success:function(result){
					console.log(result);
				}
			});
		}
	</script>
</body>
</html>