<%@ page language="java" contentType="text/html; charset=GBK"%>
<html>
	<head><title>������Ϣ����ҳ��</title>
	</head>
<body>
	<form method="post" action=add2Do.jsp>
	<table width="600" border="1" align="center">
		<caption>
			<H2>������Ϣ���</H2>
		</caption>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">���ű��</td>
			<td><input type="text" name="no"/></td></tr>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">��������</td>
			<td><input type="text" name="name"/></td></tr>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">�쵼���</td>
			<td><input type="text" name="num"/></td></tr>
		/*<tr>
		    <td bgcolor="#A9D0F5" scope="col">���ŵ�ַ</td>
		    <td><input type="text" name="address"/></td></tr>*/
		<tr>
			<td bgcolor="#A9D0F5" scope="col">����</td>
			<td><input type="text" name="name1"/></td></tr>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">��¼����</td>
			<td><input type="text" name="pwd"/></td></tr>

		<tr><td colspan="2" align="center">
		<input type="submit" name="submit" value="�ύ"/>
		<input type="reset" name="reset" value="����"/>
		</td></tr>
		

</table>
</form>
</body>
</html>