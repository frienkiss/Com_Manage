<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.sql.*" %>
<html>
<head><title>��תҳ��</title></head>
<body>
<%String no=request.getParameter("no"); %>
<table width="600" border="1" align="center">
		<caption>
			<H2><%=no %>>������Ϣ</H2>
		</caption>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">���ű��</td>
			<td bgcolor="#A9D0F5" scope="col">��������</td>	
			<td bgcolor="#A9D0F5" scope="col">�쵼���</td>
			<td bgcolor="#A9D0F5" scope="col">�쵼����</td>	
			<td bgcolor="#A9D0F5" scope="col">��½����</td>
			</tr>
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
		String sql="select * from ������Ϣ��,�����쵼��Ϣ where ������Ϣ��.���ű��='"+no+"' and ������Ϣ��.��������=�����쵼��Ϣ.DeptNo";
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next()){
			String num=rs.getString(1);
			String name=rs.getString(2);
			String id1=rs.getString(3);
			String peo=rs.getString(4);
			String pwd=rs.getString(5);
			//��id��סԭ����no,ͨ��������ȥ
			%>
			<form method="post" action="change2Do2.jsp">
			<tr>
				<td height="22" align="center"><input type="text" name="no" value=<%=num%>></td>
			<td height="22" align="center"><input type="text" name="name" value=<%=name%>></td>
			<td height="22" align="center"><input type="text" name="id1" value=<%=id1%>></td>
			<td height="22" align="center"><input type="text" name="peo" value=<%=peo%>></td>
			<td height="22" align="center"><input type="text" name="pwd" value=<%=pwd%>></td>
			<td colspan="6" align="center">
			<input type="submit" value="�����޸�"/>
			<td><input type="hidden" name="id" value="<%=num %>"/></td>
		    <td><input type="hidden" name="num" value="<%=peo %>"/></td>
	        </tr></form>
			
	<%
				}
			}
			catch(SQLException e){
				out.println(e.getMessage()+"12");
			}
		%>
</table>
</body>
</html>		
		