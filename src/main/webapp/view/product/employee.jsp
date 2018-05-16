<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<script src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<title>员工列表</title>
</head>
<body>
	<!-- Modal add employee-->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加员工</h4>
				</div>
				<div class="modal-body">
					<form id="addEmpForm" class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">员工名</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="empName"
									name="empName" placeholder="张三"> <span
									id="empNameError" style="display: none">必须是2-5位中文或6-16位英文和数字</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender_m" value="m" checked="checked">
									男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender_f" value="f"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">邮箱</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="email" name="email"
									placeholder="123@hr.com"> <span id="emailError"
									style="display: none">邮箱格式不正确</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">部门</label>
							<div class="col-lg-4">
								<select class="form-control" id="deptment" name="dId"></select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="save_emp_data" type="button" class="btn btn-primary">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal update employee-->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">修改员工信息</h4>
				</div>
				<div class="modal-body">
					<form id="updateEmpForm" class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">员工名</label>
							<div class="col-lg-6">
								<input type="text" class="form-control-static"
									id="update_EmpName" name="empName">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="update_gender_m" value="M" checked="checked">
									男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="update_gender_f" value="F"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">邮箱</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="update_email"
									name="email"> <span id="emailError"
									style="display: none">邮箱格式不正确</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">部门</label>
							<div class="col-lg-4">
								<select class="form-control" id="update_deptment" name="dId"></select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="update_emp_data" type="button" class="btn btn-primary">更新</button>
				</div>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>员工管理</h1>
				<ol class="breadcrumb">
					<li><a href="${APP_PATH}/home.jsp">Home</a></li>
					<li class="active">员工管理</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button id="emp_add_modal_btn" class="btn btn-primary">新增</button>
				<!-- <button class="btn btn-danger">删除</button> -->
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table id="emp_table" class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						<tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div id="pageSta" class="col-md-4"></div>
			<div class="col-md-6 col-md-offset-6">
				<nav aria-label="Page navigation">
				<ul id="pagination" class="pagination"></ul>
				</nav>
			</div>
		</div>

	</div>
	<script>
		var currentPage = 1;
		$(function() {
			toPage(1);
		});
		/*新增员工modal*/
		$("#emp_add_modal_btn").click(function() {
			$('#addModal').modal({
				backdrop : 'static'
			});
			$.ajax({
				url : "${APP_PATH}/getDeptments",
				type : "GET",
				success : function(result) {
					console.log(result);
					build_dept_select(result);
				}
			});
		});
		/*保存新增员工信息*/
		$("#save_emp_data").click(function() {
			//校验表单数据
			if (validate_add_form()) {
				$.ajax({
					url : "${APP_PATH}/saveEmp",
					type : "POST",
					data : $("#addEmpForm").serialize(),
					success : function(result) {
						console.log("success");
						$('#addModal').modal('hide');
						toPage(9999);
					}
				});
			}

		});
		/*更新员工信息  */

		$("#update_emp_data").click(function() {
			//校验表单数据
			console.log("data=" + $("#updateEmpForm").serialize());
			var id = $(this).attr('updateEmpId');
			/* if(validate_add_form()){ */
			$.ajax({
				url : "${APP_PATH}/updateEmp/" + id,
				type : "PUT",
				data : $("#updateEmpForm").serialize(),
				success : function(result) {
					console.log("update success");
					$('#updateModal').modal('hide');
					toPage(currentPage);
				}
			});
			/* } */
		});

		/*跳转到pn页*/
		function toPage(pn) {
			$.ajax({
				url : "${APP_PATH}/emps",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//解析并分析员工数据和分页数据
					console.log(result);
					build_emps_table(result);
					build_page_info(result);
					build_page_nav(result);
				}
			});
		}
		//构建分页表格
		function build_emps_table(result) {
			//清空员工数据
			$("#emp_table tbody").empty();
			var emps = result.extend.pageInfo.list;
			var sum = 0;
			$.each(emps, function(index, item) {
				var empIdTd = $("<td></td>").append(++sum);
				var empNameTd = $("<td></td>").append(item.empName);
				var empGenderTd = $("<td></td>").append(
						item.gender == 'M' ? "男" : "女");
				var empEmailTd = $("<td></td>").append(item.email);
				var empDeptTd = $("<td></td>").append(item.department.name);
				var btnEdit = $("<button></button>").addClass(
						"btn btn-primary btn-sm").append(
						$("<span></span>").addClass(
								"glyphicon glyphicon-pencil").append("编辑"));
				btnEdit.click(function() {
					$('#updateModal').modal({
						backdrop : 'static'
					});
					$.ajax({
						url : "${APP_PATH}/getEmp/" + item.empId,
						type : "POST",
						success : function(result) {
							//解析更新数据
							console.log(result);
							buildUpdateEmpModal(result);
						}
					});
				});
				var btnDelete = $("<button></button>").addClass(
						"btn btn-danger btn-sm").append(
						$("<span></span>")
								.addClass("glyphicon glyphicon-trash").append(
										"删除"));
				btnDelete.click(function() {
					if (confirm("确认删除" + item.empName + "?")) {
						$.ajax({
							url : "${APP_PATH}/deleteEmp/" + item.empId,
							type : "DELETE",
							success : function(result) {
								//解析更新数据
								console.log("删除成功");
								toPage(currentPage);
							}
						});
					}
				});
				var opeTd = $("<td></td>").append(btnEdit).append(" ").append(
						btnDelete);
				$("<tr></tr>").append(empIdTd).append(empNameTd).append(
						empGenderTd).append(empEmailTd).append(empDeptTd)
						.append(opeTd).appendTo("#emp_table tbody");
			});

		}
		//构建分页信息
		function build_page_info(result) {
			$("#pageSta").empty();
			var pageInfo = result.extend.pageInfo
			var pageSta = $("<span></span>").append(
					"当前是" + pageInfo.pageNum + "页,共有" + pageInfo.pages + "页，共计"
							+ pageInfo.total + "条记录");
			currentPage = pageInfo.pageNum;
			pageSta.appendTo("#pageSta");
		}
		//构建分页导航
		function build_page_nav(result) {
			$("#pagination").empty();
			var pageInfo = result.extend.pageInfo;
			//构建元素
			if (pageInfo.hasPreviousPage == false) {
				var firstPageBtn = $("<li></li>").addClass("disabled").append(
						$("<a></a>").append("首页").attr("href", "#"));
				var prePageBtn = $("<li></li>").addClass("disabled").append(
						$("<a></a>").append("&laquo;").attr("href", "#"));
			} else {
				var firstPageBtn = $("<li></li>").append(
						$("<a></a>").append("首页").attr("href", "#"));
				var prePageBtn = $("<li></li>").append(
						$("<a></a>").append("&laquo;").attr("href", "#"));
			}
			//为元素添加翻页事件
			firstPageBtn.click(function() {
				toPage(1);
			});
			prePageBtn.click(function() {
				if (pageInfo.pageNum > 1) {
					toPage(pageInfo.pageNum - 1);
				} else {
					toPage(1);
				}
			});

			if (pageInfo.hasNextPage == false) {
				var nextPageBtn = $("<li></li>").addClass("disabled").append(
						$("<a></a>").append("&raquo;").attr("href", "#"));
				var lastPageBtn = $("<li></li>").addClass("disabled").append(
						$("<a></a>").append("末页").attr("href", "#"));
			} else {
				var nextPageBtn = $("<li></li>").append(
						$("<a></a>").append("&raquo;").attr("href", "#"));
				var lastPageBtn = $("<li></li>").append(
						$("<a></a>").append("末页").attr("href", "#"));
			}
			//为元素添加翻页事件
			nextPageBtn.click(function() {
				if (pageInfo.pageNum < pageInfo.pages) {
					toPage(pageInfo.pageNum + 1);
				} else {
					toPage(pageInfo.pages);
				}
			});
			lastPageBtn.click(function() {
				toPage(pageInfo.pages);
			});

			$("#pagination").append(firstPageBtn).append(prePageBtn).append(
					nextPageBtn).append(lastPageBtn);
			$.each(pageInfo.navigatepageNums, function(index, item) {
				if (pageInfo.pageNum == item) {
					var pagesBtn = $("<li></li>").addClass("active").append(
							$("<a></a>").append(item).attr("href", "#"));
				} else {
					var pagesBtn = $("<li></li>").append(
							$("<a></a>").append(item).attr("href", "#"));
				}
				pagesBtn.click(function() {
					toPage(item);
				});
				$("#pagination").append(pagesBtn);
			});
			$("#pagination").append(nextPageBtn).append(lastPageBtn);
		}
		//构建部门信息的下拉框
		function build_dept_select(result) {
			var departments = result.extend.departments;
			$("#deptment").empty();
			$.each(departments, function(index, item) {
				$("<option></option>").append(item.name).attr("value", item.id)
						.appendTo($("#deptment"));
			});
		}
		//校验添加表单中的员工数据
		function validate_add_form() {
			var empName = $("#empName").val();
			var email = $("#email").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
			var regEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			if (!regName.test(empName)) {
				$("#empName").parent().addClass('has-error');
				$("#empNameError").css('display', 'inline');
				$("#empNameError").css('color', 'red');
				return false;
			} else {
				$("#empName").parent().removeClass('has-error');
				$("#empNameError").css('display', 'none');
			}
			if (!regEmail.test(email)) {
				$("#email").parent().addClass('has-error');
				$("#emailError").css('display', 'inline');
				$("#emailError").css('color', 'red');
				return false;
			} else {
				$("#email").parent().removeClass('has-error');
				$("#emailError").css('display', 'none');
			}
			return true;
		}

		//build Update Emp Modal
		function buildUpdateEmpModal(result) {
			var emp = result.extend.emp;
			$("#update_EmpName").prop("value", emp.empName);
			$("#update_email").prop("value", emp.email);
			$("#update_emp_data").attr("updateEmpId", emp.empId);
			$.ajax({
				url : "${APP_PATH}/getDeptments",
				type : "GET",
				success : function(result) {
					console.log(result);
					build_update_dept_select(result);
				}
			});
		}

		//构建部门信息的下拉框
		function build_update_dept_select(result) {
			var departments = result.extend.departments;
			$("#update_deptment").empty();
			$.each(departments, function(index, item) {
				$("<option></option>").append(item.name).attr("value", item.id)
						.appendTo($("#update_deptment"));
			});
		}
	</script>
</body>
</html>