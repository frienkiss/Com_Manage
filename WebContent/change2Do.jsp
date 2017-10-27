<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.sql.*" %>
<html>
<head><title>跳转页面</title></head>
<body>
<%String no=request.getParameter("no"); %>
<table width="600" border="1" align="center">
		<caption>
			<H2><%=no %>>部门信息</H2>
		</caption>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">部门编号</td>
			<td bgcolor="#A9D0F5" scope="col">部门名称</td>	
			<td bgcolor="#A9D0F5" scope="col">领导编号</td>
			<td bgcolor="#A9D0F5" scope="col">领导姓名</td>	
			<td bgcolor="#A9D0F5" scope="col">登陆密码</td>
			</tr>
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
		String sql="select * from 部门信息表,部门领导信息 where 部门信息表.部门编号='"+no+"' and 部门信息表.部门名称=部门领导信息.DeptNo";
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next()){
			String num=rs.getString(1);
			String name=rs.getString(2);
			String id1=rs.getString(3);
			String peo=rs.getString(4);
			String pwd=rs.getString(5);
			//用id记住原本的no,通过表单传上去
			%>
			<form method="post" action="change2Do2.jsp">
			<tr>
				<td height="22" align="center"><input type="text" name="no" value=<%=num%>></td>
			<td height="22" align="center"><input type="text" name="name" value=<%=name%>></td>
			<td height="22" align="center"><input type="text" name="id1" value=<%=id1%>></td>
			<td height="22" align="center"><input type="text" name="peo" value=<%=peo%>></td>
			<td height="22" align="center"><input type="text" name="pwd" value=<%=pwd%>></td>
			<td colspan="6" align="center">
			<input type="submit" value="保存修改"/>
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
		