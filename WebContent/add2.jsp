<%@ page language="java" contentType="text/html; charset=GBK"%>
<html>
	<head><title>工资信息增加页面</title>
	</head>
<body>
	<form method="post" action=add2Do.jsp>
	<table width="600" border="1" align="center">
		<caption>
			<H2>部门信息添加</H2>
		</caption>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">部门编号</td>
			<td><input type="text" name="no"/></td></tr>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">部门名称</td>
			<td><input type="text" name="name"/></td></tr>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">领导编号</td>
			<td><input type="text" name="num"/></td></tr>
		/*<tr>
		    <td bgcolor="#A9D0F5" scope="col">部门地址</td>
		    <td><input type="text" name="address"/></td></tr>*/
		<tr>
			<td bgcolor="#A9D0F5" scope="col">姓名</td>
			<td><input type="text" name="name1"/></td></tr>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">登录密码</td>
			<td><input type="text" name="pwd"/></td></tr>

		<tr><td colspan="2" align="center">
		<input type="submit" name="submit" value="提交"/>
		<input type="reset" name="reset" value="重置"/>
		</td></tr>
		

</table>
</form>
</body>
</html>