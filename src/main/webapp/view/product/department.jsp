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

<title>部门管理</title>
</head>
<body>

	<!-- Modal add department-->
	<div class="modal fade " id="addDeptModal" tabindex="-1" role="dialog">
		<div class="modal-dialog " role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加部门</h4>
				</div>
				<div class="modal-body">
					<form id="addDeptForm" class="form-horizontal">
						<div class="form-group">
							<div class="col-lg-12">
								<label class=" control-label" for="deptName">部门名</label> <input
									type="text" class="form-inline" id="deptName" name="name"
									placeholder="运营部">	<span id="validateReminder" class="alert alert-warning"
								role="alert"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-5">
								<label class="control-label" for="remark">部门描述</label>
								<textarea class="form-control" rows="3" id="remark"
									name="remark" placeholder="运营部负责。。。"></textarea>
							</div>
						</div>
					
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="save_dept_data" type="button" class="btn btn-primary"
						disabled="disabled">保存</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal edit department-->
	<div class="modal fade" id="editDeptModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改部门</h4>
				</div>
				<div class="modal-body">
					<form id="editDeptForm" class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">部门名</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="editDeptName"
									name="name">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">部门描述</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="editDeptRemark"
									name="remark">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="save_edit_dept_data" type="button"
						class="btn btn-primary">更新</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal show department -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>部门管理</h2>
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">部门管理</li>
					<li></li>
				</ol>
			</div>
		</div>
		<div class="row">
		<button id="dept_add_modal_btn"
			class="btn btn-primary col-md-offset-8">新增</button>
		</div>
		<div class="row">
			<div class="col-md-10">
				<table id="deptment_table" class="table">
					<thead>
						<tr>
							<th class="col-md-1">#</th>
							<th class="col-md-2">编号</th>
							<th class="col-md-2">部门</th>
							<th class="col-md-1">人数</th>
							<th class="col-md-4 ">描述</th>
							<th class="col-md-6">操作</th>

						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
			<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
			<div id="main" style="width: 400px; height: 250px;"></div>
		</div>
	</div>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));

		// 指定图表的配置项和数据
		var option = {
			title : {
				text : '各部门人数情况'
			},
			tooltip : {},
			legend : {
				data : [ '人数' ]
			},
			xAxis : {
				data : []
			},
			yAxis : {},
			series : [ {
				name : '人数',
				type : 'bar',
				data : []
			} ]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
		/**********************页面显示相关js代码***********************/
		$(function() {
			getDeptPage();
		});

		function getDeptPage() {
			$.ajax({
				url : "${APP_PATH}/getDeptments",
				type : "GET",
				success : function(result) {
					console.log(result);
					buildDeptView(result);
					buildGraph(result);
				}
			});
		}

		function buildGraph(result) {
			var depts = [];
			var empNums = [];
			var departments = result.extend.departments;
			$.each(departments, function(index, item) {
				depts.push(item.name);
				empNums.push(item.empNum);
			});
			// 填入数据
			myChart.setOption({
				xAxis : {
					data : depts
				},
				series : [ {
					// 根据名字对应到相应的系列
					name : '员工数',
					data : empNums
				} ]
			});

		}

		function buildDeptView(result) {
			$("tbody").empty();
			var departments = result.extend.departments;
			console.log(departments);
			var num =0;
			$.each(departments, function(index, item) {
				var totalTd = $("<td></td>").append(++num);
				var nameTd = $("<td></td>").append(item.name);
				var deptNoTd = $("<td></td>").append(item.number);
				var empNumTd = $("<td></td>").append(item.empNum);
				var remarkTd = $("<td></td>").append(item.remark);
				var editBtn = $("<button></button>").addClass(
						"btn btn-primary btn-sm").append(
						$("<span></span>").addClass(
								"glyphicon glyphicon-pencil").append("编辑"));
				editBtn.click(function() {
					$("#editDeptModal").modal('show');
					buildDeptInfo(item.id);
				});
				var deleteBtn = $("<button></button>").addClass(
						"btn btn-danger btn-sm").append(
						$("<span></span>")
								.addClass("glyphicon glyphicon-trash").append(
										"删除"));
				deleteBtn.click(function() {
					alert("注意：如果部门中存在员工，则不可以删除");
					if (confirm("确定删除" + item.name + "?")) {
						var deptId = item.id;
						$.ajax({
							url : "${APP_PATH}/deleteDeptment/" + deptId,
							type : "DELETE",
							success : function(result) {
								getDeptPage();
							}
						});
					}

				});
				var operationTd = $("<td></td>").append(editBtn).append(" ")
						.append(deleteBtn);
				var deptItemTr = $("<tr></tr>").append(totalTd).append(deptNoTd)
						.append(nameTd).append(empNumTd).append(remarkTd)
						.append(operationTd);
				deptItemTr.appendTo($("tbody"));
			});
		}
		/*输入完新增的部门名后，判断是否有重复的部门*/
		$("#validateReminder").hide();
		$("#deptName").focusout(function() {
			validateDeptmentName();
		});
		/*向后台请求验证*/
		function validateDeptmentName() {
			console.log("test----");
			$.ajax({
				url : "${APP_PATH}/validateDeptment",
				type : "get",
				data : "deptName=" + $("#deptName").val(),
				success : function(result) {

					if (result == 1) {
						showReminder("部门名已存在");
					} else if (result == 0) {
						$("#validateReminder").hide();
						$("#save_dept_data").attr("disabled", false);
					} else if (result == 2) {
						showReminder("部门名不能为空");
					}
				}
			});
		}

		function showReminder(a) {
			$("#validateReminder").show();
			$("#validateReminder").empty();
			$("#validateReminder").append(a);
			$("#save_dept_data").attr("disabled", true);
		}

		/*添加新部门  */
		$("#dept_add_modal_btn").click(function() {
			$("#addDeptModal").modal('show');
			$("#validateReminder").hide();
		});

		$("#save_dept_data").click(function() {
			$.ajax({
				url : "${APP_PATH}/saveDeptment",
				type : "POST",
				data : $("#addDeptForm").serialize(),
				success : function(result) {
					$("#addDeptModal").modal('hide');
					getDeptPage();
				}
			});
		});
		/* 获取单个部门信息  */
		function buildDeptInfo(deptId) {
			$.ajax({
				url : "${APP_PATH}/getDeptment/" + deptId,
				type : "GET",
				success : function(result) {
					console.log(result);
					$("#editDeptName").val(result.name);
					$("#editDeptRemark").val(result.remark);
					$("#save_edit_dept_data").attr("dept_id", result.id);
					$("#save_edit_dept_data").click(function() {
						updateDeptInfo();
					});
				},
				error : function() {
					console.log("数据获取失败");
				}
			});
		}
		/* 保存更新的数据 */
		function updateDeptInfo() {
			deptId = $("#save_edit_dept_data").attr("dept_id");
			$.ajax({
				url : "${APP_PATH}/updateDeptment/" + deptId,
				type : "PUT",
				data : $("#editDeptForm").serialize(),
				success : function(result) {
					$("#editDeptModal").modal('hide');
					getDeptPage();
					console.log("success");
				}
			});

		}
	</script>
</body>
</html>