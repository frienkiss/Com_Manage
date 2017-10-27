<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.sql.*" %>
<html>
<head><title>跳转页面</title></head>
<body>
<table width="600" border="1" align="center">
		<caption>
			<H2>xx员工工资信息</H2>
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
String sql="select No from pay1 where No='"+no+"'";
ResultSet rs=stmt.executeQuery(sql);
if(!rs.next()){
	%>
	<script>
	alert("不存在此员工编号,请重新输入..");
	history.back();
	</script>
	<%
}
else{
	sql="select No,Name,Year,Month,Base, Bonus, Deduct from pay1 where No='"+no+"'";
	rs=stmt.executeQuery(sql);
	//rs首先指向头节点
	while(rs.next()){
	String name=rs.getString(2);
	String year=rs.getString(3);
	String month=rs.getString(4);
	String base=rs.getString(5);
	String bonus=rs.getString(6);
	String deduct=rs.getString(7); 
	//session.setAttribute("year", year);
	//session.setAttribute("month", month);
	
%>
<form method="post" action="changeDo1.jsp">
 <tr>
			<td height="22" align="center"><input type="text" name="no" value=<%=no%>></td>
			<td height="22" align="center"><input type="text" name="name" value=<%=name%>></td>
			<td height="22" align="center"><input type="text" name="base"value=<%=base%>></td>
			<td height="22" align="center"><input type="text" name="bonus" value=<%=bonus%>></td>
			<td height="22" align="center"><input type="text" name="deduct" value=<%=deduct%>></td>
			<td height="22" align="center"><input type="text" name="year" value=<%=year%>></td>
			<td height="22" align="center"><input type="text" name="month" value=<%=month%>></td>
			<td colspan="6" align="center">
			<input type="submit" value="保存修改"/>
			<input type="reset" value="重置"/></td>
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