<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<title>面试题</title>
</head>
<body>
	<h1>招聘笔试题</h1>
	<p>本系统支持随机生成面试题，到你指定的目录。点击“随机选取5道笔试题”即可。</p>
	<p>
		<div id="endtime"></div>
		<button id="getQuestionBtn">随机选取5道笔试题</button>
		<div id="endtime"></div>
		<div id="status"><br/><br/><br/></div>
	</p>
	<script>
		var i = 1;
		
		$("#getQuestionBtn").click(function() {
			i=1;
			$("#status").empty();
			deal();
		});
		
		function deal() {
			if (i == 6) {
				$("#status").empty();
				getAndBuildQuestion();
				return;
			}
			getProgress(i++);
			setTimeout(deal, 2000);
		}
		/*获取生成随机题目的状态*/
		function getProgress(status){
			$.ajax({
				url : "${APP_PATH}/getProgress/"+status,
				type : "GET",
				success : function(result) {
					console.log(result);
					buildResult(result.extend.status);
				}
			});
		}
		/*将状态展现到web页面*/
		function buildResult(progressStatus){
			$("#status").append($("<p></p>").append(progressStatus));
		}
		/*获取试题并展示*/
		function getAndBuildQuestion(){
			$.ajax({
				url : "${APP_PATH}/getQuestion",
				type : "GET",
				success : function(result) {
					console.log(result);
					var questions = result.extend.questions;
					var num = 1;
					var resultTitleP = $("<h3></h3>").append("随机抽取的五道题目如下：");
					$("#status").append(resultTitleP);
					$.each(questions,function(index,question){
						var questionP = $("<h4></h4>").append("第"+(num++)+"题、"+question.content);
						$("#status").append(questionP);
					});
					
					
				}
			});
		}
		
	</script>
</body>
</html>