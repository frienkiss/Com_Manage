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
				alert("�޸�ʧ��");
				history.back();
				</script>
				<%
			}
			else{
				%>
					<script>
				alert("�޸ĳɹ�,����˳����µ�½��");
				
				history.back();
				</script><%
				
				//response.sendRedirect("worker.jsp");//��worker��Ӧ��workerDo��ͻ,�����username...����response
				
			}
			
		}
		else{
			%>
			<script>
			alert("����ľ����벻��ȷ������������..");
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
		