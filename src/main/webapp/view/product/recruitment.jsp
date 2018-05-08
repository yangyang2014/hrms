<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<script src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<title>招聘简章</title>
</head>
<body>
	<h1>招聘简章</h1>

	<!-- Modal show recruitment info-->
	<div class="modal fade" id="recruitmentInfoModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">保存成功，该招聘信息如下：</h4>
				</div>
				<div class="modal-body" id="recruitmentInfo"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="generateRecruitment" type="button"
						class="btn btn-primary">生成宣传单</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		
		<div class="row">
			<button id="addRecruitInfo" class="btn btn-primary">新增招聘简章</button>
		</div>
		<div class="row">
			<form id="addRecruitInfoForm" class="form-horizontal"
				style="display: none">
				<div class="form-group">
					<label class="col-sm-2 control-label">招聘标题</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="name" name="name"
							value="寻找不一样的你">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">目标</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="destination"
							name="destination" value="为公司发展需求">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">负责人</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="principal"
							name="principal" value="白筱雅">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">招聘地点</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="address"
							name="address" value="南京晓庄学院方山校区">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">招聘时间</label>
					<div class="col-sm-10">
						<input type="date" class="form-control" id="time" name="time"
							value="2018-5-20">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">需求情况</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="employeeinneed"
							name="employeeinneed" value="研发人员  2名">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-4 col-sm-offset-4">
						<button id="save_recruit_data" type="button" class="btn">保存</button>
					</div>
				</div>

			</form>
		</div>
		<div class="row">
			<button id="historyRecruitInfo" class="btn btn-primary">查看历史简章</button>
		</div>
		<div id="recruitmentInfoList" class="row">
			<table id="recruitmeng_table" class="table">
					<thead>
						<tr>
							<th>#</th><th>名称</th>
							<th>负责人</th><th>时间</th>
							<th>地点</th><th>操作</th>
						</tr>
					</thead>
					<tbody><tr></tr></tbody>					
				</table>
		</div>
	</div>
	<script>
	
		$("#historyRecruitInfo").click(function(){
			$.ajax({
				url : "${APP_PATH}/getRecruitmentTask",
				type : "GET",
				success : function(result) {
					$("#recruitmeng_table tbody").empty();
					console.log(result);
					$.each(result,function(index,item){
						var idTd = $("<td></td>").append(item.id);
						var nameTd = $("<td></td>").append(item.name);
						var principalTd = $("<td></td>").append(item.principal);
						var addressTd = $("<td></td>").append(item.address);
						var timeTd = $("<td></td>").append(Millisecond2Date(item.time));
						var infoBtn = $("<button></button>").append("查看");
						$(infoBtn).click(function(){
							$.ajax({
								url : "${APP_PATH}/getRecruitmentTaskById/"+item.id,
								type : "GET",
								success : function(result){
									var recruit = result.extend.recruit;
									buildRecruitInfo(recruit);
								}
							});
						});
						var tr = $("<tr></tr").append(idTd).append(nameTd).append(principalTd)
								.append(timeTd).append(addressTd).append(infoBtn);
						$("#recruitmeng_table tbody").append(tr);
						
					});
				}
			});
			
			
		});
	
		$("#save_recruit_data").click(
				function() {
					var recruitData = $("#addRecruitInfoForm").serialize();
					$.ajax({
						url : "${APP_PATH}/addRecruitmentTask",
						type : "POST",
						data : $("#addRecruitInfoForm").serialize(),
						success : function(result) {
							var recruit = result.extend.recruit;
							$("#addRecruitInfoForm").css("display", "none");
							buildRecruitInfo(recruit);

						}
					});
				});

		$("#addRecruitInfo").click(function() {
			$("#addRecruitInfoForm").css("display", "block");
		});
		
		function buildRecruitInfo(recruit){
			$("#recruitmentInfo").empty();
			var titleP = $("<p></p>").append(
					"标题:" + recruit.name);
			var destinationP = $("<p></p>").append(
					"目的:" + recruit.destination);
			var principalP = $("<p></p>").append(
					"负责人:" + recruit.principal);
			var timeP = $("<p></p>").append(
					"时间:" + Millisecond2Date(recruit.time));
			var addressP = $("<p></p>").append(
					"地点:" + recruit.address);
			var employeeinneedP = $("<p></p>").append(
					"需求:" + recruit.employeeinneed);
			$("#recruitmentInfo").append(titleP).append(
					destinationP).append(principalP).append(
					timeP).append(addressP).append(
					employeeinneedP);
			$("#generateRecruitment").click(function() {
				$.ajax({
					url:"${APP_PATH}/generateRecruitmentDocx",
					data:recruit,
					type:"POST",
					success:function(result){
						$("#recruitmentInfoModal").modal('hide');
						alert("成功生成！请到相应的目录查看");
					}
				});
			});
			$("#recruitmentInfoModal").modal({
				backdrop : 'static'
			});
		}
		
		function Millisecond2Date(time){
			var date = new Date(time);
			var year = date.getFullYear();
			var month = date.getMonth()+1;
			var day = date.getDate();
			return year+'-'+month+'-'+day;
		}
	</script>
</body>
</html>