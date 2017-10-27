<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head><title>部门信息管理</title>
</head>
<body>
		<table width="600" border="1" align="center">
		<caption>
			<H2>公司员工财务报表</H2>
		</caption>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">部门编号</td>
			<td bgcolor="#A9D0F5" scope="col">部门名称</td>	
			/*<td bgcolor="#A9D0F5" Scope="col">部门地址</td>*/
<%
//html文件中怎么防止乱码
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
		String sql="select 部门信息表.部门编号,部门信息表.部门名称,部门信息表.部门地址, 部门领导信息.Name from 部门信息表,部门领导信息 where 部门信息表.部门名称=部门领导信息.DeptNo";
		
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
		<td align="center"><a href="add2.jsp">增加</a></td>
		<td align="center"><a href="del2.jsp">删除</a></td>
		<td align="center"><a href="change2.jsp">修改</a></td>
	</tr>
	<h5 align="right" color="blue"><a href="manager1.jsp">返回上一页</a></h5>
		</table>
		</body>
		</html>