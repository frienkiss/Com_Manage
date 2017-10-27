<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("gb2312");
	String no=request.getParameter("no");
	String name=request.getParameter("name");
	String base=request.getParameter("base");
	String bonus=request.getParameter("bonus");
	String deduct=request.getParameter("deduct");
	String year=request.getParameter("year");
	String month=request.getParameter("month");
	//String year1=(String)session.getAttribute("year");
	//String month1=(String)session.getAttribute("month");
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
//不能set   NO，会出现重复键错误s
String strsql="update pay1 set Name='"+name+"',Year='"+year+"',Month='"+month+"',Base='"+base+"',Bonus='"+bonus+"',Deduct='"+deduct+"' where No='"+no+"'";
int t=stmt.executeUpdate(strsql);
if(t==0){
	%>
	<script>
	alert("修改失败");
	history.back();
	</script>
	<%
}
else{
	response.sendRedirect("managerDo.jsp");
}
}catch(SQLException e){
	out.println(e.getMessage());
}

%>