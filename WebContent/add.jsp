<%@ page language="java" contentType="text/html; charset=GBK"%>
<html>
	<head><title>工资信息增加页面</title>
	</head>
<body>
	<form method="post" action=addDo.jsp>
	<table width="600" border="1" align="center">
		<caption>
			<H2>员工工资信息添加</H2>
		</caption>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">员工编号</td>
			<td><input type="text" name="no"/></td>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">姓名</td>
			<td><input type="text" name="name"/></td>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">基本工资</td>
			<td><input type="text" name="base"/></td>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">奖金</td>
			<td><input type="text" name="bonus"/></td>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">扣除</td>
			<td><input type="text" name="deduct"/></td>
		<tr>
			<td bgcolor="#A9D0F5" scope="clo">日期</td>
			<td><input type="text" name="year"/></td>
			<td><input type="text" name="month"/></td>
		</tr>
		<tr><td colspan="2" align="center">
		<input type="submit" name="submit" value="提交"/>
		<input type="reset" name="reset" value="重置"/>
		</td></tr>
		

</table>
</form>
</body>
</html>