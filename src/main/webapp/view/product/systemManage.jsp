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
						class="btn btn-sm btn-primary">搜索</button>
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
							id="role" name="roleid">
							<option value="1">系统管理员</option>
							<option value="2">人事管理员</option>
						</select>
					</div>
					<div class="form-group">
						<label for="jobname">用户名</label> <input type="text"
							class="form-control" id="jobname" name="jobname"
							placeholder="必须由英文、数字和下划线组成">
					</div>

					<div class="form-group">
						<button type="button" class="btn btn-info" id="saveJob">保存</button>
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

						<th><button>查看系统日志</button></th>
						<th><button>查看所有用户</button></th>
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
				var buttonDiv =$("<div></div>").append(resetButton).append(deleteButton).css("display","block");
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
	</script>
</body>
</html>