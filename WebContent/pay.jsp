<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
	<head><title>员工信息界面</title>

</head>
<body>
<h4 align="right" color="blue"><a href="manager.jsp">退出</a></h4>
		<table width="600" border="1" align="center">
		<caption>
			<H2>公司员工财务报表</H2>
		</caption>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">员工编号</td>
			<td bgcolor="#A9D0F5" scope="col">姓名</td>	
			<td bgcolor="#A9D0F5" scope="col">基本工资</td>
			<td bgcolor="#A9D0F5" scope="col">奖金</td>
			<td bgcolor="#A9D0F5" scope="col">扣除</td>
		    <td bgcolor="#A9D0F5" scope="col">实际工资</td>
			<td bgcolor="#A9D0F5" scope="clo">日期</td>
		</tr>
<%
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
		//String no=request.getParameter("No");
		String strsql="select No,Name,Year,Month,Base,Bonus,Deduct,Fact from pay1";
		ResultSet rs=stmt.executeQuery(strsql);
		
		while(rs.next()){
			String no=rs.getString(1);
			String name=rs.getString(2);
			String date=rs.getString(3)+"/"+rs.getString(4);
			String base=rs.getString(5);
			String bonus=rs.getString(6);
			String deduct=rs.getString(7); 
			String fact=rs.getString(8);
			

 %>
 <tr>
			<td height="22" align="center"><%=no%></td>
			<td height="22" align="center"><%=name %></td>
			<td height="22" align="center"><%=base %></td>
			<td height="22" align="center"><%=bonus %></td>
			<td height="22" align="center"><%=deduct %></td>
			<td height="22" align="center"><%=fact %></td>
			<td height="22" align="center"><%=date %></td>
</tr>
	<%
				}
			}
			catch(SQLException e){
				out.println(e.getMessage()+"12");
			}
		%>
	<tr>
		<td align="center"><a href="add.jsp">增加</a></td>
		<td align="center"><a href="del.jsp">删除</a></td>
		<td align="center"><a href="change.jsp">修改</a></td>
	</tr>
	
	</table>
	</body>
		
<%//用户信息管理，员工工资信息，