<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.sql.*" %>
<html>
<head><title>��תҳ��</title></head>
<body>
<table width="600" border="1" align="center">
		<caption>
			<H2>��˾Ա��������Ϣ</H2>
		</caption>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">Ա�����</td>
			<td bgcolor="#A9D0F5" scope="col">����</td>	
			<td bgcolor="#A9D0F5" scope="col">�Ա�</td>
			<td bgcolor="#A9D0F5" scope="col">��¼����</td>
			<td bgcolor="#A9D0F5" scope="col">��������</td>
		</tr>

<%
request.setCharacterEncoding("gb2312");
String no=request.getParameter("no");
try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}
try{
String url="jdbc:sqlserver://localhost:1433; DatabaseName=Company";
String username="sa";
String password="199515";
Connection conn=DriverManager.getConnection(url, username,password);
Statement stmt=conn.createStatement();
String sql="select No from person where No='"+no+"'";
ResultSet rs=stmt.executeQuery(sql);
if(!rs.next()){
	%>
	<script>
	alert("�����ڴ�Ա�����,����������..");
	history.back();
	</script>
	<%
}
else{
	sql="select No,Name,Sex,Password,DeptNo from person where No='"+no+"'";
	rs=stmt.executeQuery(sql);
	//rs����ָ��ͷ�ڵ�
	if(rs.next()){
	String num=rs.getString(1);
	String name=rs.getString(2);
	String sex=rs.getString(3);
	String pwd=rs.getString(4);
	String deptno=rs.getString(5);
	
%>
<form method="post" action="change1Do1.jsp">
 <tr>
			<td height="22" align="center"><input type="text" name="no" value=<%=num%>></td>
			<td height="22" align="center"><input type="text" name="name" value=<%=name%>></td>
			<td height="22" align="center"><input type="text" name="sex"value=<%=sex%>></td>
			<td height="22" align="center"><input type="text" name="password" value=<%=pwd%>></td>
			<td height="22" align="center"><input type="text" name="deptno" value=<%=deptno%>></td>
			<td colspan="6" align="center">
			<input type="submit" value="�����޸�"/>
			<input type="reset" value="����"/></td>
			<td><input type="hidden" name="id" value=<%=num%>></td>
</tr>
</form>
<%
}}
}catch(SQLException e){
	out.println(e.getMessage());
}
%>
</table>
</body>
</html>