<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head><title>������Ϣ����</title>
</head>
<body>
		<table width="600" border="1" align="center">
		<caption>
			<H2>��˾Ա�����񱨱�</H2>
		</caption>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">���ű��</td>
			<td bgcolor="#A9D0F5" scope="col">��������</td>	
			/*<td bgcolor="#A9D0F5" Scope="col">���ŵ�ַ</td>*/
<%
//html�ļ�����ô��ֹ����
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
		request.setCharacterEncoding("gb2312");
		String sql="select ������Ϣ��.���ű��,������Ϣ��.��������,������Ϣ��.���ŵ�ַ, �����쵼��Ϣ.Name from ������Ϣ��,�����쵼��Ϣ where ������Ϣ��.��������=�����쵼��Ϣ.DeptNo";
		
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next()){
			String no=rs.getString(1);
			String name=rs.getString(2);
			String address=rs.getString(3);
			String peo=rs.getString(4);
			/*String peo=rs.getString(3);*/
			%>
			<tr>
					<td height="22" align="center"><%=no %></td>
			<td height="22" align="center"><%=name %></td>
		  <td height="22" align="center"><%=address %></td>
			<td height="22" align="center"><%=peo %></td>
			</tr>
	<%
				}
			}
			catch(SQLException e){
				out.println(e.getMessage()+"12");
			}
		%>
	<tr>
		<td align="center"><a href="add2.jsp">����</a></td>
		<td align="center"><a href="del2.jsp">ɾ��</a></td>
		<td align="center"><a href="change2.jsp">�޸�</a></td>
	</tr>
	<h5 align="right" color="blue"><a href="manager1.jsp">������һҳ</a></h5>
		</table>
		</body>
		</html>