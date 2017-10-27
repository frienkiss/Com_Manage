<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*"%>

<%
	String  no=(String)session.getAttribute("no");
	out.println(no);
	String old=request.getParameter("old");
	String newp=request.getParameter("newp");
	try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
	try{
	String url="jdbc:sqlserver://localhost:1433; DatabaseName=Company";
	String user="sa";
	String password="199515";
	Connection conn=DriverManager.getConnection(url, user,password);
	Statement stmt=conn.createStatement();
	String sql="select Password from person where No='"+no+"'";
	ResultSet rs=stmt.executeQuery(sql);
	if(rs.next()){
		String pass=rs.getString(1);
		if(pass.equals(old)){
			sql="update person set Password='"+newp+"' where No='"+no+"'";
			int t=stmt.executeUpdate(sql);
			if(t==0){
				%>
				<script>
				alert("修改失败");
				history.back();
				</script>
				<%
			}
			else{
				%>
					<script>
				alert("修改成功,点击退出重新登陆！");
				
				history.back();
				</script><%
				
				//response.sendRedirect("worker.jsp");//与worker响应到workerDo冲突,上面的username...不用response
				
			}
			
		}
		else{
			%>
			<script>
			alert("输入的旧密码不正确，请重新输入..");
			history.back();
			</script>
			<%
		}
	}
	}catch(SQLException e){
		out.println(e.getMessage());
	}
	%>
	</body>
	</html>
		