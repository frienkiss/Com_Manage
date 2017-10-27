<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.sql.*,java.util.*"%>
<html>
<head><title>跳转页面</title>
</head>
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
	String strsql="select No from person where No='"+no+"'";
	ResultSet rs=stmt.executeQuery(strsql);//之前写成executeQuery错误提示没有返回结果集
	if(!rs.next()){

		%>
	<script type="text/javascript">
	alert("不存在此编号，请重新输入！");
	history.back();
	</script>
<%
	
	}
	else{
		strsql="delete from person where No='"+no+"'";
		stmt.executeUpdate(strsql);
		%>
		<script>
		alert("删除成功，正在跳转页面..");
		//不用history.back()
		</script>
		<%
		response.sendRedirect("managerinfo.jsp");//是java语言，不能写在<%外面
	}
}catch(SQLException e){
	out.println(e.getMessage());
}
%>
</html>
