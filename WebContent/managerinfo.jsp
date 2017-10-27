<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head><title>员工信息</title>
</head>

<h4 align="right" color="blue"><a href="manager.jsp">退出</a></h4>
		<table width="600" border="1" align="center">
		<tr>
			<td bgcolor="#A9D0F5" scope="col">编号</td>	
			<td bgcolor="#A9D0F5" scope="col">姓名</td>
			<td bgcolor="#A9D0F5" scope="col">性别</td>
			<td bgcolor="#A9D0F5" scope="col">登录密码</td>
			<td bgcolor="#A9D0F5" scope="col">所属部门</td>
		</tr>
<%
		request.setCharacterEncoding("gb2312");
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
		String sql="select * from person";
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next()){
				String no=rs.getString(1);
				String name=rs.getString(2);
				String sex=rs.getString(3);
				String pwd=rs.getString(4);
				String dept=rs.getString(5);
				%>
					 <tr>
			<td height="22" align="center"><%=no %></td>
			<td height="22" align="center"><%=name %></td>
			<td height="22" align="center"><%=sex %></td>
			<td height="22" align="center"><%=pwd %></td>
			<td height="22" align="center"><%=dept %></td>
</tr>
<%
		}
	}catch(SQLException e){
		out.println(e.getMessage());
	}
%>
	<tr>
		<td align="center"><a href="add1.jsp">增加</a></td>
		<td align="center"><a href="del1.jsp">删除</a></td>
		<td align="center"><a href="change1.jsp">修改</a></td>
	</tr>
<h4 align="right" color="blue"><a href="manager1.jsp">返回上一页</a></h4>
</table>
</html>