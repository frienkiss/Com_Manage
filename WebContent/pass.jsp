<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<html>
	<head><title>修改密码</title></head>
<body>
 <h4 align="right" color="blue"><a href="worker.jsp">退出</a></h4>
<form method="post" action="pwdchange.jsp">
	<%
	request.setCharacterEncoding("gb2312");	%>
	<table>
	
	<tr><td>请输入旧密码：</td><td><input type="password" name="old"/></td></tr>
	
	<tr><td>请输入新密码: </td><td><input type="password" name="newp"/></td></tr>
	<tr><td><input type="submit" value="保存修改"/></td>
	</tr>
	</form><%//为什么这句话显示不了 %>>
	</body>
	</html>