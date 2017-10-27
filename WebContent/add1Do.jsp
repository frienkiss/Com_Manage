<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*,java.util.*" %>
<html>
<head><title>跳转页面...</title>
</head>
<body>
<%
	request.setCharacterEncoding("gb2312");
	String no=request.getParameter("no");
	String name=request.getParameter("name");
	String sex=request.getParameter("sex");
	String pwd=request.getParameter("password");
	String deptno=request.getParameter("deptno");
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
		//String no=request.getParameter("No");
		String sql="select No from person where No='"+no+"'";
		ResultSet rs=stmt.executeQuery(sql);
		if(rs.next()){
		%>
		<script>
		alert("该员工编号已存在！");
		history.back();
		</script>
		<%
		}else{
		sql="insert into person values('"+no+"','"+name+"','"+sex+"','"+pwd+"','"+deptno+"')";
		stmt.executeUpdate(sql);
		response.sendRedirect("managerinfo.jsp");
		}
		}	catch(SQLException e){
				out.println(e.getMessage());
			}
			
	%>
	</body>
	</html>