<%@ page language="java" contentType="text/html; charset=GBK"%>
<html>
	<head><title>工资信息增加页面</title>
	</head>
<body>
	<form method="post" action=add1Do.jsp>
	<table width="600" border="1" align="center">
		<caption>
			<H2>员工信息添加</H2>
		</caption>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">员工编号</td>
			<td><input type="text" name="no"/></td>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">姓名</td>
			<td><input type="text" name="name"/></td>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">性别</td>
			<td><input type="text" name="sex"/></td>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">登录初始密码</td>
			<td><input type="text" name="password"/></td>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">所属部门</td>
			<td><input type="text" name="deptno"/></td>
		</tr>
		<tr><td colspan="2" align="center">
		<input type="submit" name="submit" value="提交"/>
		<input type="reset" name="reset" value="重置"/>
		</td></tr>
		

</table>
</form>
</body>
</html>