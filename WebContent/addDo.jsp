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
	String base=request.getParameter("base");
	String bonus=request.getParameter("bonus");
	String deduct=request.getParameter("deduct");
	String year=request.getParameter("year");
	String month=request.getParameter("month");
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
		String sql="select No from pay1 where No='"+no+"'";
		ResultSet rs=stmt.executeQuery(sql);
		if(rs.next()){
		%>
		<script>
		alert("该员工编号已存在！");
		history.back();
		</script>
		<%
		}else{
		sql="insert into pay1 values('"+no+"','"+name+"','"+year+"','"+month+"','"+base+"','"+bonus+"','"+deduct+"')";
		stmt.executeUpdate(sql);
		response.sendRedirect("managerDo.jsp");
		}
		}	catch(SQLException e){
				out.println(e.getMessage());
			}
			
	%>
	</body>
	</html>