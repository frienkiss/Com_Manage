<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<html>
	<head><title>�޸�����</title></head>
<body>
 <h4 align="right" color="blue"><a href="worker.jsp">�˳�</a></h4>
<form method="post" action="pwdchange.jsp">
	<%
	request.setCharacterEncoding("gb2312");	%>
	<table>
	
	<tr><td>����������룺</td><td><input type="password" name="old"/></td></tr>
	
	<tr><td>������������: </td><td><input type="password" name="newp"/></td></tr>
	<tr><td><input type="submit" value="�����޸�"/></td>
	</tr>
	</form><%//Ϊʲô��仰��ʾ���� %>>
	</body>
	</html>