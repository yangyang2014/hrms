<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());

%>

<script src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<title>员工列表</title>
</head>
<body>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12"><h1>员工表</h1></div>	
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table" style="border:1px red solid;">
					<tr>
						<th>#</th><th>empName</th>
						<th>gender</th><th>email</th>
						<th>deptName</th><th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list}" var="emp">
						<tr>
						<th>${emp.empId} </th>
						<th>${emp.empName}</th>
						<th>${emp.gender=="M"?"男":"女"}</th>
						<th>${emp.email}</th>
						<th>${emp.dId}</th>
						<td>
							<button class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-pencil"></span>编辑</button>
							<button class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span>删除</button>
						</td>
					</tr>
					
					</c:forEach>
									
				</table>
			
			</div>
			
		</div>
		<div class="row">
			<div class="col-md-4">当前是${pageInfo.pageNum}页，共${pageInfo.pages}页，共有${pageInfo.total}条记录</div>
			<div class="col-md-6 col-md-offset-6">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  	<li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
				    <li>
				    	<c:if test="${pageInfo.pageNum>pageInfo.navigateFirstPage}">
				    		<a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
					        	<span aria-hidden="true">&laquo;</span>
					      	</a>
				    	</c:if>
					      
				    </li>
				    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
				    	<c:if test="${page_Num == pageInfo.pageNum}">	
				    		<li class="active"><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a></li>
				    	</c:if>
				    	<c:if test="${page_Num != pageInfo.pageNum}">	
				    		<li><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a></li>
				    	</c:if>
				    </c:forEach>
				   <c:if test="${pageInfo.pageNum <pageInfo.navigateLastPage}">
				   		<li>
					      <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				   </c:if>
				    
				    <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">末页</a></li>
				  </ul>
				</nav>
			</div>
		</div>
	
	</div>
</body>
</html>