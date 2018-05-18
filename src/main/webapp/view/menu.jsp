<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD id=Head1>
<TITLE>导航</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<STYLE type="text/css">
BODY {
	PADDING-RIGHT: 0px;
	PADDING-LEFT: 0px;
	PADDING-BOTTOM: 0px;
	MARGIN: 0px;
	PADDING-TOP: 0px;
	BACKGROUND-COLOR: #2a8dc8
}

BODY {
	FONT-SIZE: 11px;
	COLOR: #003366;
	FONT-FAMILY: Verdana
}

TD {
	FONT-SIZE: 11px;
	COLOR: #003366;
	FONT-FAMILY: Verdana
}

DIV {
	FONT-SIZE: 11px;
	COLOR: #003366;
	FONT-FAMILY: Verdana
}

P {
	FONT-SIZE: 11px;
	COLOR: #003366;
	FONT-FAMILY: Verdana
}

.mainMenu {
	FONT-WEIGHT: bold;
	FONT-SIZE: 14px;
	CURSOR: hand;
	COLOR: #000000
}

A.style2:link {
	PADDING-LEFT: 4px;
	COLOR: #0055bb;
	TEXT-DECORATION: none
}

A.style2:visited {
	PADDING-LEFT: 4px;
	COLOR: #0055bb;
	TEXT-DECORATION: none
}

A.style2:hover {
	PADDING-LEFT: 4px;
	COLOR: #ff0000;
	TEXT-DECORATION: none
}

A.active {
	PADDING-LEFT: 4px;
	COLOR: #ff0000;
	TEXT-DECORATION: none
}

.span {
	COLOR: #ff0000
}
</STYLE>

<SCRIPT language=javascript>
	function MenuDisplay(obj) {
		for (var i = 1; i <= 4; i++) {
			document.getElementById('table_' + i).style.display = 'none';
			document.getElementById('table_' + i + 'Span').innerText = '＋';
		}
		if (document.getElementById(obj).style.display == 'none') {
			document.getElementById(obj).style.display = 'block';
			document.getElementById(obj + 'Span').innerText = '－';
		} else {
			document.getElementById(obj).style.display = 'none';
			document.getElementById(obj + 'Span').innerText = '＋';
		}
	}
</SCRIPT>
<BODY>
	<FORM id=form1 name=form1 method=post>
		<TABLE cellSpacing=0 cellPadding=0 width=210 align=center border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src=YHMenu.files/new_005.jpg border=0></TD>
					<TD align=middle width=180 background=YHMenu.files/new_006.jpg
						height=35><B>人力资源 －功能菜单</B></TD>
					<TD width=15><IMG src=YHMenu.files/new_007.jpg border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width=210 align=center border=0>
			<TBODY>
				<TR>
					<TD width=15 background=YHMenu.files/new_008.jpg></TD>
					<TD vAlign=top width=180 bgColor=#ffffff>
						<TABLE cellSpacing=0 cellPadding=3 width=165 align=center border=0>
							<TBODY>
							
								
								<TR>
									<TD class=mainMenu onClick="MenuDisplay('table_2');"><SPAN
										class=span id=table_2Span>＋</SPAN> 组织管理</TD>
								</TR>
								<TR>
									<TD>
										<TABLE id=table_2 style="DISPLAY: none" cellSpacing=0
											cellPadding=2 width=155 align=center border=0>
											<TBODY>
												<TR>
													<TD class=menuSmall><A class=style2 href="product/department.jsp"
														target=main>－ 部门岗位</A></TD>
												</TR>
												<TR>
													<TD class=menuSmall><A class=style2 href="product/job.jsp"
														target=main>－ 岗位管理</A></TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>
							
								<TR>
									<TD background=YHMenu.files/new_027.jpg height=1></TD>
								</TR>
							
								<TR>
									<TD class=mainMenu onClick="MenuDisplay('table_1');"><SPAN
										class=span id=table_1Span>＋</SPAN> 员工管理</TD>
								</TR>
								<TR>
									<TD>
										<TABLE id=table_1 style="DISPLAY: none" cellSpacing=0
											cellPadding=2 width=155 align=center border=0>
											<TBODY>
												<TR>
													<TD class=menuSmall><A class=style2
														href="product/employee.jsp" target=main>－ 员工列表</A></TD>
												</TR>

											</TBODY>
										</TABLE>
									</TD>
								</TR>
							
								<TR>
									<TD background=YHMenu.files/new_027.jpg height=1></TD>
								</TR>
								<TR>
									<TD class=mainMenu onClick="MenuDisplay('table_3');"><SPAN
										class=span id=table_3Span>＋</SPAN> 招聘管理</TD>
								</TR>
								<TR>
									<TD>
										<TABLE id=table_3 style="DISPLAY: none" cellSpacing=0
											cellPadding=2 width=155 align=center border=0>
											<TBODY>
												<TR>
													<TD class=menuSmall><A class=style2 href="product/recruitment.jsp"
														target=main>－ 招聘简章</A></TD>
												</TR>
												
											</TBODY>
										</TABLE>
									</TD>
								</TR>
								<TR>
									<TD background=YHMenu.files/new_027.jpg height=1></TD>
								</TR>
								<TR>
									<TD class=mainMenu onClick="MenuDisplay('table_4');"><SPAN
										class=span id=table_4Span>＋</SPAN> 笔试题目</TD>
								</TR>
								<TR>
									<TD>
										<TABLE id=table_4 style="DISPLAY: none" cellSpacing=0
											cellPadding=2 width=155 align=center border=0>
											<TBODY>
												<TR>
													<TD class=menuSmall><A class=style2 href="product/question.jsp"
														target=main>－ 招聘题库</A></TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>

								<TABLE cellSpacing=0 cellPadding=0 width=210 align=center
									border=0>
									<TBODY>
										<TR>
											<TD width=15><IMG src="YHMenu.files/new_010.jpg"
												border=0></TD>
											<TD align=middle width=180
												background=YHMenu.files/new_011.jpg height=15></TD>
											<TD width=15><IMG src="YHMenu.files/new_012.jpg"
												border=0></TD>
										</TR>
									</TBODY>
								</TABLE>
								</FORM>
</BODY>
</HTML>
