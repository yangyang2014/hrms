<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
	pageContext.setAttribute("username", session.getAttribute("username"));
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
				<h2>个人管理平台</h2>
				<ol class="breadcrumb">
					<li>个人管理</li>
					<li class="active">信息管理</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-3"></div>
			<div class="col-md-4 col-md-offset-3"></div>
		</div>


		<div class="row margin-top-sm">
			<table>
				<tr style="font-weight: bold;">
					<td class="col-sm-2 ">工号</td>
					<td class="col-sm-2 ">姓名</td>
					<td class="col-sm-2 ">部门</td>
					<td class="col-sm-2 ">岗位</td>
				</tr>
				<tr style="height: 50px;">
					<td class="col-sm-2 " id="empno-info"></td>
					<td class="col-sm-2 " id="empname-info"></td>
					<td class="col-sm-2 " id="empdept-info"></td>
					<td class="col-sm-2 " id="empjob-info"></td>
				</tr>
				<tr style="font-weight: bold;">
					<td class="col-sm-2 ">性别</td>
					<td class="col-sm-2 ">出生年月</td>
					<td class="col-sm-2 ">电话</td>
					<td class="col-sm-2 ">邮箱</td>

				</tr>
				<tr style="height: 50px;">
					<td class="col-sm-2 " id="empgender-info"></td>
					<td class="col-sm-2 " id="empbirthtime-info"></td>
					<td class="col-sm-2 " id="empphone-info"></td>
					<td class="col-sm-2 " id="empemail-info"></td>
				</tr>
				<tr>
					<td><button id="edit">修改</button></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- Modal change employee job -->
	<div class="modal fade" id="updateEmpPhoneAndEmail" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">修改联系方式</h4>
				</div>
				<div class="modal-body">
					<form id="updateForm" class="form-horizontal">
						<!-- <div class="form-group">
							<label class="col-sm-2 control-label">电话</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="updatePhone"
									name="phone">
							</div>
						</div> -->
						<div class="form-group">
							<label class="col-sm-2 control-label">邮箱</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="updateEmail"
									name="email">
								 <input type="hidden" id="empId"
									class="form-control" name="empId">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button id="updateContact" type="button" class="btn btn-primary">修改</button>
				</div>
			</div>
		</div>
	</div>



	<script>
		$(document).ready(function() {
			getEmployeeInfo();
		});

		function getEmployeeInfo() {
			$.ajax({
				url : "${APP_PATH}/getEmpByEmpNO",
				type : "get",
				data : "empNO=${username}",
				success : function(result) {
					var employee = result.extend.emp;
					console.log(employee);
					buildEmployeeInfo(employee);
				}
			});
		}
		/*渲染职工详细信息模态框*/

		function buildEmployeeInfo(employee) {
			var empnoinfoTd = $("#empno-info");
			var empnameinfoTd = $("#empname-info");
			var empdeptinfoTd = $("#empdept-info");
			var empjobinfoTd = $("#empjob-info");
			var empgenderinfoTd = $("#empgender-info");
			var empbirthtimeinfoTd = $("#empbirthtime-info");
			var empphoneinfoTd = $("#empphone-info");
			var empemailinfoTd = $("#empemail-info");
			empnoinfoTd.empty();
			empnoinfoTd.append(employee.empno);
			empnameinfoTd.empty();
			empnameinfoTd.append(employee.empName);
			empdeptinfoTd.empty();
			empdeptinfoTd.append(employee.department.name);
			empjobinfoTd.empty();
			empjobinfoTd.append(employee.job.jobname);
			empgenderinfoTd.empty();
			if (employee.gender == 'm' || employee.gender == 'M') {
				empgenderinfoTd.append("男");
			} else {
				empgenderinfoTd.append("女");
			}
			empbirthtimeinfoTd.empty();
			empbirthtimeinfoTd.append(employee.birthTime);
			empphoneinfoTd.empty();
			empphoneinfoTd.append(employee.phone);
			empemailinfoTd.empty();
			empemailinfoTd.append(employee.email);
			onclick(employee);

		}
		function onclick(employee) {
			$("#edit").click(function() {
				$('#updateEmpPhoneAndEmail').modal({
					backdrop : 'static'
				});
			/* 	$("#updatePhone").val(employee.phone); */
				$("#updateEmail").val(employee.email);
				$("#empId").val(employee.empId);
			});
		}
		$("#updateContact").click(function() {
			$.ajax({
				url : "${APP_PATH}/updateEmpContact",
				type : "get",
				data : $("#updateForm").serialize(),
				success : function(result) {
					$("#updateEmpPhoneAndEmail").modal('hide');
					getEmployeeInfo();
				}
			});
		});
	</script>
</body>
</html>