<%@ page language="java" contentType="text/html; charset=GBK"%>
<html>
	<head><title>������Ϣ����ҳ��</title>
	</head>
<body>
	<form method="post" action=addDo.jsp>
	<table width="600" border="1" align="center">
		<caption>
			<H2>Ա��������Ϣ���</H2>
		</caption>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">Ա�����</td>
			<td><input type="text" name="no"/></td>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">����</td>
			<td><input type="text" name="name"/></td>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">��������</td>
			<td><input type="text" name="base"/></td>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">����</td>
			<td><input type="text" name="bonus"/></td>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">�۳�</td>
			<td><input type="text" name="deduct"/></td>
		<tr>
			<td bgcolor="#A9D0F5" scope="clo">����</td>
			<td><input type="text" name="year"/></td>
			<td><input type="text" name="month"/></td>
		</tr>
		<tr><td colspan="2" align="center">
		<input type="submit" name="submit" value="�ύ"/>
		<input type="reset" name="reset" value="����"/>
		</td></tr>
		

</table>
</form>
</body>
</html>