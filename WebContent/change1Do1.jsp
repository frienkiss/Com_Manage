<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("gb2312");
    String id=request.getParameter("id");
	String no=request.getParameter("no");
	String name=request.getParameter("name");
	String sex=request.getParameter("sex");
	String pwd=request.getParameter("password");
	String deptno=request.getParameter("deptno");
	//out.println(pwd+deptno);
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
String strsql="update person set No='"+no+"', Name='"+name+"', Sex='"+sex+"', Password='"+pwd+"', DeptNo='"+deptno+"' where No='"+id+"'";//修改No???!重复键值
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
	response.sendRedirect("managerinfo.jsp");
}
}catch(SQLException e){
	out.println(e.getMessage());
}

%>