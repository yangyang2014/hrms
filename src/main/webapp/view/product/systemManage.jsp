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

<link href="${APP_PATH}/static/css/systemManage.css" rel="stylesheet">
<title>人力资源管理系统</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>系统管理</h2>
				<ol class="breadcrumb">
					<li>系统管理</li>
					<li class="active">角色管理</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<button class="btn btn-sm btn-info" data-toggle="collapse"
					data-target="#addUserDiv">新用户</button>
			</div>
			<div class="col-md-4">
				<form class="form-inline">
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon">用户名</span><input type="text"
								class="form-control" id="userNameSearch" placeholder="admin">
						</div>
					</div>

					<button type="submit" id="searchByUserName"
						class="btn btn-sm btn-primary" disabled>搜索</button>
				</form>
			</div>
			<div class="col-md-6"></div>
		</div>
		<!-- 添加新岗位区域-->
		<div class="collapse row" id="addUserDiv">
			<div class="">
				<form class="form-inline" id="addUserForm">
					<div class="form-group">
						<label for="role">角色</label> <select class="form-control"
							id="roleid" name="roleid">
							<option value="1">系统管理员</option>
							<option value="2">人事管理员</option>
						</select>
					</div>
					<div class="form-group">
						<label for="jobname">用户名</label> <input type="text"
							class="form-control" id="username" name="username"
							placeholder="必须由英文、数字和下划线组成">
					</div>

					<div class="form-group">
						<button type="button" class="btn btn-info" id="saveUser">保存</button>
						<button type="button" class="btn" data-toggle="collapse"
							data-target="#addUserDiv">取消</button>
					</div>

				</form>
			</div>
		</div>



		<div class="row margin-top-sm">
			<table class="table table-striped">
				<thead>
					<tr>

						<th><button disabled>系统日志</button></th>
						<th><button id="selectAll">所有用户</button></th>
						<th></th>
						<th></th>
						<th><div style="width: 20px; height: 20px; background: red;"></div>系统管理员</th>
						<th><div style="width: 20px; height: 20px; background: blue;"></div>人事管理员</th>
						<th><div
								style="width: 20px; height: 20px; background: green;"></div>普通用户</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			getAllUser();
		});
		/* 获取所有用户信息 */
		function getAllUser() {
			$.ajax({
				url : "${APP_PATH}/getAllUsers",
				success : function(users) {
					buildUserView(users);
				}
			});
		}
		/* 渲染到页面 */
		function buildUserView(users) {
			$("tbody").empty()
			var userTr = $("<tr></tr>");
			$.each(users, function(index, user) {
				var userTd = $("<td></td>")
				var userDiv = $("<div></div").append(user.username);
				if (user.roleid == 1) {
					userDiv.attr("class", "sys_admin");
				} else if (user.roleid == 2) {
					userDiv.attr("class", "person_admin");
				} else if (user.roleid == 3) {
					userDiv.attr("class", "user");
				}
				var resetButton = $("<button></button>").append("密码重置");
				var deleteButton = $("<button></button>").append("删除用户");
				resetButton.click(function() {
					resetPassword(user);
				});
				deleteButton.click(function() {
					deleteUser(user);
				})
				var buttonDiv = $("<div></div>").append(resetButton).append(
						deleteButton).css("display", "none");
				userDiv.bind("click", function() {
					buttonDiv.css("display", "block");
				});
				userTd.append(userDiv).append(buttonDiv);
				userTr.append(userTd);
				var pos = index + 1;
				if (pos % 7 == 0 && pos > 0) {
					$("tbody").append(userTr);
					userTr = $("<tr></tr>");
				}

			});
			$("tbody").append(userTr);
		}

		/*  重置密码  */
		function resetPassword(user) {
			$.ajax({
				url : "${APP_PATH}/resetPassword",
				data : user,
				success : function(result) {
					alert("密码重置成功");
					getAllUser();
					console.log(result);
				}

			});
		}
		/* 删除用户  */
		function deleteUser(user) {
			$.ajax({
				url : "${APP_PATH}/deleteUser",
				data : user,
				success : function(result) {
					alert("用户删除成功");
					getAllUser();
				}
			});
		}
		/* 保存新增的用户 */
		$("#saveUser").click(function() {
			var user = {};
			user.username = $("#username").val();
			user.roleid = $("#roleid").val();
			console.log(user);
			$.ajax({
				url : "${APP_PATH}/addUser",
				data : user,
				success : function(result) {
					alert("添加用户成功");
					getAllUser();
				}
			});
		});
		/* 获取所有用户  */
		$("#selectAll").click(function() {
			getAllUser();
		});
	</script>
</body>
</html>