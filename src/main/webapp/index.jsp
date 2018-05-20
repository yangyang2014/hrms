<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>人力资源管理系统</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
</HEAD>

<FRAMESET frameSpacing=0 rows=80,* frameBorder=0>
	<FRAME name=top src="view/top.jsp" frameBorder=0 noResize scrolling=no>


	<%
		String role = (String) session.getAttribute("roleId");
		if (role.equals("1")) {
	%>
	<FRAMESET frameSpacing=0 frameBorder=0>
		<FRAME name=main src="view/product/systemManage.jsp" frameBorder=0>

		<%
			} else if (role.equals("2")) {
		%>
		<FRAMESET frameSpacing=0 frameBorder=0 cols=220,*>
			<FRAME name=menu src="view/menu.jsp" frameBorder=0 noResize>
			<FRAME name=main src="view/product/employee.jsp" frameBorder=0>
			<%
				} else {
			%>
			<FRAMESET frameSpacing=0 frameBorder=0>
				<FRAME name=main src="view/product/user/userHome.jsp" frameBorder=0>
				<%
					}
				%>
			</FRAMESET>
		</FRAMESET>
</HTML>
