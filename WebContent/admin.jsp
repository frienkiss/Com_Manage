<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head><title>����Ա����Ϣ</title></head>
<body>
<%String dept=(String)session.getAttribute("dept");
//out.println(dept);
if(dept.equals("���²�")){
	response.sendRedirect("peomanage.jsp");
}%>

		<h4><%=dept %>����Ա����Ϣ</h4>
		<table width="600" border="1" align="center">
		<tr>
			<td bgcolor="#A9D0F5" scope="col">���</td>	
			<td bgcolor="#A9D0F5" scope="col">����</td>
			<td bgcolor="#A9D0F5" scope="col">�Ա�</td>
			<td bgcolor="#A9D0F5" scope="col">ʵ�ʹ���</td>
			<td bgcolor="#A9D0F5" scope="col">����</td>
			<td bgcolor="#A9D0F5" scope="col">��������</td>
		</tr>
	<%
		request.setCharacterEncoding("gb2312");
		String no=(String)session.getAttribute("no");
		//String pwd=request.getParameter("pwd");
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

		String sql="select person.No,person.Name,person.Sex,person.DeptNo,pay1.Year,pay1.Month,pay1.Fact from person,pay1 where pay1.Name=person.Name and person.DeptNo='"+dept+"'";
		ResultSet rs=stmt.executeQuery(sql);
		//��ѯԱ����Ϣ����ѯԱ������
		
		while(rs.next()){
			String num=rs.getString(1);
			String name=rs.getString(2);
			String sex=rs.getString(3);
			//String dept=rs.getString(4);
			String date=rs.getString(5)+"/"+rs.getString(6);
			String fact=rs.getString(7);
			//String sql="select * from peron where No='"+num+"'";
			//ResultSet rs2=stmt.executeQuery(sql);
			
				//String no=rs2.getString(1);
			
				//String pwd=rs2.getString(4);

			%>
				
	
				 <tr>
			<td height="22" align="center"><%=num%></td>
			<td height="22" align="center"><%=name %></td>
			<td height="22" align="center"><%=sex %></td>
			<td height="22" align="center"><%=fact %></td>
			<td height="22" align="center"><%=date %></td>
			<td height="22" align="center"><%=dept %></td>
</tr><%

		}

		}catch(SQLException e){
			out.println(e.getMessage());
		}
	
		
	%>


</body>
</html>