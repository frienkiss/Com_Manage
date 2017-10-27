<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.sql.*" %>
<html>
<head><title>跳转页面</title></head>
<body>
<table width="600" border="1" align="center">
		<caption>
			<H2>公司员工个人信息</H2>
		</caption>
		<tr>
			<td bgcolor="#A9D0F5" scope="col">员工编号</td>
			<td bgcolor="#A9D0F5" scope="col">姓名</td>	
			<td bgcolor="#A9D0F5" scope="col">性别</td>
			<td bgcolor="#A9D0F5" scope="col">登录密码</td>
			<td bgcolor="#A9D0F5" scope="col">所属部门</td>
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
	alert("不存在此员工编号,请重新输入..");
	history.back();
	</script>
	<%
}
else{
	sql="select No,Name,Sex,Password,DeptNo from person where No='"+no+"'";
	rs=stmt.executeQuery(sql);
	//rs首先指向头节点
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
			<input type="submit" value="保存修改"/>
			<input type="reset" value="重置"/></td>
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